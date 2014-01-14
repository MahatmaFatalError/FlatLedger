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
#import "FLEUser.h"
#import "AOMDatastore.h"
#import "AOMModelStore.h"
#import "AOMModelHelper.h"
#import "NSString+Extensions.h"
#import "FLELedger.h"

/*
* Generated class for your FLEUser data model 
*/
@implementation FLEUser
    @synthesize ledger;
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

- (void)loadMe{
    [self initDSWithMembersCredsIfNeeded];
    NSString* href =[baseUrl stringByAppendingFormat: @"/models/me"];
    [self loadWithHref:href];
}
- (void)loadMeAsyncWithFinishingBlock:(AOMEmptyBlock) _block{
    [self initDSWithMembersCredsIfNeeded];
    NSString* href =[baseUrl stringByAppendingFormat: @"/models/me"];
    [self loadAsyncWithHref:href andBlock:_block];
}

- (BOOL)save{
    [self initDSWithMembersCredsIfNeeded];
    return [super save];
}

- (void)saveAsyncWithBlock:(AOMEmptyBlock) _block{
    [self initDSWithMembersCredsIfNeeded];
    [super saveAsyncWithBlock:_block];
}

- (void)requestNewPassword{
    [[AOMDatastore sharedInstance] postOnServerAsync:self withHref:@"models/requestResetPassword/" andFinishingBlock:^(NSString *href, NSError *error) {
        NSLog(@"Requesting new password: %@", error);
    }];
}

- (void)resetPassword:(NSString*) _newPassword{
    [[self data] setObject:_newPassword?:[NSNull null] forKey:@"password"];
    [[AOMDatastore sharedInstance] updateOnServer:self];
    [AOMDatastore configureWithUser:self];
}


- (void)resetPasswordAsync:(NSString*) _newPassword andWithFinishingBlock: (AOMEmptyBlock) _block{
    [[self data] setObject:_newPassword?:[NSNull null] forKey:@"password"];
    [[AOMDatastore sharedInstance] updateOnServerAsync:self withFinishingBlock:^(NSError *error) {
        if(error == Nil)
        {
            /* Configure AOMDatastore with new user credentials */
            [AOMDatastore configureWithUser:self];
        }
        //Call caller
        if(_block)
        {
            _block(error);
        }
    }];
}

- (void)initDSWithMembersCredsIfNeeded{
    if([AOMDatastore sharedInstance].userName == false || [AOMDatastore sharedInstance].password == false)
    {
        if([self userName] && [self password])
        {
            [AOMDatastore configureWithUser:self];
        }
    }
}

     + (NSString*)getSimpleName    {
        return @"FLEUser";
    }
    + (NSString*)getModuleName    {
        return @"PayOffMain";
    }

+ (NSMutableArray*)getWithQuery:(NSString*) _query{
    return [[AOMDatastore sharedInstance] loadListFromServerWithClass:[FLEUser class] andQuery:_query];
}
+ (void)getAsyncWithQuery:(NSString*) _query withBlock:(AOMBlockWithResults) _block{
    [[AOMDatastore sharedInstance] loadListFromServerAsyncWithClass:[FLEUser class] andQuery:_query andFinishingBlock:_block];
}

        
     - ( NSString* )isLoggedIn {


 return [[self data] objectForKey:@"isLoggedIn"];
}

            - (void)setIsLoggedIn:( NSString* )_isLoggedIn {
                            [[self data] setObject:_isLoggedIn?:[NSNull null] forKey:@"isLoggedIn"];
                        }
        
        - (FLELedger*)loadLedger{
        NSString* refUrl = [[self data] objectForKey:@"ledgerHref"];   
            ledger = [[FLELedger alloc] init];
            [[AOMDatastore sharedInstance] loadFromServerWithHref:refUrl andStoreIn:ledger];
            //If there no href than return cause object isn't on server
            if([ledger getHref]==Nil) {
                return Nil;
            }
            return ledger;    
    }
    
    - (void)loadLedgerAsync:(AOMEmptyBlock)_block {
        NSString* refUrl = [[self data] objectForKey:@"ledgerHref"];
        ledger = [[FLELedger alloc] init];
        [[AOMDatastore sharedInstance] loadFromServerAsyncWithHref:refUrl andStoreIn:ledger andFinishingBlock:^(AOMAbstractClientDataModel *model, NSError *error) {
        //If there no href than return error because object isn't on server
        if(error || [ledger getHref]==Nil) {
            if(error == FALSE) {
                error = [AOMDatastore createApiomatErrorWithStatus:AOMHREF_NOT_FOUND];
            }
            ledger = nil;
        }

        if (_block) {
            _block(error);
        }
    }];
    }
    - (NSString*)postLedger:(FLELedger*) _refData  {
            NSString* href = [_refData getHref];
            if([NSString isEmptyString:href])
            {
                [AOMDatastore raiseApiomatExceptionWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
                return Nil;
            }
            NSString* linkedHref = [[AOMDatastore sharedInstance] postOnServer:_refData withHref:[[self data] objectForKey:@"ledgerHref"]];
            //if object was saved than add to local collection or set local variable
                        if(linkedHref) 
            {
                ledger = _refData;
                            [self addRefModelHrefWithName:@"ledger" andHref:href];
            }
            return href;
    }
    
    - (void)postLedgerAsync:(FLELedger*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* href = [_refData getHref];
        if([NSString isEmptyString:href])
        {
            [AOMDatastore createApiomatErrorWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
            return;
        }
        [[AOMDatastore sharedInstance] postOnServerAsync:_refData withHref:[[self data] objectForKey:@"ledgerHref"] andFinishingBlock:^(NSString *linkedHref, NSError *error) {
            if(error == FALSE && linkedHref) {
                ledger = _refData;
                [self addRefModelHrefWithName:@"ledger" andHref:href];
            }
            if(_block) {
                _block(error);
            }
        }];
    }
    
    - (void)removeLedger:(FLELedger*) _refData  {
        NSString* refUrl = [[self data] objectForKey:@"ledgerHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        BOOL wasDeleted = [[AOMDatastore sharedInstance] deleteOnServerWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID]];
        if(wasDeleted) {
            ledger = nil;
            [self removeFromRefModelHrefsWithName:@"ledger" andHref:refHref];
        }
    }
    
    - (void)removeLedgerAsync:(FLELedger*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* refUrl = [[self data] objectForKey:@"ledgerHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        [[AOMDatastore sharedInstance] deleteOnServerAsyncWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID] withFinishingBlock:^(NSError *error) {
            if(error == FALSE) {
                ledger = nil;
                [self removeFromRefModelHrefsWithName:@"ledger" andHref:refHref];
            }
            
            if(_block) {
                _block(error);
            }
        }];
    }
        - (FLELedger*)ledger{
        if(ledger==nil && [[AOMDatastore sharedInstance] modelStore]) {
            NSMutableArray* hrefsOfObj = [self getRefModelHrefsForName:@"ledger"];
            if([hrefsOfObj count] == 1) {
                ledger = (FLELedger*) [[[AOMDatastore sharedInstance] modelStore] modelWithHref:[hrefsOfObj objectAtIndex:0] andClass:[FLELedger class]];
            }
        }
        return ledger;
    }

@end

