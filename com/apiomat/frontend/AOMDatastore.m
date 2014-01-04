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
#import "AOMDatastore.h"
#import <YAJLiOS/YAJL.h>
#import "NSString+Base64.h"
#import "AOMAbstractClientDataModel.h"
#import "NSString+Extensions.h"

#define KEY_ERROR_CODE      @"code"
#define KEY_ERROR_MESSAGE   @"message"
#define CONNECTION_FAILED_CODE   0
#define CONNECTION_FAILED   @"CONNECTION_FAILED"

NSString *const ApiomatRequestException = @"ApiomatRequestException";
NSString *const EmptyHrefException = @"EmptyHrefException";

@interface AOMAbstractClientDataModel (FriendClass)
@property (weak, nonatomic) NSString *href;
@end

@interface AOMDatastore()
@property (nonatomic) AOMCacheStrategy cacheStrategy;
@property (nonatomic, strong) NSMutableDictionary *mapHrefToETag;
@property (nonatomic, strong) NSMutableDictionary *mapHrefToLastModified;
typedef void (^AOMResponseBlock)(NSString* responseBlock, NSError *error);
typedef void (^AOMResponseDataBlock)(NSData* responseBlock, NSError *error);


- (NSString*) createStaticDataHref:(BOOL) isImage;
- (NSString*) createHref:(NSString*) _href;
- (NSString*) classNameFromHref:(NSString*)_modelHref;
- (NSString*) postOnServerWithData: (NSData*) _data
                           andHref: (NSString*) _href;

- (void) postASyncOnServerWithData: (NSData*) _data
                           andHref: (NSString*) _href
                  andCompleteBlock:(AOMResponseBlock) _completeBlock;

- (NSString*) getAuthenticationHeader;
- (NSString*) createModelHrefFromClass:(Class) class;
- (void)setHeader:(NSMutableURLRequest *)urlRequest;
- (void)setHeader:(NSMutableURLRequest *)urlRequest ForBinaryData: (BOOL) _isBinary;
+ (NSString*) concatHref: (NSString*) _href
               withQuery: (NSString*) _query;

- (void)raiseConnectionFailedException;
- (void)raiseApiomatExceptionWithErrorCode:(NSInteger) errorCode andExpectedCode:(NSInteger) expectedCode andReason:(NSString*)reason;
- (void)raiseApiomatExceptionWithErrorCode:(NSInteger) errorCode andExpectedCodes:(NSArray*) expectedCodes andReason:(NSString*)reason;

- (NSError*)createApiomatError:(NSInteger) errorCode expectedCode:(NSArray*)expectedCodes reason:(NSString*) reason;

- (NSString*) sendReqWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*)httpBody andExpectedCodes:(NSArray*) expectedCodes;
- (NSString*) sendRequestWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*)httpBody andExpectedCode:(NSInteger) expectedCode;

- (NSString*) sendRequestWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andExpectedCode:(NSInteger) expectedCode;
- (NSString*) sendRequestWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andExpectedCodes:(NSArray*) expectedCodes;

- (NSData*) getBinaryDataWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody andExpectedCodes:(NSArray*) expectedCodes andResponse: (NSURLResponse**) response andForBinaryData: (BOOL) _binaryDataReq;

- (void) getBinaryDataAsyncWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody andExpectedCodes:(NSArray*) expectedCodes andResponseBlock:(AOMResponseDataBlock) _block andForBinaryData: (BOOL) _binaryDataReq;

- (void) sendAsyncReqWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody  andExpectedCode:(NSInteger) expectedCode andCompleteBlock:(AOMResponseBlock)_responseBlock;
- (void) sendAsyncReqWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody andExpectedCodes:(NSArray*) expectedCodes andCompleteBlock:(AOMResponseBlock)_responseBlock;
+ (NSURL*) getURLMinusQuery:(NSURL*) _url;
@end

@implementation AOMDatastore

@synthesize baseUrl = m_baseUrl;
@synthesize apiKey = m_apiKey;
@synthesize userName = m_userName;
@synthesize password = m_password;
@synthesize modelStore;
@synthesize loadWithLinks;
@synthesize cacheStrategy;
@synthesize mapHrefToETag;
@synthesize mapHrefToLastModified;

- (id)init
{
    self = [super init];
    if (self) {
        cacheStrategy = AOM_CHECK_SERVER_ELSE_CACHE;
        mapHrefToETag = [[NSMutableDictionary alloc] init];
        mapHrefToLastModified = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (AOMDatastore *)sharedInstance
{
    static dispatch_once_t pred;
    static AOMDatastore* sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[AOMDatastore alloc] init];
    });
    return sharedInstance;
}

+ (AOMDatastore*)configureWithUser:(AOMUser*)_user
{
    return [AOMDatastore configureWithUrl:baseUrl andApiKey:apiKey andUsername:[_user userName] andPassword:[_user password] andModelStore:nil];
}

+ (AOMDatastore*)configureWithUser:(AOMUser*)_user andModelStore:(id<AOMModelStoreProtocol>)_modelStore
{
    return [AOMDatastore configureWithUrl:baseUrl andApiKey:apiKey andUsername:[_user userName] andPassword:[_user password] andModelStore:_modelStore];
}

