// iOS Activity Tracker Sample app for Dynamics CRM 1.0
//
// Copyright (c) Microsoft Corporation
//
// All rights reserved.
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software
// and associated documentation files (the ""Software""), to deal in the Software without
// restriction, including without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
// software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
// BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

//  CRMClient.m

#import "CRMClient.h"
#import "XMLParsingHelper.h"

//TODO: Update the clientID and redirectUri after you register a new app with AD
#define CLIENT_ID       @"1dc3cd16-85f4-449e-9145-98c996ea6a85"
#define REDIRECT_URI    @"http://crm.codesamples/"

extern NSString* const OAuth2_Authenticate_Header;

@interface CRMClient ()

@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSURL *endpointURL;

@end

@implementation CRMClient

@synthesize accessToken, endpointURL;

+ (CRMClient *)sharedClient
{
    static CRMClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[CRMClient alloc] init];
    });
    
    return sharedClient;
}

#pragma mark - Error Handlers
- (void)serializerErrorHandler:(NSError*)error
{
    NSLog(@"Searlizer error %@ : %@", error.debugDescription, error.localizedRecoverySuggestion);
    dispatch_sync(dispatch_get_main_queue(), ^{
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error serializing the object." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [errorAlert show];
    });
}

#pragma mark - SOAP endpoint

//  These methods setup up the request for communicating with the SOAP endpoint
//  The SOAP endpoint is at /Organization.svc/web

