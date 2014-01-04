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
@class AOMAbstractClientDataModel;

FOUNDATION_EXPORT NSString * const ApiomatRequestException;
FOUNDATION_EXPORT NSString * const EmptyHrefException;

/*!
 Defines block for HTTP responses from apiOmat backend.
 
 @param error If HTTP request throws an error then you can find them in this parameter
 */
typedef void (^AOMEmptyBlock)(NSError *error);
/*!
 Defines block for HTTP POST responses from apiOmat backend.
 
 @param href Contains HREF of new created model
 @param error If HTTP request throws an error then you can find them in this parameter else Nil
 */
typedef void (^AOMBlockWithHref)(NSString* href, NSError *error);
/*!
 Defines block for HTTP GET responses from apiOmat backend.
 
 @param model Contains returned model object
 @param error If HTTP request throws an error then you can find them in this parameter else Nil
 */
typedef void (^AOMBlockWithResult)(AOMAbstractClientDataModel* model, NSError *error);
/*!
 Defines block for HTTP GET responses from apiOmat backend.
 
 @param models Contains list returned model objects
 @param error If HTTP request throws an error then you can find them in this parameter else Nil
 */
typedef void (^AOMBlockWithResults)(NSMutableArray* models, NSError *error);

/*!
 Defines block for HTTP GET response from apiOmat backend with binary data.
 
 @param data Contains NSData
 @param error If HTTP request throws an error then you can find them in this parameter else Nil
 */
typedef void (^AOMBlockWithNSDataResults)(NSData* data, NSError *error);