/*
 * Copyright (c) 2011-2013, Apinauten GmbH
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
*  * Redistributions of source code must retain the above copyright notice, this
*    list of conditions and the following disclaimer.
*  * Redistributions in binary form must reproduce the above copyright notice,
*    this list of conditions and the following disclaimer in the documentation
*    and/or other materials provided with the distribution.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
* OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
* OF THE POSSIBILITY OF SUCH DAMAGE.
*
* THIS FILE IS GENERATED AUTOMATICALLY. DON'T MODIFY IT.
*/
#import "AOMModelStore.h"
#import "AOMAbstractClientDataModel.h"

#pragma mark - Private Interface

@interface AOMModelStore ()
@property (nonatomic, strong) NSMutableDictionary *store;
@property (nonatomic) BOOL useIncompleteReferences;
@end

#pragma mark - Implementation

@implementation AOMModelStore

@synthesize store = m_store;
@synthesize useIncompleteReferences = m_useIncompleteReferences;

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self)
    {
        m_store = [[NSMutableDictionary alloc] init];
        m_useIncompleteReferences = false;
    }
    return self;
}

#pragma mark -

- (void)addModel:(AOMAbstractClientDataModel*)_model
{
    NSMutableDictionary *models = (NSMutableDictionary*)[m_store objectForKey:NSStringFromClass([_model class])];
    
    if (!models)
    {
        models = [[NSMutableDictionary alloc] init];
        [m_store setObject:models forKey:NSStringFromClass([_model class])];
    }
    
    // add new object
    [models setObject:_model forKey:[_model getHref]];
}

- (void)removeModel:(AOMAbstractClientDataModel*)_model
{
    NSMutableDictionary *models = (NSMutableDictionary*)[m_store objectForKey:NSStringFromClass([_model class])];
    [models removeObjectForKey:[_model getHref]];
    
    // clean up
    if ([models count] == 0)
    {
        [m_store removeObjectForKey:NSStringFromClass([_model class])];
    }
}

- (AOMAbstractClientDataModel*)modelWithHref:(NSString*)_href
{
    for (NSMutableDictionary *models in [m_store allValues])
    {
        if ([models objectForKey:_href])
        {
            return [models objectForKey:_href];
        }
    }
    return nil;
}

- (AOMAbstractClientDataModel*)modelWithHref:(NSString*)_href andClass:(Class)_class
{
    NSMutableDictionary *models = (NSMutableDictionary*)[m_store objectForKey:NSStringFromClass(_class)];
    return (AOMAbstractClientDataModel*)[models objectForKey:_href];
}

- (NSMutableArray*)modelsWithClass:(Class)_class
{
    // sort list by creation time
    return [self modelsWithClass:_class sortedWithComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[(AOMAbstractClientDataModel*)obj1 getCreatedAt] compare:[(AOMAbstractClientDataModel*)obj2 getCreatedAt]];
    }];
}

- (NSMutableArray*)modelsWithClass:(Class)_class sortedWithComparator:(NSComparator)_cmptr
{
    NSMutableDictionary *result = (NSMutableDictionary*)[m_store objectForKey:NSStringFromClass(_class)];
    if (!result) return nil;
    
    NSMutableArray *models = [[result allValues] mutableCopy];
    
    if (_cmptr)
    {
        [models sortUsingComparator:_cmptr];
    }
    
    return models ;
}

- (NSMutableArray*)modelsWithClass:(Class)_class andPredicate:(NSPredicate*)_predicate sortedWithComparator:(NSComparator)_cmptr
{
    return [[[self modelsWithClass:_class sortedWithComparator:_cmptr] filteredArrayUsingPredicate:_predicate] mutableCopy];
}

- (NSUInteger)size
{
    return [m_store count];
}

- (void)clear
{
    [m_store removeAllObjects];
    [self save];
}


#pragma mark - Debug

- (NSString*)description
{
    NSString *descr = @"";
    for (NSString *class in m_store)
    {
        descr = [descr stringByAppendingFormat:@"In Store: %@", class];
        for (NSString *href in [m_store objectForKey:class])
        {
            descr = [descr stringByAppendingFormat:@"\n--> %@", href];
        }
        descr = [descr stringByAppendingString:@"\n"];
    }
    return descr;
}

#pragma mark - Persistence

- (NSString *)modelStoreFilePath
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"ModelStore.plist"];
}

- (BOOL)save
{
    return [NSKeyedArchiver archiveRootObject:m_store
                                       toFile:[self modelStoreFilePath]];
}

- (BOOL)load
{
    // store already loaded?
    if ([self.store count] > 0)
    {
        return YES;
    }
    
    NSString *filePath =[self modelStoreFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        @try
        {
            self.store = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
            
            if (self.store && [self.store count] > 0)
            {
                return YES;
            }
            return YES;
        }
        @catch (NSException *exception)
        {
            NSLog(@"Can't load store from file: %@", exception);
            
            // For error information
            NSError *error;
            // Create file manager
            NSFileManager *fileMgr = [NSFileManager defaultManager];
            
            // Attempt to delete the file at filePath
            if ([fileMgr removeItemAtPath:filePath error:&error] != YES)
                NSLog(@"Unable to delete file: %@", [error localizedDescription]);
        }
    }
    return NO;
}

- (BOOL)useIncompleteReferences
{
    return m_useIncompleteReferences;
}
- (void)setUseIncompleteReferences:(BOOL) useIncompleteRefs
{
    m_useIncompleteReferences = useIncompleteRefs;
}
@end