- (NSURLRequest *)soapRequestForBody:(NSString *)body soapAction:(NSString*)soapAction
{
    NSMutableURLRequest *retVal = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"Organization.svc/web" relativeToURL:self.endpointURL]];
    [retVal setHTTPMethod:@"POST"];
    [retVal setValue:[NSString stringWithFormat:@"Bearer %@", self.accessToken] forHTTPHeaderField:@"Authorization"];
    [retVal setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [retVal setValue:soapAction forHTTPHeaderField:@"SOAPAction"];
    [retVal setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    return retVal;
}

- (NSString*)requestBodyForFetchXML:(NSString*)fetchXML
{
    // Close array characters in fetch xml (searching)
    NSString *fetchParams = [[fetchXML xmlEncode] stringByReplacingOccurrencesOfString:@"[" withString:@"[[]"];
    
    NSString *postData = [NSString stringWithFormat:@""
                          "<s:Envelope xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'>"
                          "<s:Body>"
                          "<RetrieveMultiple xmlns='http://schemas.microsoft.com/xrm/2011/Contracts/Services' xmlns:i='http://www.w3.org/2001/XMLSchema-instance'>"
                          "<query i:type='a:FetchExpression' xmlns:a='http://schemas.microsoft.com/xrm/2011/Contracts'>"
                          "<a:Query>%@</a:Query>"
                          "</query>"
                          "</RetrieveMultiple>"
                          "</s:Body>"
                          "</s:Envelope>", fetchParams];
    
    return postData;
}
- (NSString*)requestBodyForExecuteXML:(NSString*)executeXML
{
    NSString *postData = [NSString stringWithFormat:@""
                          "<s:Envelope xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'>"
                          "<s:Body>"
                          "%@"
                          "</s:Body>"
                          "</s:Envelope>", executeXML];
    
    return postData;
}

#pragma mark - OData endpoint

//  These methods setup up the request for communicating with the OData endpoint
//  The OData endpoint is at /OrganizationData.svc

- (NSURLRequest *)oDataGetRequestForEndpoint:(NSString *)endpoint
{
    NSString *path = [NSString stringWithFormat:@"OrganizationData.svc/%@", endpoint];
    
    NSMutableURLRequest *retVal =[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path relativeToURL:self.endpointURL]];
    [retVal setHTTPMethod:@"GET"];
    [retVal setValue:[NSString stringWithFormat:@"Bearer %@", self.accessToken] forHTTPHeaderField:@"Authorization"];
    [retVal setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    return retVal;
}

- (NSURLRequest *)oDataPostRequestForEndpoint:(NSString *)endpoint withBody:(NSData *)body
{
    NSString *path = [NSString stringWithFormat:@"OrganizationData.svc/%@", endpoint];
    
    NSMutableURLRequest *retVal =[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path relativeToURL:self.endpointURL]];
    [retVal setHTTPMethod:@"POST"];
    [retVal setValue:[NSString stringWithFormat:@"Bearer %@", self.accessToken] forHTTPHeaderField:@"Authorization"];
    [retVal setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [retVal setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [retVal setHTTPBody:body];
    
    return retVal;
}

#pragma mark - Methods

- (void)setNewEndpoint:(NSString *)endpoint withCompletionBlock:(void (^) (BOOL success))completionBlock
{
    if (endpoint == nil)
    {
        return;
    }

    // The base endpoint URL we will be using
    self.endpointURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/XRMServices/2011/", endpoint]];
    
    // Create an auth challenge request
    NSString *path = @"Organization.svc/web?SdkClientVersion=6.1.0.533";
    
    NSMutableURLRequest *authorityRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path relativeToURL:self.endpointURL]];
    [authorityRequest setHTTPMethod:@"GET"];
    [authorityRequest setValue:@"Bearer" forHTTPHeaderField:@"Authorization"];
    [authorityRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept"];
    
    NSURLSessionDataTask *authorityTask = [[NSURLSession sharedSession] dataTaskWithRequest:authorityRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSString  *authenticateHeader = [httpResponse.allHeaderFields valueForKey:OAuth2_Authenticate_Header];
        // Pre Vega builds sometimes have extra information, this removes it
        NSRange commaRange = [authenticateHeader rangeOfString:@","];
        if (commaRange.location != NSNotFound)
        {
            authenticateHeader = [authenticateHeader substringToIndex:commaRange.location];
        }
        
        NSError *adError = nil;
        ADAuthenticationParameters *params = [ADAuthenticationParameters parametersFromResponseAuthenticateHeader:authenticateHeader error:&adError];
        
        if (adError)
        {
            NSLog(@"AD error %@ : %@", error.debugDescription, error.localizedRecoverySuggestion);
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The authentication parameters could not be determined.  Please check your server settings and try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [errorAlert show];
            });
            
            return;
        }
        
        NSString *authorityEndpoint = params.authority;
        
        // Don't validate the authority as ADFS authorities cannot be validated
        ADAuthenticationContext* context = [ADAuthenticationContext authenticationContextWithAuthority:authorityEndpoint validateAuthority:NO error:&adError];
        if (!context)
        {
            if (adError)
            {
                NSLog(@"AD error %@ : %@", error.debugDescription, error.localizedRecoverySuggestion);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The login authority could not be established." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [errorAlert show];
            });
            return;
        }
        
        // This performs the authentication and the library will jump in with the login page if needed
        [context acquireTokenWithResource:endpoint clientId:CLIENT_ID redirectUri:[NSURL URLWithString:REDIRECT_URI] userId:@""
                          completionBlock:^(ADAuthenticationResult *result)
         {
             if (result.status != AD_SUCCEEDED)
             {
                 completionBlock(NO);
                 return;
             }
             
             self.accessToken = result.tokenCacheStoreItem.accessToken;
             
             [[LocalStorage localStorage] saveHost:endpoint];
             
             completionBlock(YES);
         }];

    }];
    
    [authorityTask resume];
}

// Search
// SOAP Endpoint
// Perform a RetrieveMultiple to find records with the search string
- (void)searchFor:(NSString *)searchString withCompletionBlock:(void (^)(NSArray *results, NSError *error))completionBlock
{
    NSString *fetchXML = [CRMContact fetchSearchString:searchString];
    NSString *requestBody = [self requestBodyForFetchXML:fetchXML];
    
    NSURLRequest *fechRequest = [self soapRequestForBody:requestBody soapAction:@"http://schemas.microsoft.com/xrm/2011/Contracts/Services/IOrganizationService/RetrieveMultiple"];
    
    NSURLSessionDataTask *searchTask = [[NSURLSession sharedSession] dataTaskWithRequest:fechRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            XMLParsingHelper *parser = [XMLParsingHelper parsingHelperWithXML:responseString];
            NSArray *entites = [parser xPathSearchFor:@"//*[local-name()='Attributes']"];
            completionBlock(entites, error);
        }
        else
        {
            completionBlock(nil, error);
        }
    }];
    [searchTask resume];
}

