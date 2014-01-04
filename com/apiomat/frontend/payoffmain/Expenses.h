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
 Generated class for your Expenses data model 
*/
@interface Expenses : AOMAbstractClientDataModel

    @property (readonly, strong, nonatomic) AOMUser* user;





                        - (AOMUser*)loadUser;
        - (void)loadUserAsync:(AOMEmptyBlock)_block;
        - (NSString*)postUser:(AOMUser*) _refData ;
    - (void)postUserAsync:(AOMUser*) _refData andWithBlock:(AOMEmptyBlock) _block;

    - (void)removeUser:(AOMUser*) _refData ;
    - (void)removeUserAsync:(AOMUser*) _refData andWithBlock:(AOMEmptyBlock) _block;

                - ( double )price;
        
                        - (void)setPrice:( double )_price;
            
                - ( NSString* )item;
        
                        - (void)setItem:( NSString* )_item;
            
                - ( NSDate* )timestamp;
        
                        - (void)setTimestamp:( NSDate* )_timestamp;
            
                - ( long )quantity;
        
                        - (void)setQuantity:( long )_quantity;
            

@end

