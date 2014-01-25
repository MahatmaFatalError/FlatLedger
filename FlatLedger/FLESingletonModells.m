//
//  FLESingletonModells.m
//  FlatLedger
//
//  Created by Julian Ruppel on 08.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLESingletonModells.h"


@implementation FLESingletonModells


static FLEUser *user;
static FLEUserSession *session;
static FLELedger *ledger;
static FLEPeriod *period;

+ (FLEUser*)getUser
{
    
    if(!user)
    {
        user = [[FLEUser alloc] init];
		
    }
	
	return user;
}

+ (void)releaseUser {
    user = nil;
}


+ (FLEUserSession*)getSession;
{
    
    if(!session)
    {
        session = [[FLEUserSession alloc] init];
		
    }
	
	return session;
}

+ (void)releaseSession {
    session = nil;
}

+ (FLELedger*)getLedger;
{
    
    if(!ledger)
    {
        @try {
            ledger = [user loadLedger];
        }
        @catch (NSException *exception) {
            ledger = [[FLELedger alloc] init];
            NSLog(@"Loading Ledger by User failed. A blank new Ledger is created");
        }
        
    }
	
	return ledger;
}

+ (void)releaseLedger {
    ledger = nil;
}



+ (FLEPeriod*)getActivePeriod;
{
    
    if(!period)
    {
        period= [[FLEPeriod alloc] init];
		period.status = @"active";
		
    }
	
	return period;
}

+ (void)releaseActivePeriod {
    period = nil;
}



//+ (void) setLedger:(FLELedger *)ledgerForUser{
//    ledger = ledgerForUser;
//    
//    if ([user getHref] == nil) {
//        [user loadMe];
//    }
//    NSString *href = [ledger getHref];
//    
//    NSArray *listItems = [href componentsSeparatedByString:@"/"];
//    NSString *ledgerId = [listItems lastObject];
//    
//    NSMutableDictionary *dict = [user data];
//    NSMutableDictionary *dynAtt = [dict objectForKey:@"dynamicAttributes"];
//    //[dynAtt setObject:ledger forKey:@"ledger"];
//    [dynAtt setObject:ledgerId forKey:@"ledger"];
//    [user save]; //hier knallts weil dynAttribut nur flache typen nimmt vermutlich
//}
//
//
//+ (FLELedger*)getLedgerFromUser{
//    
//    if ([user getHref] == nil) {
//        [user loadMe];
//    }
//    NSMutableDictionary *dict = [user data];
//    NSMutableDictionary *dynAtt = [dict objectForKey:@"dynamicAttributes"];
//    
//    NSString *firstString = @"id == id(";
//    NSString *ledgerId = [dynAtt objectForKey:@"ledger"];
//    NSString *query = [firstString stringByAppendingString:ledgerId] ;
//    query = [query stringByAppendingString:@")"];
//    
//    
//    NSMutableArray *ledgers = [[DataStore sharedInstance] loadListFromServerWithClass:[ledger class] andQuery: query];
//    ledger = [ledgers objectAtIndex:0];
//    
//    
//    //NSString *href = @"https://apiomat.org/yambas/rest/apps/PayOff/models/PayOffMain/User/";
//    //[userAOM loadWithHref:href];
//    //[DataStore sharedInstance] loadFromServerWithHref:<#(NSString *)#> andClass:<#(__unsafe_unretained Class)#> andQuery:<#(NSString *)#>
//    //[user loadWithHref:href];
//    return ledger;
//}

@end