// Get Contact Details
// OData Endpoint
// Use the OData ContactSet feature to easily pull the desired information about a contact
- (void)getContactDetails:(CRMContact *)contact withCompletionBlock:(void (^) (BOOL success))completionBlock
{
    NSString *path = [NSString stringWithFormat:@"ContactSet(guid'%@')", contact.crmID];
    NSString *selectString = [CRMContact selectString];
    
    NSString *fullPath = [NSString stringWithFormat:@"%@?$select=%@", path, selectString];
    
    NSURLRequest *fetchRequest = [self oDataGetRequestForEndpoint:fullPath];
    NSURLSessionDataTask *fetchTask = [[NSURLSession sharedSession] dataTaskWithRequest:fetchRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSError *searlizerError = nil;
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&searlizerError];
            if (searlizerError)
            {
                [self serializerErrorHandler:searlizerError];
                completionBlock(NO);
                return;
            }
            resultDict = [[resultDict allValues] firstObject];
            [contact updateFromDict:resultDict];
            completionBlock(YES);
        }
        else
        {
            completionBlock(NO);
        }
    }];
    [fetchTask resume];
    
}

// Get Recent Activities
// OData Endpoint
// Use the OData ContactSet/Contact_ActivityPointers feature to easily pull the recently completed activities
- (void)getRecentActivities:(CRMContact *)contact withCompletionBlock:(void (^) (BOOL success))completionBlock
{
    NSString *path = [NSString stringWithFormat:@"ContactSet(guid'%@')/Contact_ActivityPointers", contact.crmID];
    NSString *selectString = [CRMActivity selectString];
    
    NSString *fullPath = [NSString stringWithFormat:@"%@?$select=%@&$filter=ActualEnd%%20ne%%20null&$orderby=ActualEnd%%20desc&$top=5", path, selectString];
    
    NSURLRequest *taskRequest = [self oDataGetRequestForEndpoint:fullPath];
    
    NSURLSessionDataTask *fetchTask = [[NSURLSession sharedSession] dataTaskWithRequest:taskRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSError *searlizerError = nil;
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&searlizerError];
            if (searlizerError)
            {
                [self serializerErrorHandler:searlizerError];
                completionBlock(NO);
                return;
            }
            resultDict = [[resultDict allValues] firstObject];
            NSArray *results = [resultDict objectForKey:@"results"];
            [contact parseActivities:results];
            completionBlock(YES);
        }
        else
        {
            completionBlock(NO);
        }
    }];
    [fetchTask resume];
}

// Create
// OData Endpoint
// Using the ContactSet/Contact_Tasks feature allows us to easily create a new task
- (void)create:(CRMActivity *)object relatedTo:(CRMContact *)contact withCompletionBlock:(void (^) (BOOL success))completionBlock
{
    NSString *path = [NSString stringWithFormat:@"ContactSet(guid'%@')/Contact_Tasks", contact.crmID];
    NSError *searlizerError = nil;
    NSData *body = [NSJSONSerialization dataWithJSONObject:[object createDictionary] options:0 error:&searlizerError];
    if (searlizerError)
    {
        [self serializerErrorHandler:searlizerError];
        completionBlock(NO);
        return;
    }
    
    NSURLRequest *createRequest = [self oDataPostRequestForEndpoint:path withBody:body];
    
    NSURLSessionDataTask *createTask = [[NSURLSession sharedSession] dataTaskWithRequest:createRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSError *searlizerError = nil;
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&searlizerError];
            if (searlizerError)
            {
                [self serializerErrorHandler:searlizerError];
                completionBlock(NO);
                return;
            }
            resultDict = [[resultDict allValues] firstObject];
            [object updateFromDict:resultDict];
            [self complete:object withCompletionBlock:completionBlock];
        }
        else
        {
            completionBlock(NO);
        }
    }];
    [createTask resume];

}

// Complete
// SOAP Endpoint
// The OData endpoint does not currently support execute, so the mark as complete action is performed against the SOAP endpoint
- (void)complete:(CRMActivity *)activity withCompletionBlock:(void (^) (BOOL success))completionBlock
{
    NSString *completeXML = [activity markAsCompleteXML];
    NSString *executeBody = [self requestBodyForExecuteXML:completeXML];
    
    NSURLRequest *completeRequest = [self soapRequestForBody:executeBody soapAction:@"http://schemas.microsoft.com/xrm/2011/Contracts/Services/IOrganizationService/Execute"];
    
    NSURLSessionDataTask *completeTask = [[NSURLSession sharedSession] dataTaskWithRequest:completeRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            //NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            completionBlock(YES);
        }
        else
        {
            completionBlock(NO);
        }
    }];
    [completeTask resume];
}

@end