+ (AOMDatastore*)configureWithUser:(AOMUser*)_user andLoadWithLinks: (BOOL)_loadWithLinks
{
    return [AOMDatastore configureWithUrl:baseUrl andApiKey:apiKey andUsername:[_user userName] andPassword:[_user password] andLoadWithLinks:_loadWithLinks];
}

+ (AOMDatastore*)configureWithUrl:(NSString*)_baseUrl
                     andApiKey: (NSString*)_apiKey
{
    return [AOMDatastore configureWithUrl:_baseUrl andApiKey:_apiKey andUsername:nil andPassword:nil];
}

+ (AOMDatastore*) configureWithUrl:(NSString*)_baseUrl
                      andApiKey: (NSString*)_apiKey
                    andUsername: (NSString*)_username
                    andPassword: (NSString*)_password
{
    return [AOMDatastore configureWithUrl:_baseUrl andApiKey:_apiKey andUsername:_username andPassword:_password andModelStore:nil];
}

+ (AOMDatastore*)configureWithUrl:(NSString*)_baseUrl
                     andApiKey: (NSString*)_apiKey
                 andModelStore:(id<AOMModelStoreProtocol>)_modelStore
{
    return [AOMDatastore configureWithUrl:_baseUrl andApiKey:_apiKey andUsername:nil andPassword:nil andModelStore:_modelStore];
}

+ (AOMDatastore*) configureWithUrl:(NSString*)_baseUrl
                      andApiKey: (NSString*)_apiKey
                    andUsername: (NSString*)_username
                    andPassword: (NSString*)_password
                  andModelStore:(id<AOMModelStoreProtocol>)_modelStore
{
    [AOMDatastore sharedInstance].baseUrl = _baseUrl;
    NSLog(@"burl:%@",[AOMDatastore sharedInstance].baseUrl );
    [AOMDatastore sharedInstance].modelStore = _modelStore;
    //If we have a model store we always have to load referenced hrefs
    if(_modelStore) {
        [AOMDatastore sharedInstance].loadWithLinks = true;
    }
    [AOMDatastore sharedInstance].apiKey = _apiKey;
    [AOMDatastore sharedInstance].userName = _username;
    [AOMDatastore sharedInstance].password = _password;
    //Init cache policy
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
                                                         diskCapacity:20 * 1024 * 1024
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    /* clear cache lists */
    [[[AOMDatastore sharedInstance] mapHrefToETag] removeAllObjects];
    [[[AOMDatastore sharedInstance] mapHrefToLastModified] removeAllObjects];
    return [AOMDatastore sharedInstance];
}

+ (AOMDatastore*) configureWithUrl:(NSString*)_baseUrl
                      andApiKey: (NSString*)_apiKey
               andLoadWithLinks: (BOOL)_loadWithLinks
{
    [AOMDatastore sharedInstance].loadWithLinks = _loadWithLinks;
    return [AOMDatastore configureWithUrl:_baseUrl andApiKey:_apiKey andUsername:nil andPassword:nil andModelStore:nil];
}

+ (AOMDatastore*) configureWithUrl:(NSString*)_baseUrl
                      andApiKey: (NSString*)_apiKey
                    andUsername: (NSString*)_username
                    andPassword: (NSString*)_password
               andLoadWithLinks: (BOOL)_loadWithLinks
{
    [AOMDatastore sharedInstance].loadWithLinks = _loadWithLinks;
    return [AOMDatastore configureWithUrl:_baseUrl andApiKey:_apiKey andUsername:_username andPassword:_password andModelStore:nil];
}

+ (AOMDatastore*) setCachingStrategy:(AOMCacheStrategy) _cacheStrategy
{
    [[AOMDatastore sharedInstance] setCacheStrategy:_cacheStrategy];
    
    return [AOMDatastore sharedInstance];
}

#pragma mark - Post requests
- (NSString *) postOnServer: (AOMAbstractClientDataModel*) _dataModel
{
    return [self postOnServer:_dataModel withHref:[self createModelHrefFromClass:[_dataModel class]]];
}

- (NSString*) postOnServer: (AOMAbstractClientDataModel*) _model
                  withHref: (NSString*) _href
{
    NSLog(@"JSON Rep:%@",[_model toJson]);
    //check current state of object (If already in save process than throw error)
    if([_model objectState] == ObjectState_PERSISTING)
    {
        [self raiseApiomatExceptionWithErrorCode:AOMIN_PERSISTING_PROCESS andExpectedCode:201 andReason:[AOMStatus getReasonPhraseForCode:AOMIN_PERSISTING_PROCESS]];
        return FALSE;
    }
    [_model setObjectState:ObjectState_PERSISTING];
    
    NSString *href = nil;
    NSData* data = [[_model toJson] dataUsingEncoding:NSUTF8StringEncoding];
    @try {
        href = [self postOnServerWithData:data andHref:_href];
        [_model setHref:href];
        
        if([self modelStore]) {
            [[self modelStore] addModel:_model];
        }
    }
    @catch (NSException *exception) {
        [exception raise];
    }
    @finally {
        [_model setObjectState:ObjectState_PERSISTED];
    }
    return href;
}

- (NSString*) postOnServerWithData: (NSData*) _data
                           andHref: (NSString*) _href
{
    //Check if HREF exists
    NSParameterAssert([NSString isEmptyString:_href]==false);
    
    NSString* result = [self sendRequestWithUrl:_href andHTTPMethod:@"POST" andHTTPBody:_data andExpectedCode:201];
    return result;
}

