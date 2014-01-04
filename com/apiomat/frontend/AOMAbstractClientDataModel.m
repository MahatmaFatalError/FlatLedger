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
#import "AOMAbstractClientDataModel.h"
#import "NSString+Extensions.h"
#import "User.h"
#import "AOMDatastore.h"

@interface AOMAbstractClientDataModel ()
@property (strong, nonatomic) NSString *href;
- (NSString *) getType;
@end

@implementation AOMAbstractClientDataModel

@synthesize data = m_data;
@synthesize href = m_href;
@synthesize objectState = m_objectState;
- (void) initAttributes {
}

-(id)init {
    if (self = [super init])
    {
        m_data = [[NSMutableDictionary alloc] init];
        [m_data setValue:[self getType] forKey:@"@type"];
        m_objectState = ObjectState_NEW;
    }
    return self;
}

#pragma mark - NSCoding delegate for archiving
- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init]))
    {
        m_data = [decoder decodeObjectForKey:@"kWrappedModel"];
        m_href = [decoder decodeObjectForKey:@"kWrappedModelHref"];
        m_objectState = [decoder decodeIntForKey:@"kWrappedModelObjectstate"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:m_data forKey:@"kWrappedModel"];
    [encoder encodeObject:m_href forKey:@"kWrappedModelHref"];
    [encoder encodeInt:m_objectState forKey:@"kWrappedModelObjectstate"];
}

- (NSString*)debugDescription
{
    return [NSString stringWithFormat:@"%@", [self data]];
}

- (NSString*)description
{
    return [self getHref];
}

/**
 * Returns the unique type of this data model to get identified via REST interface
 *
 */
- (NSString *) getType
{
    return [NSString stringWithFormat:@"%@$%@",[[self class] performSelector:@selector(getModuleName)] , [[self class] performSelector:@selector(getSimpleName)]];
}

- (NSString *) getHref
{
    return [self href];
}

- (NSString *) getForeignId
{
    return [self.data objectForKey: (@"foreignId")];
}

- (void) setForeignId: (NSString*) _foreignID
{
    [[self data] setObject:_foreignID forKey:@"foreignId"];
}

- (NSDate *) getCreatedAt
{
    return [NSDate dateWithTimeIntervalSince1970:[[self.data objectForKey: (@"createdAt")]longLongValue]/1000];
}

- (NSDate *) getLastModifiedAt
{
    return [NSDate dateWithTimeIntervalSince1970:[[self.data objectForKey: (@"lastModifiedAt")]longLongValue]/1000];
}
- (NSString *) getAppName
{
    return [self.data objectForKey: (@"applicationName")];
}
+ (NSString *) getSimpleName
{
    NSAssert(false, @"You must override %@ in a subclass", NSStringFromSelector(_cmd));
    return nil;
}
+ (NSString *) getModuleName
{
    NSAssert(false, @"You must override %@ in a subclass", NSStringFromSelector(_cmd));
    return nil;
}

- (void) fromJson : (NSString*)_jsonData
{
    if([_jsonData isEqualToString:@"[]"]) {
        return;
    }
    if (_jsonData) [self fromJSONWithObject:[_jsonData yajl_JSON]];
}

- (void) fromJSONWithObject:(NSMutableDictionary*)_jsonObject
{
    
    self.data = _jsonObject;
    self.href=[self.data objectForKey: (@"href")];
}

- (NSString *) toJson
{
    // NSString result = [@"%@", [m_data yajl_JSONString]]
    NSLog(@"json:%@",[m_data yajl_JSONString] );
    return [m_data yajl_JSONString];
}
#pragma mark - CRUD operations
- (BOOL) save
{
    BOOL ret = NO;
    if (m_href)
    {
        ret = [[AOMDatastore sharedInstance] updateOnServer:self];
    } else {
        NSString* location = [[AOMDatastore sharedInstance] postOnServer:self];
        ret=[NSString isEmptyString:location]==NO;
    }
    [self load];
    NSLog(@"return String from Save:%@", ret ?@"true":@"false");
    return ret;
}

- (void) load
{
    [[AOMDatastore sharedInstance]loadFromServerWithHref:[self getHref]  andStoreIn:self];
}

- (void) loadWithHref: (NSString*) _href
{
    [[AOMDatastore sharedInstance]loadFromServerWithHref:_href andStoreIn:self];
    
    self.href=[self.data objectForKey: (@"href")];
}
- (BOOL) delete
{
    return [[AOMDatastore sharedInstance] deleteOnServer:self];
}

