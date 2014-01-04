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
#import <Foundation/Foundation.h>
#import "AOMModelStoreProtocol.h"
#import "User.h"
#import "AOMConstants.h"
#import "Status.h"

@class AOMAbstractClientDataModel;

/*!
 This class is your interface to the apiOmat service. Each method lets your post, put, get or delete your data models.
 Basic handling is already implemented in your generated module classes, so it won't be necessary in most cases to
 call the AOMDatastore methods directly.
 */
@interface AOMDatastore : NSObject
/* Enum which contains options for caching strategy of HTTP requests */
typedef enum {
    AOM_NO_CACHE = NSURLRequestReloadIgnoringLocalCacheData,
    AOM_CACHE_ONLY = NSURLRequestReturnCacheDataDontLoad,
    AOM_CHECK_SERVER_ELSE_CACHE = NSURLRequestUseProtocolCachePolicy
} AOMCacheStrategy;

/*!
 Singleton implementation of AOMDatastore.
 Call only this object if you need AOMDatastore methods
 
 @warning *Important*: Please configure AOMDatastore before call this method
 */
+ (AOMDatastore *) sharedInstance;
/*!
 Configures and returns a AOMDatastore instance
 
 @param _member An user object which holds the login credentials
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*)configureWithUser:(AOMUser*)_user;
/*!
 Configures and returns a AOMDatastore instance
 
 @param _member An user object which holds the login credentials
 @param _modelStore An instance of ModelStore where you can persist objects (Caution! it is beta at the moment)
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*)configureWithUser:(AOMUser*)_user andModelStore:(id<AOMModelStoreProtocol>)_modelStore;
/*!
 Configures and returns a AOMDatastore instance
 
 @param _member An user object which holds the login credentials
 @param _loadWithLinks If true also the HREFs of referenced objects are loaded when getting objects
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*)configureWithUser:(AOMUser*)_user andLoadWithLinks: (BOOL)_loadWithLinks;
/*!
 Configures and returns a AOMDatastore instance
 This method doesn't set Auth credits. Please use this only if your generated data model is accessable as Guest
 
 @param _baseUrl The base URL of the APIOMAT service;
 usually <a href="http://apiomat.org/yambas/rest/apps/">http://apiomat.org/yambas/rest/apps/</a>
 (see the AOMUser class)
 @param _apiKey The api key of your application (see AOMUser class)
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*)configureWithUrl:(NSString*)_baseUrl
                     andApiKey: (NSString*)_apiKey;


/*!
 Configures and returns a AOMDatastore instance
 
 @deprecated Please use configureWithUser: instead
 
 @param _baseUrl The base URL of the APIOMAT service;
 usually <a href="http://apiomat.org/yambas/rest/apps/">http://apiomat.org/yambas/rest/apps/</a>
 (see the AOMUser class)
 @param _apiKey The api key of your application (see AOMUser class)
 @param _username Your username
 @param _password Your password
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*)configureWithUrl:(NSString*)_baseUrl
                     andApiKey: (NSString*)_apiKey
                   andUsername: (NSString*)_username
                   andPassword: (NSString*)_password;


/*!
 Configures and returns a AOMDatastore instance
 This method doesn't set Auth credits. Please use this only if your generated data model is accessable as Guest
 
 @param _baseUrl The base URL of the APIOMAT service;
 usually <a href="http://apiomat.org/yambas/rest/apps/">http://apiomat.org/yambas/rest/apps/</a>
 (see the AOMUser class)
 @param _apiKey The api key of your application (see AOMUser class)
 @param _modelStore If you set this parameter, objects will also saved in a local model store
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*)configureWithUrl:(NSString*)_baseUrl
                     andApiKey: (NSString*)_apiKey
                 andModelStore:(id<AOMModelStoreProtocol>)_modelStore;

/*!
 Configures and returns a AOMDatastore instance
 
 @deprecated Please use configureWithUser:andModelStore: instead
 
 @param _baseUrl The base URL of the APIOMAT service;
 usually <a href="http://apiomat.org/yambas/rest/apps/">http://apiomat.org/yambas/rest/apps/</a>
 (see the AOMUser class)
 @param _apiKey The api key of your application (see AOMUser class)
 @param _username Your username
 @param _password Your password
 @param _modelStore If you set this parameter, objects will also saved in a local model store
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*)configureWithUrl:(NSString*)_baseUrl
                     andApiKey: (NSString*)_apiKey
                   andUsername: (NSString*)_username
                   andPassword: (NSString*)_password
                 andModelStore:(id<AOMModelStoreProtocol>)_modelStore;

/*!
 Configures and returns a AOMDatastore instance
 This method doesn't set Auth credits. Please use this only if your generated data model is accessable as Guest
 
 @param _baseUrl The base URL of the APIOMAT service;
 usually <a href="http://apiomat.org/yambas/rest/apps/">http://apiomat.org/yambas/rest/apps/</a>
 (see the AOMUser class)
 @param _apiKey The api key of your application (see AOMUser class)
 @param _loadWithLinks If true also the HREFs of referenced objects are loaded when getting objects from server
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*) configureWithUrl:(NSString*)_baseUrl
                      andApiKey: (NSString*)_apiKey
               andLoadWithLinks: (BOOL)_loadWithLinks;

/*!
 Configures and returns a AOMDatastore instance
 
 @deprecated Please use configureWithUser:andLoadWithLinks: instead
 
 @param _baseUrl The base URL of the APIOMAT service;
 usually <a href="http://apiomat.org/yambas/rest/apps/">http://apiomat.org/yambas/rest/apps/</a>
 (see the AOMUser class)
 @param _apiKey The api key of your application (see AOMUser class)
 @param _username Your username
 @param _password Your password
 @param _loadWithLinks If true also the HREFs of referenced objects are loaded when getting objects from server
 @return A configured AOMDatastore instance
 */
