//
//  FLESingletonModells.m
//  FlatLedger
//
//  Created by Julian Ruppel on 08.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLESingletonModells.h"
#import "FLEUser.h"
#import "FLEUserSession.h"
#import "FLELedger.h"


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
        ledger = [[FLELedger alloc] init];
		
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

@end