- (NSString*) postStaticDataOnServer: (NSData*) _rawData
                             asImage: (BOOL) _isImage
{
    NSString* href = [self createStaticDataHref:_isImage];
    return [self postOnServerWithData:_rawData andHref:href];
}

#pragma mark Async post request
- (void) postOnServerAsync:(AOMAbstractClientDataModel*)_dataModel
{
    [self postOnServerAsync:_dataModel withFinishingBlock:nil];
}

- (void) postOnServerAsync:(AOMAbstractClientDataModel*)_dataModel withFinishingBlock:(AOMBlockWithHref) _block
{
    [self postOnServerAsync:_dataModel withHref:[self createModelHrefFromClass:[_dataModel class]] andFinishingBlock:_block];
}

- (void) postOnServerAsync:(AOMAbstractClientDataModel*)_dataModel  withHref: (NSString*) _href andFinishingBlock:(AOMBlockWithHref) _finishingBlock
{
    //check current state of object (If already in save process than throw error)
    if([_dataModel objectState] == ObjectState_PERSISTING)
    {
        if(_finishingBlock)
        {
            _finishingBlock(Nil, [self createApiomatError:AOMIN_PERSISTING_PROCESS expectedCode:[NSArray arrayWithObjects:[NSNumber numberWithInt:200], nil] reason:[AOMStatus getReasonPhraseForCode:AOMIN_PERSISTING_PROCESS]]);
        }
        return;
    }
    [_dataModel setObjectState:ObjectState_PERSISTING];
    NSData* data = [[_dataModel toJson] dataUsingEncoding:NSUTF8StringEncoding];
    AOMResponseBlock completeBlock = ^(NSString *responseStr, NSError *error){
        if(error==FALSE)
        {
            [_dataModel setHref:responseStr];
            
            if([self modelStore]) {
                [[self modelStore] addModel:_dataModel];
            }
        }
        [_dataModel setObjectState:ObjectState_PERSISTED];
        //For normal post req responseStr==HREF of new object
        if (_finishingBlock) {
            _finishingBlock(responseStr, error);
        }
    };
    [self postASyncOnServerWithData:data andHref:_href andCompleteBlock:completeBlock];
}

- (void) postOnServerAsync:(AOMAbstractClientDataModel*)_dataModel  withHref: (NSString*) _href
{
    [self postOnServerAsync:_dataModel withHref:_href andFinishingBlock:Nil];
}

- (void) postStaticDataOnServerAsync:(NSData*) _rawData  asImage:(BOOL) _isImage andFinishingBlock:(AOMBlockWithHref) _block
{
    NSString* href = [self createStaticDataHref:_isImage];
    AOMResponseBlock completeBlock = ^(NSString *responseStr, NSError *error){
        //For post req responseStr==HREF of object
        if (_block) {
            _block(responseStr, error);
        }
    };
    [self postASyncOnServerWithData:_rawData andHref:href andCompleteBlock:completeBlock];
}

- (void) postASyncOnServerWithData: (NSData*) _data
                           andHref: (NSString*) _href andCompleteBlock:(AOMResponseBlock) _completeBlock;
{
    NSParameterAssert([NSString isEmptyString:_href]==false);
    
    [self sendAsyncReqWithUrl:_href andHTTPMethod:@"POST" andHTTPBody:_data andExpectedCode:201 andCompleteBlock:_completeBlock];
}
#pragma mark - Delete requests
- (BOOL) deleteOnServerWithUrl:(NSString *)_modelHref {
    //Check if HREF exists
    NSParameterAssert([NSString isEmptyString:_modelHref]==false);
    
    NSString* responseString =  [self sendRequestWithUrl:_modelHref andHTTPMethod:@"DELETE" andExpectedCode:204];
    
    if([self modelStore]) {
        AOMAbstractClientDataModel *model = [[self modelStore] modelWithHref:_modelHref];
        if(model)
        {
            [[self modelStore] removeModel:model];
        }
    }
    
    return responseString != nil;
}

- (BOOL) deleteOnServer: (AOMAbstractClientDataModel*) _model
{
    NSString *urlString = [_model getHref];
    BOOL retValue = [self deleteOnServerWithUrl:urlString];
    
    return retValue;
}

#pragma mark - async delete requests
- (void) deleteOnServerAsyncWithUrl:(NSString *)_modelHref withFinishingBlock:(AOMEmptyBlock)_block
{
    //Check if HREF exists
    NSParameterAssert([NSString isEmptyString:_modelHref]==false);
    [self sendAsyncReqWithUrl:_modelHref andHTTPMethod:@"DELETE" andHTTPBody:Nil andExpectedCode:204 andCompleteBlock:^(NSString *responseBlock, NSError *error) {
        //Delete also from modelstore
        if([self modelStore]) {
            AOMAbstractClientDataModel *model = [[self modelStore] modelWithHref:_modelHref];
            if(model)
            {
                [[self modelStore] removeModel:model];
            }
        }
        if(_block)
        {
            _block(error);
        }
    }];
}
- (void) deleteOnServerAsync: (AOMAbstractClientDataModel*) _model withFinishingBlock:(AOMEmptyBlock)_block
{
    [self deleteOnServerAsyncWithUrl:[_model getHref] withFinishingBlock:_block];
}