+ (AOMDatastore*) configureWithUrl:(NSString*)_baseUrl
                      andApiKey: (NSString*)_apiKey
                    andUsername: (NSString*)_username
                    andPassword: (NSString*)_password
               andLoadWithLinks: (BOOL)_loadWithLinks;

/*!
 Set caching strategy GET requests for singelton AOMDatastore.
 The default one is NO_CACHE.
 Please call configure for AOMDatastore before!
 
 @param _cacheStrategy the strategy to use
 
 @return configured AOMDatastore instance
 */
+ (AOMDatastore*) setCachingStrategy:(AOMCacheStrategy) _cacheStrategy;

#pragma mark - Post requests
/*!
 Save model server.
 
 @param _dataModel data model to store in backend
 @return HREF of the saved model
 */
- (NSString*) postOnServer: (AOMAbstractClientDataModel*) _dataModel;

/*!
 Method for posting the model to the server in an update manner. That is, at the point using this method the model
 has a HREF and exists on server.
 
 @param _dataModel data model to store in backend
 @param _href HREF of the model to post (or the address to post the model to)
 @return the HREF of the posted model
 */
- (NSString*) postOnServer: (AOMAbstractClientDataModel*) _dataModel
                  withHref: (NSString*) _href;

/*!
 Method to save static data on server.
 Do not forget to store the HREF returned by method to the owner model,
 since this method only stores the byte array on the server.
 
 @param _rawData raw data as byte array
 @param _isImage TRUE to store the raw data as image, FALSE to store as video
 */
- (NSString*) postStaticDataOnServer: (NSData*) _rawData
                             asImage: (BOOL) _isImage;

#pragma mark - load requests

- (AOMAbstractClientDataModel*) loadFromServerWithHref:(NSString*) _modelHref
                                            andStoreIn:(AOMAbstractClientDataModel*) _model;
- (NSMutableArray*) loadListFromServerWithClass:(Class)_class andQuery: (NSString*) _query;

/*!
 Loads existing models from server
 
 @param _modelHref HREF of the models
 @param _class Classname of loaded model
 @param _query a query string to filter the results
 @return all models fitting the search parameters
 */
- (NSMutableArray*) loadFromServerWithHref:(NSString*) _modelHref andClass: (Class) _class andQuery:(NSString*) _query;

/*!
 Loads a resource, e.g. an image with the user credentials.
 
 @param href the URl of the image
 @return the resource as byte array
 @throws ApiomatRequestException
 */
- (NSData*) loadResourceWithHref: (NSString*) _href;

/*!
 Loads a resource, e.g. an image with the user credentials in the background.
 
 @param href the URl of the image
 @param _block block which will executed after finished request
 */
- (void) loadResourceAsyncWithHref: (NSString*) _href andWithFinishingBlock:(AOMBlockWithNSDataResults) _block;

#pragma mark - delete requests
- (BOOL) deleteOnServerWithUrl:(NSString *)urlString;
- (BOOL) deleteOnServer: (AOMAbstractClientDataModel*) _model;

#pragma mark - update requests
- (BOOL) updateOnServer: (AOMAbstractClientDataModel*) _model;
/*!
 Send a PUT request to the server with given JSON string as content.
 
 @param _url The URL where JSON will be send
 @param _json The JSON string to be send
 
 @return true if request was successfull, otherwise false
 */
- (BOOL) updateOnServerWithUrl: (NSString*) _url andJson: (NSString*) _json;
#pragma mark - async post req
/*!
 Save model on server in background process.
 If request is finished block parameter will executed
 
 @param _dataModel data model to store in backend
 @param _block block which will executed after finished request
 */
- (void) postOnServerAsync:(AOMAbstractClientDataModel*)_dataModel withFinishingBlock:(AOMBlockWithHref) _block;
/*!
 Save model on server in background process.
 
 @param _dataModel data model to store in backend
 */
