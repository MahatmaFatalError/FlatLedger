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
#import "MemberModel.h"
#import "AOMDatastore.h"
#import "AOMModelStore.h"
#import "AOMModelHelper.h"
#import "NSString+Extensions.h"

NSString* const apiKey = @"7679362832156507627";
NSString* const baseUrl = @"https://apiomat.org/yambas/rest/apps/PayOff";
NSString* const AMSystem = @"LIVE";
NSString* const sdkVersion = @"1.10-81";

/*
* Generated default class representing a user in your app 
* @Deprecated
*/
@implementation AOMMemberModel
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
        return @"MemberModel";
    }
    + (NSString*)getModuleName    {
        return @"Basics";
    }

+ (NSMutableArray*)getWithQuery:(NSString*) _query{
    return [[AOMDatastore sharedInstance] loadListFromServerWithClass:[AOMMemberModel class] andQuery:_query];
}
+ (void)getAsyncWithQuery:(NSString*) _query withBlock:(AOMBlockWithResults) _block{
    [[AOMDatastore sharedInstance] loadListFromServerAsyncWithClass:[AOMMemberModel class] andQuery:_query andFinishingBlock:_block];
}

        
     - ( NSString* )password {


 return [[self data] objectForKey:@"password"];
}

            - (void)setPassword:( NSString* )_password {
                            [[self data] setObject:_password?:[NSNull null] forKey:@"password"];
                        }
        
     - ( NSString* )lastName {


 return [[self data] objectForKey:@"lastName"];
}

            - (void)setLastName:( NSString* )_lastName {
                            [[self data] setObject:_lastName?:[NSNull null] forKey:@"lastName"];
                        }
        
        - (NSMutableDictionary*)dynamicAttributes {
        NSMutableDictionary* dict = [[self data] objectForKey:@"dynamicAttributes"];
        //Return empty dict
        if (!dict)
        {
            dict = [[NSMutableDictionary alloc] init];
            [[self data] setObject:dict forKey:@"dynamicAttributes"];
        }
        return dict;
    }   
    
    - (void)setDynamicAttributes:(NSMutableDictionary*) _dynamicAttributes {
        [[self data] setObject:_dynamicAttributes?:[NSNull null] forKey:@"dynamicAttributes"];
    }
        
     - ( NSString* )firstName {


 return [[self data] objectForKey:@"firstName"];
}

            - (void)setFirstName:( NSString* )_firstName {
                            [[self data] setObject:_firstName?:[NSNull null] forKey:@"firstName"];
                        }
        
        - (NSDate*)dateOfBirth {
        double timeInMs = [[[self data] objectForKey:@"dateOfBirth"] doubleValue];
        if(timeInMs)
        {
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeInMs/1000];
            return date;
        }
        return nil;
    }
    - (void)setDateOfBirth:(NSDate*) _dateOfBirth {
        double timeInS = [_dateOfBirth timeIntervalSince1970] * 1000;
        [[self data] setValue:[NSNumber numberWithDouble: timeInS] forKey:@"dateOfBirth"] ;
    }
        
     - ( NSString* )userName {


 return [[self data] objectForKey:@"userName"];
}

            - (void)setUserName:( NSString* )_userName {
                            [[self data] setObject:_userName?:[NSNull null] forKey:@"userName"];
                        }
        
        - (double)locLatitude    {
      NSArray* loc = [[self data] objectForKey:@"loc"];
      return [[loc objectAtIndex:0] doubleValue];
    }
    - (void)setLocLatitude:(double)_latitude    {
        if(![[self data] objectForKey:@"loc"])
        {
            NSMutableArray* loc = [[NSMutableArray alloc] init ]; 
            [loc insertObject:[NSNumber numberWithDouble: 0] atIndex:0]; 
            [loc insertObject:[NSNumber numberWithDouble: 0] atIndex:1];
            [[self data] setObject:loc forKey:@"loc"]; 
        }
        NSMutableArray* loc = [[self data] objectForKey:@"loc"];
        [loc replaceObjectAtIndex:0 withObject:[NSNumber numberWithDouble: _latitude]]; 
    }

    - (double)locLongitude    {
        NSArray* loc = [[self data] objectForKey:@"loc"];
        return [[loc objectAtIndex:1] doubleValue];   
    }
    - (void)setLocLongitude:(double)_longitude    {
        if(![[self data] objectForKey:@"loc"])
        {
            NSMutableArray* loc = [[NSMutableArray alloc] init ]; 
            [loc insertObject:[NSNumber numberWithDouble: 0] atIndex:0]; 
            [loc insertObject:[NSNumber numberWithDouble: 0] atIndex:1];
            [[self data] setObject:loc forKey:@"loc"]; 
        }
        NSMutableArray* loc = [[self data] objectForKey:@"loc"];
        [loc replaceObjectAtIndex:1 withObject:[NSNumber numberWithDouble: _longitude]]; 
    }


@end

/*!
 @deprecated Please use AOMMemberModel instead
*/
@implementation MemberModel
@end
