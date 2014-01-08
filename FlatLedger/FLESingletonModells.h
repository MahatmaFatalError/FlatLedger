//
//  FLESingletonModells.h
//  FlatLedger
//
//  Created by Julian Ruppel on 08.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "FLEUserSession.h"
#import "FLELedger.h"

@interface FLESingletonModells : NSObject

+ (User*)getUser;
+ (FLEUserSession*)getSession;
+ (FLELedger*)getSeLedger;

@end
