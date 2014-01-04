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
#import <YAJLiOS/YAJL.h>
#import "AOMConstants.h"

/*!
 Enum which defines internal states for a model.
 
 You can't get a model if his state is  ObjectState_PERSISTING so the return is an ApiomatRequestException
 */
typedef enum objectState
{
    ObjectState_NEW,
    ObjectState_DELETING,
    ObjectState_DELETED,
    ObjectState_PERSISTING,
    ObjectState_PERSISTED
} ObjectState;

/*!
 This class defines the base class of all data models for frontend developers. All data is stored in a JSON data
 object except the HREF of this model, originally containing the type of this model.
 */
@interface AOMAbstractClientDataModel : NSObject<NSCoding>

/*!
 Returns the HREF of this data model
 
 @return HREF of this data model, NULL if it was created but not saved yet
 */
- (NSString *) getHref;
/*!
 Returns the date when this object was created on server side
 
 @return date when this object was created on server side, NULL if it was created but not saved yet
 */
- (NSDate *) getCreatedAt;
/*!
 Returns the date when this object was modified last on server side
 
 @return date when this object was modified last on server side, NULL if it was created but not saved yet
 */
- (NSDate *) getLastModifiedAt;

/**
 * Returns the name of the app where this data model belongs to
 *
 * @return name of the app where this data model belongs to
 */

- (NSString *) getAppName;
/*!
 Returns the simple data model name
 
 @return simple data model name
 */
+ (NSString *) getSimpleName;
/*!
 Returns the module name where this data model belongs to
 
 @return name of the module where this data model belongs to
 */
+ (NSString *) getModuleName;
+ (NSString *) getSystem;
/*!
 Returns the foreign id for this object.
 A foreign id is a NON apiomat id (like facebook/twitter id)
 
 @return NSString the foreign id
 */
- (NSString *) getForeignId;

/*!
 Set the foreign id for this object.
 A foreign id is a NON apiomat id (like facebook/twitter id)
 
 @param _foreignID the foreign id
 */
- (void) setForeignId: (NSString*) _foreignID;

/*!
 Returns a boolean value if the access to resources is restricted by the defined roles for this object
 
 @return boolean value if the access to resources is restricted
 */
- (BOOL) getRestrictResourceAccess;
/*!
 Sets if the access to resources is restricted by the defined roles for this object
 
 @param restrictResourceAccess boolean value if the access to resources is restricted
 */
- (void) setRestrictResourceAccess: (BOOL)_restrictedResourceAccess;
/*!
 Returns a set of all role names allowed to grant privileges on this object
 
 @return set of all roles allowed to grant privileges on this object
 */
- (NSMutableArray*) getAllowedRolesGrant;
/*!
 Sets the set of all role names allowed to write this object
 
 @param allowedRolesGrant role names allowed to write this object
 */
- (void) setAllowedRolesGrant:(NSMutableArray*) _allowedRolesGrant;
/*!
 Returns a set of all role names allowed to write this object
 
 @return set of all roles allowed to write this object
 */
- (NSMutableArray*) getAllowedRolesWrite;
/*!
 Sets the set of all role names allowed to write this object
 
 @param allowedRolesWrite role names allowed to write this object
 */
- (void) setAllowedRolesWrite:(NSMutableArray*) _allowedRolesWrite;
/*!
 Returns a set of all role names allowed to read this object
 
 @return set of all roles allowed for this object
 */
- (NSMutableArray*) getAllowedRolesRead;
/*!
 Sets the set of all role names allowed to read this object
 
 @param allowedRolesRead names allowed to read this object
 */
- (void) setAllowedRolesRead:(NSMutableArray*) _allowedRolesRead;
/*!
 Decodes this data model from a JSON string; used to communicate with the REST interface
 
 @param _jsonData JSON data for decoding
 */
- (void) fromJson : (NSString*) _jsonData;
/*!
 Decodes this data model from a NSMutableDictionar; used to communicate with the REST interface
 
 @param _jsonObject Object in JSON format which is decoded to model
 */
- (void) fromJSONWithObject:(NSMutableDictionary*) _jsonObject;
/*!
 Encodes this data model as a JSON string; used to communicate with the REST interface
 
 @return this data model as JSON string
 */
- (NSString *) toJson;
#pragma mark - CRUD operrations
/*!
 Saves this data model. It is - based on HREF - automatically determined, if this model exists on the server,
 leading to an update, or not, leading to an post command.
 
 @return TRUE if save operations was successful
 */
- (BOOL) save;
/*!
 Loads (updates) this data model with server values
 */
- (void) load;
/*!
 Loads (updates) this data model with server values. Since you have to pass the HREF for this method, only use it
 when loading a model which has no HREF in it (was not sent/loaded before). Else use {@link #load()}
 
 @param _href The HREF of this model
 */
- (void) loadWithHref: (NSString*) _href;
/*!
 Deletes this data model on server
 */
- (BOOL) delete;
#pragma mark - Async CRUD operations
/*!
 Saves bject in background and not on the UI thread
 
 @param _block block will be called when request finished. If error==Nil then request was successful
 */
- (void) saveAsyncWithBlock:(AOMEmptyBlock) _block;
/*!
 load object in background and not on the UI thread
 
 @param _block block will be called when request finished. If error==Nil then request was successful.
 */
- (void) loadAsyncWithBlock:(AOMEmptyBlock) _block;
/*!
 load object with given HREF.
 Method will be invoked on NON-UI Thread.
 
 @param _modelHref HREF of object which will be loaded
 @param _block block will be called when request finished. If error==Nil then request was successful.
 */
- (void) loadAsyncWithHref:_modelHref andBlock:(AOMEmptyBlock) _block;
/*!
 delete object on server in background.
 Method will be invoked on NON-UI Thread.
 
 @param _block block will be called when request finished. If error==Nil then request was successful.
 */
- (void) deleteAsyncWithBlock:(AOMEmptyBlock) _block;

# pragma mark - other stuff
- (id) init;

+ (NSMutableArray*)getWithQuery: (NSString*) _query;
/*!
 Get list of Conference models from server.
 Method will executed in background and call _block when request finishing.
 
 @param _query filter for model list
 @param _block block which will called when request is finishing
 */
+ (void)getAsyncWithQuery: (NSString*) _query withBlock:(AOMBlockWithResults) _block;
- (NSMutableDictionary* ) getRefModelHrefs;
- (NSMutableArray* ) getRefModelHrefsForName:(NSString*) _name;
- (void) addRefModelHrefWithName:(NSString*) _name andHref:(NSString*)_href;
- (void) removeFromRefModelHrefsWithName:(NSString*)_name andHref:(NSString*)_href;

- (void) initAttributes;

@property (strong, nonatomic) NSMutableDictionary *data;
@property (nonatomic) ObjectState objectState;
@end