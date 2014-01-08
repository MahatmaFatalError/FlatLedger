//
//  FLESingletonModells.m
//  FlatLedger
//
//  Created by Julian Ruppel on 08.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLESingletonModells.h"
#import "User.h"
#import "FLEUserSession.h"
#import "FLELedger.h"


@implementation FLESingletonModells


static User *user;
static FLEUserSession *session;
static FLELedger *ledger;

+ (User*)getUser
{
    
    if(!user)
    {
        user = [[User alloc] init];
		
    }
	
	return user;
}


+ (FLEUserSession*)getSession;
{
    
    if(!session)
    {
        session = [[FLEUserSession alloc] init];
		
    }
	
	return session;
}

+ (FLELedger*)getSeLedger;
{
    
    if(!ledger)
    {
        ledger = [[FLELedger alloc] init];
		
    }
	
	return ledger;
}


@end
