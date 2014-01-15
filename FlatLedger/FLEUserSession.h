//
//  FLEUserSession.h
//  FlatLedger
//
//  Created by Julian Ruppel on 08.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLEUser.h"

@interface FLEUserSession : NSMutableDictionary
@property FLEUser *user;
@property BOOL *isLoggedIn;

@end
