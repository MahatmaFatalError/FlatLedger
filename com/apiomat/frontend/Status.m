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

#import "Status.h"

@implementation AOMStatus

+ (NSString*) getReasonPhraseForCode: (AOMStatusCode) _code {
    NSString* phrase = @"Unknown error";
    switch (_code) {
        case AOMSCRIPT_ERROR: 
            phrase = @"Script error!"; 
            break;
        case AOMAPPLICATION_NOT_ACTIVE: 
            phrase = @"Application is deactivated!"; 
            break;
        case AOMBAD_IMAGE: 
            phrase = @"Image format seems to be corrupted!"; 
            break;
        case AOMBAD_ID: 
            phrase = @"ID format is wrong!"; 
            break;
        case AOMCONCURRENT_ACCESS: 
            phrase = @"Concurrent access forbidden!"; 
            break;
        case AOMAPPLICATION_SANDBOX: 
            phrase = @"Application is in sandbox mode!"; 
            break;
        case AOMMODEL_NOT_DEPLOYED: 
            phrase = @"Model is not deployed!"; 
            break;
        case AOMQUERY_ERROR: 
            phrase = @"Query could not be parsed!"; 
            break;
        case AOMWRONG_REF_TYPE: 
            phrase = @"Wrong reference type!"; 
            break;
        case AOMATTRIBUTE_NOT_SET: 
            phrase = @"Attribute not set!"; 
            break;
        case AOMOPERATION_NOT_POSSIBLE: 
            phrase = @"CRUD operation not possible on this model!"; 
            break;
        case AOMAPPLICATION_NAME_MISMATCH: 
            phrase = @"Application name does not match the one defined in the model!"; 
            break;
        case AOMWRONG_AUTH_HEADER: 
            phrase = @"Wrong authentication header format, must be 'username:password'"; 
            break;
        case AOMMODEL_STILL_USED: 
            phrase = @"Model is still used by other attributes, scripts or subclasses!'"; 
            break;
        case AOMCOLLECTION_NOT_ALLOWED: 
            phrase = @"Collection is not supported for this model type!"; 
            break;
        case AOMFB_NO_VALID_MEMBER: 
            phrase = @"Request send from no valid member"; 
            break;
        case AOMFB_NO_OAUTH_TOKEN: 
            phrase = @"Requesting member has no oAuth token, please authenticate! See http://doc.apiomat.com"; 
            break;
        case AOMFB_POST_ID_MISSING: 
            phrase = @"Facebook post id has to be set!"; 
            break;
        case AOMRESTORE_NO_DUMPS_FOUND: 
            phrase = @"No dumps for app on this date exist!"; 
            break;
        case AOMTW_NO_VALID_MEMBER: 
            phrase = @"Request send from no valid member"; 
            break;
        case AOMTW_NO_OAUTH_TOKEN: 
            phrase = @"Requesting member has no oAuth token, please authenticate! See http://doc.apiomat.com"; 
            break;
        case AOMIMEXPORT_WRONG_ENCODING: 
            phrase = @"Wrong Encoding"; 
            break;
        case AOMIMEXPORT_WRONG_CONTENT: 
            phrase = @"Wrong Filecontent"; 
            break;
        case AOMPUSH_PAYLOAD_EXCEEDED: 
            phrase = @"Payload size exceeded!"; 
            break;
        case AOMPUSH_ERROR: 
            phrase = @"Error in push request!"; 
            break;
        case AOMBAD_EMAIL: 
            phrase = @"eMail format is wrong!"; 
            break;
        case AOMBAD_PROMOTIONCODE_DISCOUNT: 
            phrase = @"Discount value is wrong!"; 
            break;
        case AOMBAD_PROMOTIONCODE_CODE: 
            phrase = @"Code is invalid"; 
            break;
        case AOMPLAN_PRICE: 
            phrase = @"Plan price must be >= 0!"; 
            break;
        case AOMPLAN_NO_SYSTEMS: 
            phrase = @"Plan must have at leat one system!"; 
            break;
        case AOMSCRIPT_TIME_ERROR: 
            phrase = @"Script was interrupted, execution took too long."; 
            break;
        case AOMINVALID_NAME: 
            phrase = @"Name must start with a letter, followed only by letters or numbers."; 
            break;
        case AOMATTRIBUTE_IN_SUPERCLASS: 
            phrase = @"Attribute is already defined in superclass."; 
            break;
        case AOMJSON_TYPE_ERROR: 
            phrase = @"The @type is not correctly defined in your JSON (must be: APPNAMEMain$CLASSNAME"; 
            break;
        case AOMTBLR_NO_VALID_MEMBER: 
            phrase = @"Request send from no valid member"; 
            break;
        case AOMTBLR_NO_OAUTH_TOKEN: 
            phrase = @"Requesting member has no oAuth token, please authenticate! See http://doc.apiomat.com"; 
            break;
        case AOMTBLR_POST_ID_MISSING: 
            phrase = @"Tumblr post id has to be set!"; 
            break;
        case AOMLOCATION_INVALID: 
            phrase = @"Location data is invalid (latitude or longitude missing)!"; 
            break;
        case AOMSCRIPT_EXCEPTION: 
            phrase = @"Exception was raised in script!"; 
            break;
        case AOMBAD_CUSTOMERNAME: 
            phrase = @"Customer name must contain only characters A-Z,a-z or 0-9!"; 
            break;
        case AOMAPPLICATION_NOT_FOUND: 
            phrase = @"Application was not found!"; 
            break;
        case AOMCUSTOMER_NOT_FOUND: 
            phrase = @"Customer was not found!"; 
            break;
        case AOMID_NOT_FOUND: 
            phrase = @"ID was not found!"; 
            break;
        case AOMMODEL_NOT_FOUND: 
            phrase = @"Model was not found!"; 
            break;
        case AOMMODULE_NOT_FOUND: 
            phrase = @"Module was not found!"; 
            break;
        case AOMMETAMODEL_NOT_FOUND: 
            phrase = @"Meta Model was not found!"; 
            break;
        case AOMPLAN_NOT_FOUND: 
            phrase = @"Plan was not found!"; 
            break;
        case AOMPROMOCODE_NOT_FOUND: 
            phrase = @"Promotion code not valid!"; 
            break;
        case AOMMODULE_USE_FORBIDDEN: 
            phrase = @"Required module is not attached to app"; 
            break;
        case AOMPUSH_ERROR_APIKEY: 
            phrase = @"No API Key defined for Push service!"; 
            break;
        case AOMPUSH_ERROR_CERTIFICATE: 
            phrase = @"No certificate defined for Push service!"; 
            break;
        case AOMSAME_NAME_USED_IN_SUPERCLASS: 
            phrase = @"Same name is already used in a superclass."; 
            break;
        case AOMPAYMENT_MAX_MODULE: 
            phrase = @"Maximum number of used modules exceeded for this plan."; 
            break;
        case AOMPAYMENT_SYSTEM: 
            phrase = @"Selected system use is not allowed for this plan."; 
            break;
        case AOMPAYMENT_DOWNGRADE: 
            phrase = @"Up/Downgrading plans is only allowed for super admins."; 
            break;
        case AOMSAVE_REFERENECE_BEFORE_REFERENCING: 
            phrase = @"Object you are trying to reference is not on the server. Please save it first."; 
            break;
        case AOMPAYMENT_DB_SIZE: 
            phrase = @"Used database size exceeds plan"; 
            break;
        case AOMENDPOINT_PATH_NOT_ALLOWED: 
            phrase = @"Endpoint not allowed for app; please add path to your app's config."; 
            break;
        case AOMPAYMENT_NO_CRON: 
            phrase = @"Cronjobs are not allowed for this plan."; 
            break;
        case AOMID_EXISTS: 
            phrase = @"ID exists!"; 
            break;
        case AOMNAME_RESERVED: 
            phrase = @"Name is reserved!"; 
            break;
        case AOMCIRCULAR_DEPENDENCY: 
            phrase = @"One of the parent classes must not be the same class!"; 
            break;
        case AOMUNAUTHORIZED: 
            phrase = @"Authorization failed!"; 
            break;
        case AOMWRONG_APIKEY: 
            phrase = @"API Key was not correct!"; 
            break;
        case AOMCRUD_ERROR: 
            phrase = @"Internal error during CRUD operation"; 
            break;
        case AOMIMEXPORT_ERROR: 
            phrase = @"Error during im/export!"; 
            break;
        case AOMCOMPILE_ERROR: 
            phrase = @"Data models could not be compiled!"; 
            break;
        case AOMREFERENCE_ERROR: 
            phrase = @"Error in model reference!"; 
            break;
        case AOMPUSH_PAYLOAD_ERROR: 
            phrase = @"Failed to create payload!"; 
            break;
        case AOMPUSH_SEND_ERROR: 
            phrase = @"Failed to send message(s)!"; 
            break;
        case AOMPUSH_INIT_FAILED: 
            phrase = @"Failed to initialize push service!"; 
            break;
        case AOMFACEBOOK_ERROR: 
            phrase = @"Error communicationg with facebook!"; 
            break;
        case AOMFACEBOOK_OAUTH_ERROR: 
            phrase = @"facebook throws oAuth error! Please show login dialog again"; 
            break;
        case AOMMEMBER_NOT_FOUND: 
            phrase = @"Can't find member with this id/username"; 
            break;
        case AOMWORDPRESS_FETCH_DATA_ERROR: 
            phrase = @"Can't fetch data for wordpress blog"; 
            break;
        case AOMTUMBLR_OAUTH_ERROR: 
            phrase = @"tumblr throws oAuth error! Please show login dialog again"; 
            break;
        case AOMTUMBLR_ERROR: 
            phrase = @"Error communicationg with tumblr!"; 
            break;
        case AOMEXECUTE_METHOD_ERROR_PRIMITIVE: 
            phrase = @"Only primitive types are allowed"; 
            break;
        case AOMEXECUTE_METHOD_ERROR: 
            phrase = @"Execute method fails"; 
            break;
        case AOMHREF_NOT_FOUND: 
            phrase = @"Model has no HREF; please save it first!"; 
            break;
        case AOMWRONG_URI_SYNTAX: 
            phrase = @"URI syntax is wrong"; 
            break;
        case AOMWRONG_CLIENT_PROTOCOL: 
            phrase = @"Client protocol is wrong"; 
            break;
        case AOMIO_EXCEPTION: 
            phrase = @"IOException was thrown"; 
            break;
        case AOMUNSUPPORTED_ENCODING: 
            phrase = @"Encoding is not supported"; 
            break;
        case AOMINSTANTIATE_EXCEPTION: 
            phrase = @"Error on class instantiation"; 
            break;
        case AOMIN_PERSISTING_PROCESS: 
            phrase = @"Object is in persisting process. Please try again later"; 
            break;
        case AOMVERIFY_SOCIALMEDIA: 
            phrase = @"Can't verify against social media provider"; 
            break;
        case AOMTOO_MANY_LOCALIDS: 
            phrase = @"Can't create more localIDs. Please try again later"; 
            break;
        case AOMMAX_CACHE_SIZE_REACHED: 
            phrase = @"The maximum cache size is reached."; 
            break;
        case AOMCANT_WRITE_IN_CACHE: 
            phrase = @"Can't persist data to cache."; 
            break;
        case AOMMALICIOUS_MEMBER: 
            phrase = @"Malicious use of member detected!"; 
            break;
        default:
            break;
    }
    return phrase;
}
+ (AOMStatusCode) getStatusForCode: (NSInteger) _code
{
    for(int i = AOMSCRIPT_ERROR; i < AOMMALICIOUS_MEMBER; ++i) {
        if (_code  == i) {
            return i;
        }
    }
    return FALSE;
}
@end
