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
#import "FLEPeriod.h"
#import "AOMDatastore.h"
#import "AOMModelStore.h"
#import "AOMModelHelper.h"
#import "NSString+Extensions.h"
#import "FLELedger.h"
#import "FLEExpense.h"

/*
* Generated class for your FLEPeriod data model 
*/
@implementation FLEPeriod
    @synthesize ledger;
    @synthesize expense;
- (void) initAttributes {
    [super initAttributes];
    expense = [[NSMutableArray alloc] init];
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
        return @"FLEPeriod";
    }
    + (NSString*)getModuleName    {
        return @"PayOffMain";
    }

+ (NSMutableArray*)getWithQuery:(NSString*) _query{
    return [[AOMDatastore sharedInstance] loadListFromServerWithClass:[FLEPeriod class] andQuery:_query];
}
+ (void)getAsyncWithQuery:(NSString*) _query withBlock:(AOMBlockWithResults) _block{
    [[AOMDatastore sharedInstance] loadListFromServerAsyncWithClass:[FLEPeriod class] andQuery:_query andFinishingBlock:_block];
}

        
     - ( NSString* )name {


 return [[self data] objectForKey:@"name"];
}

            - (void)setName:( NSString* )_name {
                            [[self data] setObject:_name?:[NSNull null] forKey:@"name"];
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
        
        - (NSMutableArray*)loadExpense:(NSString*) _query {
        NSString* refUrl = [[self data] objectForKey:@"expenseHref"];
        if(refUrl==Nil) {
            NSMutableArray* emptyList = [[NSMutableArray alloc] init];
            return emptyList;
        }
        expense = [[AOMDatastore sharedInstance] loadFromServerWithHref:refUrl andClass:[FLEExpense class] andQuery:_query];
        return expense;
    }
    
    - (void)loadExpenseAsync:(NSString*) _query andWithBlock:(AOMEmptyBlock) _block {
        NSString* refUrl = [[self data] objectForKey:@"expenseHref"];
        if(refUrl==Nil) {
            if (_block) {
                NSError* error = [AOMDatastore createApiomatErrorWithStatus:AOMHREF_NOT_FOUND];
                _block(error);
                return;
            }
        }
        AOMBlockWithResults internBlock = ^(NSMutableArray *models, NSError *error) {
            if(error == FALSE) {
                 expense = models;
            }
            if (_block) {
                _block(error);
            }
        };
        [[AOMDatastore sharedInstance] loadFromServerAsyncWithHref:refUrl andClass:[FLEExpense class] andQuery:_query andFinishingBlock:internBlock];
    }
    - (NSString*)postExpense:(FLEExpense*) _refData  {
            NSString* href = [_refData getHref];
            if([NSString isEmptyString:href])
            {
                [AOMDatastore raiseApiomatExceptionWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
                return Nil;
            }
            NSString* linkedHref = [[AOMDatastore sharedInstance] postOnServer:_refData withHref:[[self data] objectForKey:@"expenseHref"]];
            //if object was saved than add to local collection or set local variable
                        if(linkedHref && [AOMModelHelper containsList:expense thisHref:linkedHref] == false) 
            {
                [expense addObject:_refData];
                            [self addRefModelHrefWithName:@"expense" andHref:href];
            }
            return href;
    }
    
    - (void)postExpenseAsync:(FLEExpense*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* href = [_refData getHref];
        if([NSString isEmptyString:href])
        {
            [AOMDatastore createApiomatErrorWithStatus:AOMSAVE_REFERENECE_BEFORE_REFERENCING];
            return;
        }
        [[AOMDatastore sharedInstance] postOnServerAsync:_refData withHref:[[self data] objectForKey:@"expenseHref"] andFinishingBlock:^(NSString *linkedHref, NSError *error) {
            if(error == FALSE) {
                //if object was saved than add to local collection or set local variable
                if(linkedHref && [AOMModelHelper containsList:expense thisHref:linkedHref] == false) {
                    [expense addObject:_refData];
                    [self addRefModelHrefWithName:@"expense" andHref:href];
                }
            }
            if(_block) {
                _block(error);
            }
        }];
    }
    
    - (void)removeExpense:(FLEExpense*) _refData  {
        NSString* refUrl = [[self data] objectForKey:@"expenseHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        BOOL wasDeleted = [[AOMDatastore sharedInstance] deleteOnServerWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID]];
        if(wasDeleted) {
            [expense removeObject:_refData];
            [self removeFromRefModelHrefsWithName:@"expense" andHref:refHref];
        }
    }
    
    - (void)removeExpenseAsync:(FLEExpense*) _refData andWithBlock:(AOMEmptyBlock) _block {
        NSString* refUrl = [[self data] objectForKey:@"expenseHref"];
        NSString* refHref = [_refData getHref];
        NSRange range = [refHref rangeOfString:@"/" options:NSBackwardsSearch];
        NSString* refID = [refHref substringFromIndex:NSMaxRange(range)];
        [[AOMDatastore sharedInstance] deleteOnServerAsyncWithUrl:[[refUrl stringByAppendingString:@"/"] stringByAppendingString:refID] withFinishingBlock:^(NSError *error) {
            if(error == FALSE) {
                [expense removeObject:_refData];
                [self removeFromRefModelHrefsWithName:@"expense" andHref:refHref];
            }
            
            if(_block) {
                _block(error);
            }
        }];
    }
        - (NSMutableArray*)expense{
        if([expense count]==0 && [[AOMDatastore sharedInstance] modelStore]) {
            NSMutableArray* hrefsOfObj = [self getRefModelHrefsForName:@"expense"];
            for (NSString* objHref in hrefsOfObj) {
                id elem = [[[AOMDatastore sharedInstance] modelStore] modelWithHref:objHref andClass:[FLEExpense class]];
                if(elem) {
                    [expense addObject:elem];
                } else if([[[AOMDatastore sharedInstance] modelStore] useIncompleteReferences]==false){
                    //min one element is not in AOMDatastore so we say dataset is not complete return empty list
                    [expense removeAllObjects];
                    return expense;
                }
            }
        }
        return expense;
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

@end

