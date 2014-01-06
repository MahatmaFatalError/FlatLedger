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
@class AOMUser;

/*!
 Generated class for your FLELedger data model 
*/
@interface FLELedger : AOMAbstractClientDataModel





    @property (readonly, strong, nonatomic) NSMutableArray* participants;

                - ( NSString* )name;
        
                        - (void)setName:( NSString* )_name;
            
                - ( NSString* )status;
        
                        - (void)setStatus:( NSString* )_status;
            
                - ( NSDate* )endtimestamp;
        
                        - (void)setEndtimestamp:( NSDate* )_endtimestamp;
            
                - ( NSDate* )starttimestamp;
        
                        - (void)setStarttimestamp:( NSDate* )_starttimestamp;
            
                        - (NSMutableArray*)loadParticipants:(NSString*) _query;
        - (void)loadParticipantsAsync:(NSString*) _query andWithBlock:(AOMEmptyBlock) _block;
        - (NSString*)postParticipants:(AOMUser*) _refData ;
    - (void)postParticipantsAsync:(AOMUser*) _refData andWithBlock:(AOMEmptyBlock) _block;

    - (void)removeParticipants:(AOMUser*) _refData ;
    - (void)removeParticipantsAsync:(AOMUser*) _refData andWithBlock:(AOMEmptyBlock) _block;


@end