#pragma mark - Update requests
- (BOOL) updateOnServer: (AOMAbstractClientDataModel*) _model
{
    BOOL response = FALSE;
    
    //check current state of object (If already in save process than throw error)
    if([_model objectState] == ObjectState_PERSISTING)
    {
        [self raiseApiomatExceptionWithErrorCode:AOMIN_PERSISTING_PROCESS andExpectedCode:200 andReason:[AOMStatus getReasonPhraseForCode:AOMIN_PERSISTING_PROCESS]];
        return FALSE;
    }
    [_model setObjectState:ObjectState_PERSISTING];
    
    NSString* jsonStr = [_model toJson];
    NSString *urlString = [_model getHref];
    
    @try {
        response = [self updateOnServerWithUrl:urlString andJson:jsonStr];
    }
    @catch (NSException *exception) {
        [exception raise];
    }
    @finally {
        [_model setObjectState:ObjectState_PERSISTED];
    }
    
    return response;
}

- (BOOL) updateOnServerWithUrl: (NSString*) _url andJson: (NSString*) _json
{
    //Check if URL exists
    NSParameterAssert([NSString isEmptyString:_url]==false);
    NSString* responseString = nil;
    NSData* data = [_json dataUsingEncoding:NSUTF8StringEncoding];
    
    @try {
        responseString = [self sendRequestWithUrl:_url andHTTPMethod:@"PUT" andHTTPBody:data andExpectedCode:200];
    }
    @catch (NSException *exception) {
        [exception raise];
    }
    
    return responseString != nil;
}

- (void) updateOnServerAsync: (AOMAbstractClientDataModel*) _model withFinishingBlock:(AOMEmptyBlock)_block
{
    //check current state of object (If already in save process than throw error)
    if([_model objectState] == ObjectState_PERSISTING)
    {
        if(_block)
        {
            _block([self createApiomatError:AOMIN_PERSISTING_PROCESS expectedCode:[NSArray arrayWithObjects:[NSNumber numberWithInt:200], nil] reason:[AOMStatus getReasonPhraseForCode:AOMIN_PERSISTING_PROCESS]]);
        }
        return;
    }
    [_model setObjectState:ObjectState_PERSISTING];
    
    NSString* jsonStr = [_model toJson];
    NSString *href = [_model getHref];
    
    [self updateOnServerAsyncWithUrl: href withJson: jsonStr andWithFinishingBlock:^(NSError *error) {
        [_model setObjectState:ObjectState_PERSISTED];
        if(_block)
        {
            _block(error);
        }
    }];
}

- (void) updateOnServerAsyncWithUrl: (NSString*) _url withJson: (NSString*) _json andWithFinishingBlock:(AOMEmptyBlock)_block
{
    //Check if _url exists
    NSParameterAssert([NSString isEmptyString:_url]==false);
    NSData* data = [_json dataUsingEncoding:NSUTF8StringEncoding];
    
    [self sendAsyncReqWithUrl:_url andHTTPMethod:@"PUT" andHTTPBody:data andExpectedCode:200 andCompleteBlock:^(NSString *responseBlock, NSError *error) {
        if(_block)
        {
            _block(error);
        }
    }];
}

#pragma mark - Getter requests
- (AOMAbstractClientDataModel*) loadFromServerWithHref: (NSString*) _modelHref
                                           andStoreIn :(AOMAbstractClientDataModel*) _dataModel
{
    NSParameterAssert([NSString isEmptyString:_modelHref]==false);
    //check current state of object (If already in save process than throw error)
    if(_dataModel && [_dataModel objectState] == ObjectState_PERSISTING)
    {
        [self raiseApiomatExceptionWithErrorCode:AOMIN_PERSISTING_PROCESS andExpectedCode:200 andReason:[AOMStatus getReasonPhraseForCode:AOMIN_PERSISTING_PROCESS]];
        return _dataModel;
    }
    NSString *urlString = [AOMDatastore concatHref: _modelHref withQuery: nil];
    NSString* responseString = [self sendRequestWithUrl:urlString andHTTPMethod:@"GET" andExpectedCodes:[NSArray arrayWithObjects:[NSNumber numberWithInt:200],[NSNumber numberWithInt:204], nil]];
    
    if ([NSString isEmptyString:responseString] == false)
    {
        [_dataModel fromJson:responseString];
        
        //If we got empty response ignore and return nil
        if ([NSString isEmptyString:[_dataModel getHref]]) {
            return nil;
        }
        if([self modelStore]) {
            [[self modelStore] addModel:_dataModel];
        }
    } else {
        [self raiseConnectionFailedException];
    }
    return _dataModel;
}

- (NSMutableArray*) loadListFromServerWithClass:(Class)_class andQuery: (NSString*) _query
{
    NSString* url = [self createModelHrefFromClass:_class];
    return [self loadFromServerWithHref:url andClass:_class andQuery:_query];
}

- (NSMutableArray*) loadFromServerWithHref:(NSString*) _modelHref andClass: (Class) _class andQuery:(NSString*) _query {
    NSMutableArray* resultArray = nil;
    
    NSParameterAssert([NSString isEmptyString:_modelHref]==false);
    
    NSString *urlString = [AOMDatastore concatHref: _modelHref withQuery: _query];
    NSString* results = [self sendRequestWithUrl:urlString andHTTPMethod:@"GET" andExpectedCode:200];
    
    if (results)
    {
        NSMutableArray* jsonArray = [results yajl_JSON];
        resultArray = [[NSMutableArray alloc] init];
        
        for (NSMutableDictionary* jsonRep in jsonArray)
        {
            AOMAbstractClientDataModel* obj = [[_class alloc] init];
            [obj fromJSONWithObject:jsonRep];
            [resultArray addObject:obj];
            if([self modelStore])
            {
                [[self modelStore] addModel:obj];
            }
        }
    }
    return resultArray;
}

