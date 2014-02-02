//
//  FLESingletonModells.h
//  FlatLedger
//
//  Created by Julian Ruppel on 08.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLEUser.h"
#import "FLEUserSession.h"
#import "FLELedger.h"
#import "FLEPeriod.h"
#import "Datastore.h"

@interface FLESingletonModells : NSObject

+ (FLEUser*)getUser;
+ (FLEUserSession*)getSession;
+ (FLELedger*)getLedger;
+ (void)releaseUser;
+ (void)releaseSession;
+ (void)releaseLedger;

+ (FLEPeriod*)getActivePeriod;
+ (void)releaseActivePeriod;

+ (FLEPeriod*)getSelectedPeriod;
+ (void)releaseSelectedPeriod;

//+ (void) setLedger:(FLELedger *)ledgerForUser;
//+ (FLELedger*)getLedgerFromUser;

@end
