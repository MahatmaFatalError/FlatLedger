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
#import "FLELedger.h"
#import "AOMDatastore.h"
#import "AOMModelStore.h"
#import "AOMModelHelper.h"
#import "NSString+Extensions.h"
#import "FLEUser.h"
#import "FLEPeriod.h"

/*
* Generated class for your FLELedger data model 
*/
@implementation FLELedger
    @synthesize participants;
    @synthesize periods;
- (void) initAttributes {
    [super initAttributes];
    participants = [[NSMutableArray alloc] init];
    periods = [[NSMutableArray alloc] init];
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
        return @"FLELedger";
    }
    + (NSString*)getModuleName    {
        return @"PayOffMain";
    }

+ (NSMutableArray*)getWithQuery:(NSString*) _query{
    return [[AOMDatastore sharedInstance] loadListFromServerWithClass:[FLELedger class] andQuery:_query];
}
+ (void)getAsyncWithQuery:(NSString*) _query withBlock:(AOMBlockWithResults) _block{
    [[AOMDatastore sharedInstance] loadListFromServerAsyncWithClass:[FLELedger class] andQuery:_query andFinishingBlock:_block];
}

        
     - ( NSString* )name {


 return [[self data] objectForKey:@"name"];
}

            - (void)setName:( NSString* )_name {
                            [[self data] setObject:_name?:[NSNull null] forKey:@"name"];
                        }
        
     - ( NSString* )status {


 return [[self data] objectForKey:@"status"];
}

            - (void)setStatus:( NSString* )_status {
                            [[self data] setObject:_status?:[NSNull null] forKey:@"status"];
                        }
        
        - (NSDate*)endtimestamp {
        double timeInMs = [[[self data] objectForKey:@"endtimestamp"] doubleValue];
        if(timeInMs)
        {
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeInMs/1000];
            return date;
        }
        return nil;
    }
    - (void)setEndtimestamp:(NSDate*) _endtimestamp {
        double timeInS = [_endtimestamp timeIntervalSince1970] * 1000;
        [[self data] setValue:[NSNumber numberWithDouble: timeInS] forKey:@"endtimestamp"] ;
    }
        
        - (NSDate*)starttimestamp {
        double timeInMs = [[[self data] objectForKey:@"starttimestamp"] doubleValue];
        if(timeInMs)
        {
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeInMs/1000];
            return date;
        }
        return nil;
    }
    - (void)setStarttimestamp:(NSDate*) _starttimestamp {
        double timeInS = [_starttimestamp timeIntervalSince1970] * 1000;
        [[self data] setValue:[NSNumber numberWithDouble: timeInS] forKey:@"starttimestamp"] ;
    }
        
        - (NSMutableArray*)loadParticipants:(NSString*) _query {
        NSString* refUrl = [[self data] objectForKey:@"participantsHref"];
        if(refUrl==Nil) {
            NSMutableArray* emptyList = [[NSMutableArray alloc] init];
            return emptyList;
        }
        participants = [[AOMDatastore sharedInstance] loadFromServerWithHref:refUrl andClass:[FLEUser class] andQuery:_query];
        return participants;
    }
    
    - (void)loadParticipantsAsync:(NSString*) _query andWithBlock:(AOMEmptyBlock) _block {
        NSString* refUrl = [[self data] objectForKey:@"participantsHref"];
        if(refUrl==Nil) {
            if (_block) {
                NSError* error = [AOMDatastore createApiomatErrorWithStatus:AOMHREF_NOT_FOUND];
                _block(error);
                return;
            }
        }
        AOMBlockWithResults internBlock = ^(NSMutableArray *models, NSError *error) {
            if(error == FALSE) {
                 participants = models;
            }
            if (_block) {
                _block(error);
            }
        };
        [[AOMDatastore sharedInstance] loadFromServerAsyncWithHref:refUrl andClass:[FLEUser class] andQuery:_query andFinishingBlock:internBlock];
    }
    - (NSString*)postParticipants:(FLEUser*) _refData  {
            NSString* href = [_refData getHref];
            if([NSString isEmptyString:href])
            {
                [AOMDatastore raiseApiomatExceptionWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
                return Nil;
            }
            NSString* linkedHref = [[AOMDatastore sharedInstance] postOnServer:_refData withHref:[[self data] objectForKey:@"participantsHref"]];
            //if object was saved than add to local collection or set local variable
                        if(linkedHref && [AOMModelHelper containsList:participants thisHref:linkedHref] == false) 
            {
                [participants addObject:_refData];
                            [self addRefModelHrefWithName:@"participants" andHref:href];
            }
            return href;
    }
    
    - (void)postParticipantsAsync:(FLEUser*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* href = [_refData getHref];
        if([NSString isEmptyString:href])
        {
            [AOMDatastore createApiomatErrorWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
            return;
        }
        [[AOMDatastore sharedInstance] postOnServerAsync:_refData withHref:[[self data] objectForKey:@"participantsHref"] andFinishingBlock:^(NSString *linkedHref, NSError *error) {
            if(error == FALSE) {
                //if object was saved than add to local collection or set local variable
                if(linkedHref && [AOMModelHelper containsList:participants thisHref:linkedHref] == false) {
                    [participants addObject:_refData];
                    [self addRefModelHrefWithName:@"participants" andHref:href];
                }
            }
            if(_block) {
                _block(error);
            }
        }];
    }
    
    - (void)removeParticipants:(FLEUser*) _refData  {
        NSString* refUrl = [[self data] objectForKey:@"participantsHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        BOOL wasDeleted = [[AOMDatastore sharedInstance] deleteOnServerWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID]];
        if(wasDeleted) {
            [participants removeObject:_refData];
            [self removeFromRefModelHrefsWithName:@"participants" andHref:refHref];
        }
    }
    
    - (void)removeParticipantsAsync:(FLEUser*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* refUrl = [[self data] objectForKey:@"participantsHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        [[AOMDatastore sharedInstance] deleteOnServerAsyncWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID] withFinishingBlock:^(NSError *error) {
            if(error == FALSE) {
                [participants removeObject:_refData];
                [self removeFromRefModelHrefsWithName:@"participants" andHref:refHref];
            }
            
            if(_block) {
                _block(error);
            }
        }];
    }
        - (NSMutableArray*)participants{
        if([participants count]==0 && [[AOMDatastore sharedInstance] modelStore]) {
            NSMutableArray* hrefsOfObj = [self getRefModelHrefsForName:@"participants"];
            for (NSString* objHref in hrefsOfObj) {
                id elem = [[[AOMDatastore sharedInstance] modelStore] modelWithHref:objHref andClass:[FLEUser class]];
                if(elem) {
                    [participants addObject:elem];
                } else if([[[AOMDatastore sharedInstance] modelStore] useIncompleteReferences]==false){
                    //min one element is not in AOMDatastore so we say dataset is not complete return empty list
                    [participants removeAllObjects];
                    return participants;
                }
            }
        }
        return participants;
    }
        
        - (NSMutableArray*)loadPeriods:(NSString*) _query {
        NSString* refUrl = [[self data] objectForKey:@"periodsHref"];
        if(refUrl==Nil) {
            NSMutableArray* emptyList = [[NSMutableArray alloc] init];
            return emptyList;
        }
        periods = [[AOMDatastore sharedInstance] loadFromServerWithHref:refUrl andClass:[FLEPeriod class] andQuery:_query];
        return periods;
    }
    
    - (void)loadPeriodsAsync:(NSString*) _query andWithBlock:(AOMEmptyBlock) _block {
        NSString* refUrl = [[self data] objectForKey:@"periodsHref"];
        if(refUrl==Nil) {
            if (_block) {
                NSError* error = [AOMDatastore createApiomatErrorWithStatus:AOMHREF_NOT_FOUND];
                _block(error);
                return;
            }
        }
        AOMBlockWithResults internBlock = ^(NSMutableArray *models, NSError *error) {
            if(error == FALSE) {
                 periods = models;
            }
            if (_block) {
                _block(error);
            }
        };
        [[AOMDatastore sharedInstance] loadFromServerAsyncWithHref:refUrl andClass:[FLEPeriod class] andQuery:_query andFinishingBlock:internBlock];
    }
    - (NSString*)postPeriods:(FLEPeriod*) _refData  {
            NSString* href = [_refData getHref];
            if([NSString isEmptyString:href])
            {
                [AOMDatastore raiseApiomatExceptionWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
                return Nil;
            }
            NSString* linkedHref = [[AOMDatastore sharedInstance] postOnServer:_refData withHref:[[self data] objectForKey:@"periodsHref"]];
            //if object was saved than add to local collection or set local variable
                        if(linkedHref && [AOMModelHelper containsList:periods thisHref:linkedHref] == false) 
            {
                [periods addObject:_refData];
                            [self addRefModelHrefWithName:@"periods" andHref:href];
            }
            return href;
    }
    
    - (void)postPeriodsAsync:(FLEPeriod*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* href = [_refData getHref];
        if([NSString isEmptyString:href])
        {
            [AOMDatastore createApiomatErrorWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
            return;
        }
        [[AOMDatastore sharedInstance] postOnServerAsync:_refData withHref:[[self data] objectForKey:@"periodsHref"] andFinishingBlock:^(NSString *linkedHref, NSError *error) {
            if(error == FALSE) {
                //if object was saved than add to local collection or set local variable
                if(linkedHref && [AOMModelHelper containsList:periods thisHref:linkedHref] == false) {
                    [periods addObject:_refData];
                    [self addRefModelHrefWithName:@"periods" andHref:href];
                }
            }
            if(_block) {
                _block(error);
            }
        }];
    }
    
    - (void)removePeriods:(FLEPeriod*) _refData  {
        NSString* refUrl = [[self data] objectForKey:@"periodsHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        BOOL wasDeleted = [[AOMDatastore sharedInstance] deleteOnServerWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID]];
        if(wasDeleted) {
            [periods removeObject:_refData];
            [self removeFromRefModelHrefsWithName:@"periods" andHref:refHref];
        }
    }
    
    - (void)removePeriodsAsync:(FLEPeriod*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* refUrl = [[self data] objectForKey:@"periodsHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        [[AOMDatastore sharedInstance] deleteOnServerAsyncWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID] withFinishingBlock:^(NSError *error) {
            if(error == FALSE) {
                [periods removeObject:_refData];
                [self removeFromRefModelHrefsWithName:@"periods" andHref:refHref];
            }
            
            if(_block) {
                _block(error);
            }
        }];
    }
        - (NSMutableArray*)periods{
        if([periods count]==0 && [[AOMDatastore sharedInstance] modelStore]) {
            NSMutableArray* hrefsOfObj = [self getRefModelHrefsForName:@"periods"];
            for (NSString* objHref in hrefsOfObj) {
                id elem = [[[AOMDatastore sharedInstance] modelStore] modelWithHref:objHref andClass:[FLEPeriod class]];
                if(elem) {
                    [periods addObject:elem];
                } else if([[[AOMDatastore sharedInstance] modelStore] useIncompleteReferences]==false){
                    //min one element is not in AOMDatastore so we say dataset is not complete return empty list
                    [periods removeAllObjects];
                    return periods;
                }
            }
        }
        return periods;
    }

@end

