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
#import "FLEExpense.h"
#import "AOMDatastore.h"
#import "AOMModelStore.h"
#import "AOMModelHelper.h"
#import "NSString+Extensions.h"
#import "User.h"

/*
* Generated class for your FLEExpense data model 
*/
@implementation FLEExpense
    @synthesize user;
- (void) initAttributes {
    [super initAttributes];
}
- (id) init {
    self = [super init];
    if (self) {
        [self initAttributes];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initAttributes];
    }
    return self;
}

     + (NSString*)getSimpleName    {
        return @"FLEExpense";
    }
    + (NSString*)getModuleName    {
        return @"PayOffMain";
    }

+ (NSMutableArray*)getWithQuery:(NSString*) _query{
    return [[AOMDatastore sharedInstance] loadListFromServerWithClass:[FLEExpense class] andQuery:_query];
}
+ (void)getAsyncWithQuery:(NSString*) _query withBlock:(AOMBlockWithResults) _block{
    [[AOMDatastore sharedInstance] loadListFromServerAsyncWithClass:[FLEExpense class] andQuery:_query andFinishingBlock:_block];
}

        
        - (AOMUser*)loadUser{
        NSString* refUrl = [[self data] objectForKey:@"userHref"];   
            user = [[AOMUser alloc] init];
            [[AOMDatastore sharedInstance] loadFromServerWithHref:refUrl andStoreIn:user];
            //If there no href than return cause object isn't on server
            if([user getHref]==Nil) {
                return Nil;
            }
            return user;    
    }
    
    - (void)loadUserAsync:(AOMEmptyBlock)_block {
        NSString* refUrl = [[self data] objectForKey:@"userHref"];
        user = [[AOMUser alloc] init];
        [[AOMDatastore sharedInstance] loadFromServerAsyncWithHref:refUrl andStoreIn:user andFinishingBlock:^(AOMAbstractClientDataModel *model, NSError *error) {
        //If there no href than return error because object isn't on server
        if(error || [user getHref]==Nil) {
            if(error == FALSE) {
                error = [AOMDatastore createApiomatErrorWithStatus:AOMHREF_NOT_FOUND];
            }
            user = nil;
        }

        if (_block) {
            _block(error);
        }
    }];
    }
    - (NSString*)postUser:(AOMUser*) _refData  {
            NSString* href = [_refData getHref];
            if([NSString isEmptyString:href])
            {
                [AOMDatastore raiseApiomatExceptionWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
                return Nil;
            }
            NSString* linkedHref = [[AOMDatastore sharedInstance] postOnServer:_refData withHref:[[self data] objectForKey:@"userHref"]];
            //if object was saved than add to local collection or set local variable
                        if(linkedHref) 
            {
                user = _refData;
                            [self addRefModelHrefWithName:@"user" andHref:href];
            }
            return href;
    }
    
    - (void)postUserAsync:(AOMUser*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* href = [_refData getHref];
        if([NSString isEmptyString:href])
        {
            [AOMDatastore createApiomatErrorWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
            return;
        }
        [[AOMDatastore sharedInstance] postOnServerAsync:_refData withHref:[[self data] objectForKey:@"userHref"] andFinishingBlock:^(NSString *linkedHref, NSError *error) {
            if(error == FALSE && linkedHref) {
                user = _refData;
                [self addRefModelHrefWithName:@"user" andHref:href];
            }
            if(_block) {
                _block(error);
            }
        }];
    }
    
    - (void)removeUser:(AOMUser*) _refData  {
        NSString* refUrl = [[self data] objectForKey:@"userHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        BOOL wasDeleted = [[AOMDatastore sharedInstance] deleteOnServerWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID]];
        if(wasDeleted) {
            user = nil;
            [self removeFromRefModelHrefsWithName:@"user" andHref:refHref];
        }
    }
    
    - (void)removeUserAsync:(AOMUser*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* refUrl = [[self data] objectForKey:@"userHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        [[AOMDatastore sharedInstance] deleteOnServerAsyncWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID] withFinishingBlock:^(NSError *error) {
            if(error == FALSE) {
                user = nil;
                [self removeFromRefModelHrefsWithName:@"user" andHref:refHref];
            }
            
            if(_block) {
                _block(error);
            }
        }];
    }
        - (AOMUser*)user{
        if(user==nil && [[AOMDatastore sharedInstance] modelStore]) {
            NSMutableArray* hrefsOfObj = [self getRefModelHrefsForName:@"user"];
            if([hrefsOfObj count] == 1) {
                user = (AOMUser*) [[[AOMDatastore sharedInstance] modelStore] modelWithHref:[hrefsOfObj objectAtIndex:0] andClass:[AOMUser class]];
            }
        }
        return user;
    }
        
     - ( double )price {


 NSNumber* val = [[self data] objectForKey:@"price"];
 return [val doubleValue];
}

            - (void)setPrice:( double )_price {
                            [[self data] setObject:[NSNumber  numberWithDouble :_price] forKey:@"price"];
                        }
        
     - ( NSString* )item {


 return [[self data] objectForKey:@"item"];
}

            - (void)setItem:( NSString* )_item {
                            [[self data] setObject:_item?:[NSNull null] forKey:@"item"];
                        }
        
        - (NSDate*)timestamp {
        double timeInMs = [[[self data] objectForKey:@"timestamp"] doubleValue];
        if(timeInMs)
        {
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeInMs/1000];
            return date;
        }
        return nil;
    }
    - (void)setTimestamp:(NSDate*) _timestamp {
        double timeInS = [_timestamp timeIntervalSince1970] * 1000;
        [[self data] setValue:[NSNumber numberWithDouble: timeInS] forKey:@"timestamp"] ;
    }
        
     - ( long )quantity {


 NSNumber* val = [[self data] objectForKey:@"quantity"];
 return [val longValue];
}

            - (void)setQuantity:( long )_quantity {
                            [[self data] setObject:[NSNumber  numberWithLong :_quantity] forKey:@"quantity"];
                        }

@end