#pragma mark - Async getter methods
- (void) loadFromServerAsyncWithHref:(NSString*) _modelHref andFinishingBlock:(AOMBlockWithResult) _block
{
    [self loadFromServerAsyncWithHref:_modelHref andStoreIn:Nil andFinishingBlock:_block];
}
- (void) loadFromServerAsyncWithHref:(NSString*) _modelHref andStoreIn:(AOMAbstractClientDataModel*) _model andFinishingBlock:(AOMBlockWithResult) _block
{
    NSParameterAssert([NSString isEmptyString:_modelHref]==false);
    //check current state of object (If already in save process than throw error)
    if(_model && [_model objectState] == ObjectState_PERSISTING)
    {
        if(_block)
        {
            _block(Nil, [self createApiomatError:AOMIN_PERSISTING_PROCESS expectedCode:[NSArray arrayWithObjects:[NSNumber numberWithInt:200], nil] reason:[AOMStatus getReasonPhraseForCode:AOMIN_PERSISTING_PROCESS]]);
        }
        return ;
    }
    NSString *urlString = [AOMDatastore concatHref: _modelHref withQuery: nil];
    AOMResponseBlock completeBlock = ^(NSString *responseString, NSError *error) {
        bool isOk = TRUE;
        AOMAbstractClientDataModel *obj = _model;
        if ([NSString isEmptyString:responseString] == false && error==FALSE)
        {
            if(obj==FALSE)
            {
                NSString *className = [self classNameFromHref:_modelHref ];
                obj = [[NSClassFromString(className) alloc] init];
            }
            [obj fromJson:responseString];
            
            //If we got empty response ignore and return nil
            if ([NSString isEmptyString:[obj getHref]])
            {
                isOk = FALSE;
            }
            if([self modelStore])
            {
                [[self modelStore] addModel:obj];
            }
        }
        if(_block)
        {
            _block(isOk?obj:Nil, error);
        }
    };
    
    [self sendAsyncReqWithUrl:urlString andHTTPMethod:@"GET" andHTTPBody:Nil andExpectedCodes:[NSArray arrayWithObjects:[NSNumber numberWithInt:200],[NSNumber numberWithInt:204], nil] andCompleteBlock:completeBlock];
}

- (void) loadListFromServerAsyncWithClass:(Class)_class andQuery: (NSString*) _query andFinishingBlock:(AOMBlockWithResults) _block
{
    NSString* url = [self createModelHrefFromClass:_class];
    [self loadFromServerAsyncWithHref:url andClass:_class andQuery:_query andFinishingBlock:_block];
}

- (void) loadFromServerAsyncWithHref:(NSString*) _modelHref andClass: (Class) _class andQuery:(NSString*) _query andFinishingBlock:(AOMBlockWithResults) _block
{
    NSParameterAssert([NSString isEmptyString:_modelHref]==false);
    
    AOMResponseBlock completeBlock = ^(NSString *result, NSError *error){
        NSMutableArray *resultArray = Nil;
        if (result && error==FALSE)
        {
            NSMutableArray* jsonArray = [result yajl_JSON];
            resultArray = [[NSMutableArray alloc] init];
            
            for (NSMutableDictionary* jsonRep in jsonArray)
            {
                AOMAbstractClientDataModel* obj = [[_class alloc] init];
                [obj fromJSONWithObject:jsonRep];
                [resultArray addObject:obj];
                if([self modelStore])
                {
                    [[self modelStore] addModel:obj];
                }
            }
        }
        
        //Call caller
        if (_block)
        {
            _block(resultArray, error);
        }
    };
    
    NSString *urlString = [AOMDatastore concatHref: _modelHref withQuery: _query];
    [self sendAsyncReqWithUrl:urlString andHTTPMethod:@"GET" andHTTPBody:Nil andExpectedCode:200 andCompleteBlock:completeBlock];
}

- (NSData*) loadResourceWithHref:(NSString *)_href
{
    NSParameterAssert([NSString isEmptyString:_href]==false);
    
    NSData *result = nil;
    NSURLResponse *response = nil;
    
    result = [self getBinaryDataWithUrl:_href andHTTPMethod:@"GET" andHTTPBody:nil andExpectedCodes:[NSArray arrayWithObject:[NSNumber numberWithInt:200 ]] andResponse:&response andForBinaryData:true];
    
    if (result)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if([httpResponse statusCode] != 200)
        {
            NSString *responseString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
            
            [self raiseApiomatExceptionWithErrorCode:[httpResponse statusCode] andExpectedCode:200 andReason:responseString];
        }
        else
        {
            //add returned last modified/eTag to list for req
            if(cacheStrategy != AOM_NO_CACHE)
            {
                NSURL *reqURL = [AOMDatastore getURLMinusQuery:[response URL]];
                NSString *lastModified = [[httpResponse allHeaderFields] objectForKey:@"Last-Modified"];
                /* Update list with lastModified */
                if(lastModified)
                {
                    [mapHrefToLastModified setObject:lastModified forKey:reqURL];
                }
                NSString *eTag = [[httpResponse allHeaderFields] objectForKey:@"ETag"];
                /* Update list with eTag */
                if(eTag)
                {
                    [mapHrefToETag setObject:eTag forKey:reqURL];
                }
            }
        }
    }
    else
    {
        [self raiseConnectionFailedException];
    }
    
    return result;
}