#pragma mark - Async CRUD operations
- (void) saveAsyncWithBlock:(AOMEmptyBlock) _block
{
    __block NSError *_error = Nil;
    if (m_href)
    {
        [[AOMDatastore sharedInstance] updateOnServerAsync:self withFinishingBlock:^(NSError *error) {
            _error = error;
            if(_error == FALSE)
            {
                [self loadAsyncWithBlock:^(NSError *error) {
                    //Call caller
                    if(_block)
                    {
                        //Use error from prev req if exists
                        _block(_error?:error);
                    }
                }];
            }
            else if(_block)
            {
                _block(_error);
            }
        }];
    }
    else
    {
        [[AOMDatastore sharedInstance] postOnServerAsync:self withFinishingBlock:^(NSString *href, NSError *error) {
            _error = error;
            if(_error == FALSE)
            {
                [self loadAsyncWithBlock:^(NSError *error) {
                    //Call caller
                    if(_block)
                    {
                        //Use error from prev req if exists
                        _block(_error?:error);
                    }
                }];
            }
            else if(_block)
            {
                _block(_error);
            }
        }];
    }
}
- (void) loadAsyncWithBlock:(AOMEmptyBlock) _block
{
    [[AOMDatastore sharedInstance] loadFromServerAsyncWithHref:[self getHref] andStoreIn:self andFinishingBlock:^(AOMAbstractClientDataModel *model, NSError *error) {
        if(_block)
        {
            _block(error);
        }
    }];
}
- (void) loadAsyncWithHref:_modelHref andBlock:(AOMEmptyBlock) _block
{
    [[AOMDatastore sharedInstance] loadFromServerAsyncWithHref:_modelHref andStoreIn:self andFinishingBlock:^(AOMAbstractClientDataModel *model, NSError *error) {
        if(error==FALSE)
        {
            self.href=[self.data objectForKey: (@"href")];
        }
        
        if(_block)
        {
            _block(error);
        }
    }];
}
- (void) deleteAsyncWithBlock:(AOMEmptyBlock) _block
{
    [[AOMDatastore sharedInstance] deleteOnServerAsync:self withFinishingBlock:^(NSError *error) {
        if(_block)
        {
            _block(error);
        }
    }];
}

- (BOOL) getRestrictResourceAccess
{
    NSString *value = [self.data objectForKey:@"restrictResourceAccess"];
    return [value boolValue];
}

- (void) setRestrictResourceAccess: (BOOL)_restrictedResourceAccess
{
    NSString *value =  (_restrictedResourceAccess) ? @"true" : @"false";
    [self.data setObject:value forKey:@"restrictResourceAccess"];
}

- (NSMutableArray*) getAllowedRolesGrant
{
    return [self.data objectForKey:@"allowedRolesGrant"];
}

- (void) setAllowedRolesGrant:(NSMutableArray*) _allowedRolesGrant
{
    [self.data setObject:_allowedRolesGrant forKey:@"allowedRolesGrant"];
}

- (NSMutableArray*) getAllowedRolesWrite
{
    return [self.data objectForKey:@"allowedRolesWrite"];
}

- (void) setAllowedRolesWrite:(NSMutableArray*) _allowedRolesWrite
{
    [self.data setObject:_allowedRolesWrite forKey:@"allowedRolesWrite"];
}

- (NSMutableArray*) getAllowedRolesRead
{
    return [self.data objectForKey:@"allowedRolesRead"];
}

- (void) setAllowedRolesRead:(NSMutableArray*) _allowedRolesRead
{
    [self.data setObject:_allowedRolesRead forKey:@"allowedRolesRead"];
}

#pragma mark - other stuff
+ (NSString *) getSystem {
    return AMSystem;
}

+ (NSMutableArray*)getWithQuery: (NSString*) _query {
    //is overwritten by concrete classes
    return nil;
}

+ (void)getAsyncWithQuery: (NSString*) _query withBlock:(AOMBlockWithResults) _block
{
    //is overwritten by concrete classes
}

- (NSMutableDictionary* ) getRefModelHrefs {
    return [self.data objectForKey: (@"referencedHrefs")];
}

- (NSMutableArray* ) getRefModelHrefsForName:(NSString*) _name {
    NSMutableArray* linkedHrefs = [[NSMutableArray alloc] init];
    NSMutableDictionary* linkedHrefsMap =  [self getRefModelHrefs];
    if(linkedHrefsMap) {
        linkedHrefs = [linkedHrefsMap objectForKey:_name];
    }
    return linkedHrefs;
}

- (void) addRefModelHrefWithName:(NSString*) _name andHref:(NSString*)_href {
    NSMutableDictionary* linkedHrefsMap =  [self getRefModelHrefs];
    if(linkedHrefsMap) {
        NSMutableArray* hrefsForName = [linkedHrefsMap objectForKey:_name];
        if(hrefsForName==nil) {
            hrefsForName = [[NSMutableArray alloc] init];
            [linkedHrefsMap setObject:hrefsForName forKey:_name];
        }
        
        if([hrefsForName containsObject:_href]==NO) {
            [hrefsForName addObject:_href];
        }
    }
}

- (void) removeFromRefModelHrefsWithName:(NSString*)_name andHref:(NSString*)_href {
    NSMutableArray* linkedHrefsMap =  [self getRefModelHrefsForName:_name];
    if(linkedHrefsMap) {
        [linkedHrefsMap removeObject:_href];
    }
}

#pragma mark -
- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[AOMAbstractClientDataModel class]])
    {
        return ([[self getHref] isEqualToString:[(AOMAbstractClientDataModel*)object getHref]]);
    }
    return NO;
}
@end