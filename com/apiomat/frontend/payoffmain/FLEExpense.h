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
@class FLEUser;
@class FLEPeriod;

/*!
 Generated class for your FLEExpense data model 
*/
@interface FLEExpense : AOMAbstractClientDataModel

    @property (readonly, strong, nonatomic) FLEUser* user;





    @property (readonly, strong, nonatomic) FLEPeriod* period;

                    - (FLEUser*)loadUser;
        - (void)loadUserAsync:(AOMEmptyBlock)_block;
        - (NSString*)postUser:(FLEUser*) _refData ;
    - (void)postUserAsync:(FLEUser*) _refData andWithBlock:(AOMEmptyBlock) _block;

    - (void)removeUser:(FLEUser*) _refData ;
    - (void)removeUserAsync:(FLEUser*) _refData andWithBlock:(AOMEmptyBlock) _block;

                - ( NSString* )item;
        
                        - (void)setItem:( NSString* )_item;
            
                - ( double )price;
        
                        - (void)setPrice:( double )_price;
            
                - ( NSDate* )timestamp;
        
                        - (void)setTimestamp:( NSDate* )_timestamp;
            
                - ( long )quantity;
        
                        - (void)setQuantity:( long )_quantity;
            
                    - (FLEPeriod*)loadPeriod;
        - (void)loadPeriodAsync:(AOMEmptyBlock)_block;
        - (NSString*)postPeriod:(FLEPeriod*) _refData ;
    - (void)postPeriodAsync:(FLEPeriod*) _refData andWithBlock:(AOMEmptyBlock) _block;

    - (void)removePeriod:(FLEPeriod*) _refData ;
    - (void)removePeriodAsync:(FLEPeriod*) _refData andWithBlock:(AOMEmptyBlock) _block;


@end