- (void) postOnServerAsync:(AOMAbstractClientDataModel*)_dataModel;
/*!
 Save model on server in background process.
 If request is finished block method will executed
 
 @param _dataModel data model which will saved in backend
 @param _href HREF (URI) of the model to post (or the address to post the model to)
 @param block block which will executed after finished request
 */
- (void) postOnServerAsync:(AOMAbstractClientDataModel*)_dataModel  withHref: (NSString*) _href andFinishingBlock:(AOMBlockWithHref) block;
/*!
 Save model server in background process.
 
 @param _dataModel data model which will saved in backend
 @param _href HREF (URI) of the model to post (or the address to post the model to)
 */
- (void) postOnServerAsync:(AOMAbstractClientDataModel*)_dataModel  withHref: (NSString*) _href;
/*!
 Method to save static data on server. Will be executed in background process.
 Do not forget to store the HREF given to _block parameter to the owner model,
 since this method only stores the byte array on server.
 
 @param _rawData raw data as byte array
 @param _isImage TRUE to store the raw data as image, FALSE to store as video
 @param _block block which will executed after finished request
 */
- (void) postStaticDataOnServerAsync:(NSData*) _rawData  asImage:(BOOL) _isImage andFinishingBlock:(AOMBlockWithHref) _block;

#pragma mark - async update requests
/*!
 Update a model in a background process.
 This method will call the given _block if request is finished
 
 @param _model The model to update on server
 œparam _block block which will called after request is finished. If error==Nil requet was success.
 */
- (void) updateOnServerAsync: (AOMAbstractClientDataModel*) _model withFinishingBlock:(AOMEmptyBlock)_block;
/*!
Send a PUT request to the server with given JSON string as content.
This method will call the given _block if request is finished

@param _url URL where data will be send
@param _json The JSON string to be send
œparam _block block which will called after request is finished. If error==Nil requet was success.
*/
- (void) updateOnServerAsyncWithUrl: (NSString*) _url withJson: (NSString*) _json andWithFinishingBlock:(AOMEmptyBlock)_block;
#pragma mark - async delete requests
/*!
 Deletes the data model from the server based on its href
 @param _modelHref Href of model
 @param _block block which will called after request is finished. If error==Nil requet was success.
 */
- (void) deleteOnServerAsyncWithUrl:(NSString *)_modelHref withFinishingBlock:(AOMEmptyBlock)_block;
/*!
 Deletes the data model from the server
 @param _model the model
 @param _block block which will called after request is finished. If error==Nil requet was success.
 */
- (void) deleteOnServerAsync: (AOMAbstractClientDataModel*) _model withFinishingBlock:(AOMEmptyBlock)_block;

#pragma mark - async load req
/*!
 !Attention! Beta method. Please report bugs to info@apiomat.com
 
 Loads existing model from server
 This is done in background and not on the UI thread
 
 @param _modelHref Href of existing model
 @param _block block which will be executed after request is finished (could be NIL). Contains returned model and error information
 */
- (void) loadFromServerAsyncWithHref:(NSString*) _modelHref andFinishingBlock:(AOMBlockWithResult) _block;
/*!
 Loads existing model from server
 This is done in background and not on the UI thread
 
 @param _modelHref Href of existing model
 @param _model the model object were information will be stored after request is finished
 @param _block block which will be executed after request is finished (could be NIL). Contains returned model and error information
 */
- (void) loadFromServerAsyncWithHref:(NSString*) _modelHref andStoreIn:(AOMAbstractClientDataModel*) _model andFinishingBlock:(AOMBlockWithResult) _block;
/*!
 Loads list of existing models from server
 This is done in background and not on the UI thread
 
 @param _class Class of models to load
 @param _query query string to filter the results
 @param _block block which will be executed after request is finished (could be NIL). Contains returned models and error information
 */
- (void) loadListFromServerAsyncWithClass:(Class)_class andQuery: (NSString*) _query andFinishingBlock:(AOMBlockWithResults) _block;

/*!
 Loads existing models from server
 This is done in background and not on the UI thread
 
 @param _modelHref HREF of the models
 @param _class Class of models to load
 @param _query a query string to filter the results
 @param _block block which will be executed after request is finished (could be NIL). Contains returned models and error information
 */
- (void) loadFromServerAsyncWithHref:(NSString*) _modelHref andClass: (Class) _class andQuery:(NSString*) _query andFinishingBlock:(AOMBlockWithResults) _block;

/*!
 Helper method which throws an apiOmat exception with given AOMStatusCode
 */
+ (void)raiseApiomatExceptionWithStatus:(AOMStatusCode) status;
/*!
 Helper method which create an NSError object for apiOmat from given AOMStatusCode
 */
+ (NSError*)createApiomatErrorWithStatus:(AOMStatusCode) status;

#pragma mark properties
@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic) NSString *apiKey;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) id<AOMModelStoreProtocol> modelStore;
@property (nonatomic) BOOL loadWithLinks;

@end