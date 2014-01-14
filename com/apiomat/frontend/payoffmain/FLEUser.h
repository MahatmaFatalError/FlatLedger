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

#import "AOMAbstractClientDataModel.h"
#import "User.h"
@class FLELedger;

/*!
 Generated default class representing a user in your app 
*/
@interface FLEUser : AOMUser


    @property (readonly, strong, nonatomic) FLELedger* ledger;
    /* contains apiKey for your app */
    extern NSString * const apiKey;
    /* base server URL for requests */
    extern NSString * const baseUrl;
    /* NSString which provides information which system is used (LIVE,TEST,STAGING) */    
    extern NSString * const AMSystem;
    /* provides information about currently used SDK version */    
    extern NSString * const sdkVersion;
    
/*!
 Updates this class from server 
*/
- (void)loadMe;
/*!
 Load data for member from server on a Non-UI-Thread
 
 @param _block block which will be called after request was finished
*/
- (void)loadMeAsyncWithFinishingBlock:(AOMEmptyBlock) _block;
/*!
 Requests a new password; user will receive an email to confirm
*/
- (void)requestNewPassword;
/*!
Reset password

@param _newPassword the new password
*/
- (void)resetPassword:(NSString*) _newPassword;
/*!
Reset password. This method will be executed on a Non-UI-Thread

@param _newPassword the new password
@param _block code which will be called after request was finished
*/
- (void)resetPasswordAsync:(NSString*) _newPassword andWithFinishingBlock: (AOMEmptyBlock) _block;

                - ( NSString* )isLoggedIn;
        
                        - (void)setIsLoggedIn:( NSString* )_isLoggedIn;
            
                    - (FLELedger*)loadLedger;
        - (void)loadLedgerAsync:(AOMEmptyBlock)_block;
        - (NSString*)postLedger:(FLELedger*) _refData ;
    - (void)postLedgerAsync:(FLELedger*) _refData andWithBlock:(AOMEmptyBlock) _block;

    - (void)removeLedger:(FLELedger*) _refData ;
    - (void)removeLedgerAsync:(FLELedger*) _refData andWithBlock:(AOMEmptyBlock) _block;


@end