- (void) loadResourceAsyncWithHref: (NSString*) _href andWithFinishingBlock:(AOMBlockWithNSDataResults) _block
{
    NSParameterAssert([NSString isEmptyString:_href]==false);
    
    [self getBinaryDataAsyncWithUrl:_href andHTTPMethod:@"GET" andHTTPBody:nil andExpectedCodes:[NSArray arrayWithObjects:[NSNumber numberWithInt:200], nil] andResponseBlock:^(NSData *responseData, NSError *aomError) {
        if(_block)
        {
            _block(responseData, aomError);
        }
    } andForBinaryData:true];
}

#pragma mark - Helper methods

- (NSString*) sendRequestWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*)httpBody andExpectedCode:(NSInteger) expectedCode
{
    return [self sendReqWithUrl:urlString andHTTPMethod:httpMethod andHTTPBody:httpBody andExpectedCodes:[NSArray arrayWithObject:[NSNumber numberWithInt:expectedCode]]];
}

- (NSString*) sendReqWithUrl:(NSString*)url andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody andExpectedCodes:(NSArray*) expectedCodes
{
    NSString* responseString = nil;
    NSURLResponse *response = nil;
    NSData *responseData = [self getBinaryDataWithUrl:url andHTTPMethod:httpMethod andHTTPBody:httpBody andExpectedCodes:expectedCodes andResponse:&response andForBinaryData:false];
    
    if (responseData)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        
        //NSLog(@"loadstatusCode = %d; allHeaderFields = %@; result = %@", [httpResponse statusCode], [httpResponse allHeaderFields], responseString);
        if([expectedCodes containsObject:[NSNumber numberWithInt:[httpResponse statusCode]]] == false)
        {
            [self raiseApiomatExceptionWithErrorCode:[httpResponse statusCode] andExpectedCodes:expectedCodes andReason:responseString];
        }
        else
        {
            NSLog(@"Headers: %@",[httpResponse allHeaderFields]);
            //Set responseString to location from header if POST request
            if([httpMethod isEqualToString: @"POST"])
            {
                responseString = [[httpResponse allHeaderFields] objectForKey:@"Location"];
            }
            //add returned last modified/eTag to list for req
            else if([httpMethod isEqualToString: @"GET"] && cacheStrategy != AOM_NO_CACHE)
            {
                NSURL *reqURL = [AOMDatastore getURLMinusQuery:[response URL]];
                NSString *lastModified = [[httpResponse allHeaderFields] objectForKey:@"Last-Modified"];
                /* Update list with lastModified */
                if(lastModified)
                {
                    [mapHrefToLastModified setObject:lastModified forKey:reqURL];
                }
                NSString *eTag = [[httpResponse allHeaderFields] objectForKey:@"ETag"];
                /* Update list with eTag */
                if(eTag)
                {
                    [mapHrefToETag setObject:eTag forKey:reqURL];
                }
            }
        }
    }
    else
    {
        [self raiseConnectionFailedException];
    }
    
    return responseString;
}

