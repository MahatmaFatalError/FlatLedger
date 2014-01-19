//
//  FLEUserSession.h
//  FlatLedger
//
//  Created by Julian Ruppel on 08.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface FLEUserSession : NSMutableDictionary
@property User *user;
@property BOOL *isLoggedIn;

@end