- (NSData*) getBinaryDataWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody andExpectedCodes:(NSArray*) expectedCodes andResponse: (NSURLResponse**) response andForBinaryData: (BOOL) _binaryDataReq
{
    NSURL *url = [[NSURL alloc] initWithString:[[self createHref:urlString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:[self cacheStrategy] timeoutInterval:3600];
    [urlRequest setHTTPMethod:httpMethod];
    if(httpBody)
    {
        [urlRequest setHTTPBody:httpBody];
    }
    [self setHeader:urlRequest ForBinaryData:_binaryDataReq];
    
    NSLog(@"%@ request on url: %@", httpMethod, url);
    
    NSData *responseData;
    NSError* error = nil;
    responseData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:response error:&error];
    
    return responseData;
}

- (void) getBinaryDataAsyncWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody andExpectedCodes:(NSArray*) expectedCodes andResponseBlock:(AOMResponseDataBlock) _responseBlock andForBinaryData: (BOOL) _binaryDataReq
{
    NSURL *url = [[NSURL alloc] initWithString:[[self createHref:urlString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:[self cacheStrategy] timeoutInterval:3600];
    [urlRequest setHTTPMethod:httpMethod];
    if(httpBody)
    {
        [urlRequest setHTTPBody:httpBody];
    }
    [self setHeader:urlRequest ForBinaryData:_binaryDataReq];
    
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error)
     {
         NSError *aomError = nil;
         if (responseData)
         {
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
             
             if([expectedCodes containsObject:[NSNumber numberWithInt:[httpResponse statusCode]]] == false)
             {
                 NSString* reasonStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
                 aomError = [self createApiomatError:[httpResponse statusCode]  expectedCode:expectedCodes reason:reasonStr];
             }
             else
             {
                 //Set responseString to location from header if POST request
                 if([httpMethod isEqualToString: @"POST"])
                 {
                     NSString* location = [[httpResponse allHeaderFields] objectForKey:@"Location"];
                     responseData = [location dataUsingEncoding:NSUTF8StringEncoding];
                 }
                 else if([httpMethod isEqualToString: @"GET"] && cacheStrategy != AOM_NO_CACHE)
                 {
                     NSURL *reqURL = [AOMDatastore getURLMinusQuery:url];
                     NSString *lastModified = [[httpResponse allHeaderFields] objectForKey:@"Last-Modified"];
                     
                     /* Update list with lastModified */
                     if(lastModified)
                     {
                         [mapHrefToLastModified setObject:lastModified forKey:reqURL];
                     }
                     NSString *eTag = [[httpResponse allHeaderFields] objectForKey:@"ETag"];
                     /* Update list with eTag */
                     if(eTag)
                     {
                         [mapHrefToETag setObject:eTag forKey:reqURL];
                     }
                 }
             }
         }
         else
         {
             aomError = [self createApiomatError:[error code]  expectedCode:expectedCodes reason:[error localizedDescription]];
         }
         _responseBlock(responseData, aomError);
     }];
}

- (NSString*) sendRequestWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andExpectedCode:(NSInteger) expectedCode
{
    return [self sendRequestWithUrl:urlString andHTTPMethod:httpMethod andExpectedCodes:[NSArray arrayWithObject:[NSNumber numberWithInt:expectedCode ]]];
}

- (NSString*) sendRequestWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andExpectedCodes:(NSArray*) expectedCodes
{
    return [self sendReqWithUrl:urlString andHTTPMethod:httpMethod andHTTPBody:nil andExpectedCodes:expectedCodes];
}

- (void) sendAsyncReqWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody  andExpectedCode:(NSInteger) expectedCode andCompleteBlock:(AOMResponseBlock)_responseBlock
{
    [self sendAsyncReqWithUrl:urlString andHTTPMethod:httpMethod andHTTPBody:httpBody andExpectedCodes:[NSArray arrayWithObject:[NSNumber numberWithInt:expectedCode]] andCompleteBlock:_responseBlock];
}

- (void) sendAsyncReqWithUrl:(NSString*)urlString andHTTPMethod:(NSString*) httpMethod andHTTPBody:(NSData*) httpBody andExpectedCodes:(NSArray*) expectedCodes andCompleteBlock:(AOMResponseBlock)_responseBlock
{
    AOMResponseDataBlock dataResponseBlock = ^(NSData *responseData, NSError *aomError) {
        NSString* responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        _responseBlock(responseString, aomError);
    };
    
    [self getBinaryDataAsyncWithUrl:urlString andHTTPMethod:httpMethod andHTTPBody:httpBody andExpectedCodes:expectedCodes
                   andResponseBlock:dataResponseBlock andForBinaryData:false];
}

+ (NSString*) concatHref: (NSString*) _href
               withQuery: (NSString*) _query
{
    NSString* result;
    result= [NSString stringWithFormat:@"%@?withReferencedHrefs=%@",_href,[[AOMDatastore sharedInstance] loadWithLinks]?@"true":@"false" ];
    if(_query){
        result= [NSString stringWithFormat:@"%@&q=%@",result,_query];
    }
    
    return result;
    
}

- (NSString*) getAuthenticationHeader{
    NSString* credentials = [NSString stringWithFormat:@"%@:%@", m_userName,m_password];
    NSLog(@"Authentication: %@" , credentials);
    NSString* authenticationString = [@"" stringByAppendingFormat:@"Basic %@",
                                      [credentials stringByEncodingBase64]];
    return authenticationString;
}

- (NSString*) createModelHrefFromClass: (Class) _class
{
    NSString* _modulName = [_class performSelector:@selector(getModuleName)];
    NSString* _simpleModelName = [_class performSelector:@selector(getSimpleName)];
    return [NSString stringWithFormat:@"%@/models/%@/%@", m_baseUrl , _modulName,_simpleModelName ];
}

- (NSString*) createStaticDataHref:(BOOL) isImage {
    return [NSString stringWithFormat:@"%@/data/%@/", m_baseUrl , isImage?@"images":@"files" ];
}

- (NSString*) createHref:(NSString *)_href
{
    if ( [_href hasPrefix:@"http"] )
    {
        return _href;
    }
    
    if ( [_href hasPrefix:@"/apps" ] )
    {
        NSRange range = [[self baseUrl] rangeOfString:@"/apps"];
        return [[[self baseUrl] substringToIndex:range.location] stringByAppendingString:_href];
    }
    
    return [[self baseUrl] stringByAppendingFormat:@"/%@", _href ];
}

- (NSString*) classNameFromHref:(NSString*)_modelHref
{
    NSString *tmpStr = [_modelHref stringByReplacingOccurrencesOfString:[self baseUrl] withString:@""];
    NSArray *uriParts = [tmpStr componentsSeparatedByString:@"/"];
    if(uriParts && [uriParts count] > 3)
    {
        return uriParts[3];
    }
    return Nil;
}

- (void)setHeader:(NSMutableURLRequest *)urlRequest
{
    [self setHeader:urlRequest ForBinaryData:false];
}

- (void)setHeader:(NSMutableURLRequest *)urlRequest ForBinaryData: (BOOL) _isBinary
{
    if(_isBinary)
    {
        [urlRequest setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
    }
    else
    {
        [urlRequest setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    
    [urlRequest setValue:@"true" forHTTPHeaderField:@"X-apiomat-fullupdate"];
    
    
    if(m_userName && m_password)
    {
        [urlRequest setValue:[self getAuthenticationHeader] forHTTPHeaderField:@"Authorization"];
    }
    [urlRequest setValue:m_apiKey forHTTPHeaderField:@"X-apiomat-apikey"];
    [urlRequest setValue:sdkVersion forHTTPHeaderField:@"X-apiomat-sdkVersion"];
    [urlRequest setValue:[AOMAbstractClientDataModel getSystem] forHTTPHeaderField:@"X-apiomat-system"];
    /* Check caching and send headers if there*/
    if(cacheStrategy!=AOM_NO_CACHE)
    {
        NSURL *reqURL = [AOMDatastore getURLMinusQuery:[urlRequest URL]];
        NSString* lastModified = [mapHrefToLastModified objectForKey:reqURL];
        [urlRequest setValue:lastModified forHTTPHeaderField:@"If-Modified-Since"];
        [urlRequest setValue:[mapHrefToETag objectForKey:reqURL] forHTTPHeaderField:@"If-None-Match"];
    }
}

+ (NSURL*) getURLMinusQuery:(NSURL*) _url
{
    NSURL *newURL = [[NSURL alloc] initWithScheme:[_url scheme]
                                             host:[_url host]
                                             path:[_url path]];
    return newURL;
}


# pragma mark Helper for NSError and NSException
- (void)raiseConnectionFailedException {
    NSMutableDictionary *error = [[NSMutableDictionary alloc] init];
    
    [error setObject:[NSString stringWithFormat:@"%i", CONNECTION_FAILED_CODE]
              forKey:KEY_ERROR_CODE];
    [error setObject:@"Connection failed"
              forKey:KEY_ERROR_MESSAGE];
    
    [[NSException exceptionWithName:CONNECTION_FAILED
                             reason:[error objectForKey:KEY_ERROR_CODE]
                           userInfo:error] raise];
}

- (void)raiseApiomatExceptionWithErrorCode:(NSInteger) errorCode andExpectedCodes:(NSArray*) expectedCodes andReason:(NSString*)reason {
    NSMutableDictionary *error = [[NSMutableDictionary alloc] init];
    NSString* reasonString = [NSString stringWithFormat:@"Return code %i does not match expected one(s) (%@) - %@", errorCode, [expectedCodes description],reason ];
    
    /* Check if it is a status code*/
    AOMStatusCode statusCode =  [AOMStatus getStatusForCode:errorCode];
    if(statusCode)
    {
        reasonString  = [AOMStatus getReasonPhraseForCode:statusCode];
    }
    
    [error setObject:[NSString stringWithFormat:@"%i", errorCode]
              forKey:KEY_ERROR_CODE];
    [error setObject:reasonString
              forKey:KEY_ERROR_MESSAGE];
    
    [[NSException exceptionWithName:ApiomatRequestException
                             reason:[error objectForKey:KEY_ERROR_CODE]
                           userInfo:error] raise];
}
- (void)raiseApiomatExceptionWithErrorCode:(NSInteger) errorCode andExpectedCode:(NSInteger) expectedCode andReason:(NSString*)reason {
    [self raiseApiomatExceptionWithErrorCode:errorCode andExpectedCodes:[NSArray arrayWithObjects: [NSNumber numberWithInt:expectedCode], nil] andReason:reason];
}

- (NSError*)createApiomatError:(NSInteger) errorCode expectedCode:(NSArray*)expectedCodes reason:(NSString*) reason
{
    NSString* reasonString = [NSString stringWithFormat:@"Return code %i does not match expected one(s) (%@) - %@", errorCode, [expectedCodes description],reason ];
    
    /* Check if it is a valid status code */
    AOMStatusCode statusCode =  [AOMStatus getStatusForCode:errorCode];
    if(statusCode)
    {
        reasonString  = [AOMStatus getReasonPhraseForCode:statusCode];
    }
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject:[NSString stringWithFormat:@"%i", errorCode]
                 forKey:KEY_ERROR_CODE];
    [userInfo setObject:reasonString
                 forKey:KEY_ERROR_MESSAGE];
    
    return [NSError errorWithDomain:@"com.apiomat.frontend" code:errorCode userInfo:userInfo];
}

+ (NSError*)createApiomatErrorWithStatus:(AOMStatusCode) status {
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject:[NSString stringWithFormat:@"%i", status]
                 forKey:KEY_ERROR_CODE];
    [userInfo setObject:[AOMStatus getReasonPhraseForCode:status ]
                 forKey:KEY_ERROR_MESSAGE];
    
    return [NSError errorWithDomain:@"com.apiomat.frontend" code:status  userInfo:userInfo];
}

+ (void)raiseApiomatExceptionWithStatus:(AOMStatusCode) status {
    NSMutableDictionary *error = [[NSMutableDictionary alloc] init];
    
    
    [error setObject:[NSString stringWithFormat:@"%i", status]
              forKey:KEY_ERROR_CODE];
    [error setObject:[AOMStatus getReasonPhraseForCode:status ]
              forKey:KEY_ERROR_MESSAGE];
    
    [[NSException exceptionWithName:ApiomatRequestException
                             reason:[error objectForKey:KEY_ERROR_CODE]
                           userInfo:error] raise];
}
@end
