# Android Activity Tracker Sample app for Microsoft Dynamics CRM #

The activity tracker sample application enables you to connect to your Microsoft Dynamics CRM 2013 organization, query for your contacts, and add a quick activity record related to a contact.  Use this sample’s source code as a starting point to build your own apps that can access the CRM web services. 

## Prerequisites ##
1.  This code sample targets an iPhone running iOS 7 or later.
2.  Your CRM deployment must be running CRM 2013 or later.
3.  Your CRM deployment must be set up for OAuth 2.0 authentication.

## Quick Start ##
1. Ensure your Active Directory setup meets the prerequisites listed on [MSDN](http://msdn.microsoft.com/en-us/library/dn531010.aspx).
2. Follow the steps in that article to register the app with Active Directory or Microsoft Azure. If you are using an On-premises CRM deployment, please ensure you run the PowerShell commands from the article.
3. Modify these two constants in the CRMClient.m file to use the same values that were used during app registration.

	`#define CLIENT_ID       @"1dc3cd16-85f4-449e-9145-98c996ea6a85"`
	`#define REDIRECT_URI    @"http://crm.codesamples/"`

4. Build and run the ActivityTracker application.
5. On the settings screen, enter your CRM organization URL and choose Save.  You will be prompted to log in.
6. Log in and start searching for your contacts!

## ADALiOS Library ##
This application leverages the ADALiOS (Azure Active Directory Authentication Library for iOS) to handle OAuth authentication.  This library is available on [GitHub](https://github.com/AzureAD/azure-activedirectory-library-for-objc).

There is an issue with the way the authorization header was being returned from the authorization (bearer) challenge.  The regular expression in the file ADAuthenticationParameters+Internal.m was modified to correct this issue, which is why the source code to ADALiOS is included in the app project.
	
	//The regular expression that matches the Bearer contents:
	NSString* const RegularExpression = @"^Bearer\\s+([^,\\s=\"]+?)=(\"?[^\"]*?\"?)\\s*(?:,\\s*([^,\\s=\"]+?)=\"([^\"]*?)\"\\s*)*$";
	NSString* const ExtractionExpression = @"\\s*([^,\\s=\"]+?)=(\"?[^\"]*?\"?)$";

**Note about support for CRM 2015 (Vega) pre-release with on-premises**

In the CRMClient.m file, there is some code to handle the authorization challenge that is returned, which is not the way the library is expecting it.

	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    NSString  *authenticateHeader = [httpResponse.allHeaderFields valueForKey:OAuth2_Authenticate_Header];
    // Pre Vega builds sometimes have extra information, this removes it
    NSRange commaRange = [authenticateHeader rangeOfString:@","];
    if (commaRange.location != NSNotFound)
    {
        authenticateHeader = [authenticateHeader substringToIndex:commaRange.location];
    }
        
    ADAuthenticationParameters *params = [ADAuthenticationParameters parametersFromResponseAuthenticateHeader:authenticateHeader error:nil];
        
    NSString *authorityEndpoint = params.authority;
        
    // Don't validate the authority as ADFS authorities cannot be validated
    ADAuthenticationContext* context = [ADAuthenticationContext authenticationContextWithAuthority:authorityEndpoint validateAuthority:NO error:nil];
    
This code snippet performs two main actions.  It looks for commas in the authenticate header and trims the string, and then it creates the authentication context without validation.
This ensures that the URL in the header is valid, and that ADFS authorities are supported.

## CRM Connector ##
The classes in this folder are responsible for communicating with CRM, parsing the results, and storing recent records.  The CRMClient class leverages both the OData and SOAP endpoints.

We've chosen to show examples of communicating with the SOAP and OData endpoints in this sample.  We've done this since the current version of the OData endpoint only supports CRUD (Create, Retrieve, Update, Delete) and Associate/Disassociate messages. Depending on the needs of your own application, you can choose to interact with one endpoint or the other.

You should register a new app ID with Microsoft Azure AD and replace these constants in CRMClient.m with the clientID and redirect URL you choose.  The instructions can be found on [MSDN](http://msdn.microsoft.com/en-us/library/dn531010.aspx).

	#define CLIENT_ID       @"1dc3cd16-85f4-449e-9145-98c996ea6a85"
	#define REDIRECT_URI    @"http://crm.codesamples/"
	
The CRMClient class uses generic error handlers.  You may want to expand on these and include more specific messages for your environment.

### OData Calls ###
- Get contact details
- Get recent activities related to a contact
- Create a new task related to a contact

The OData endpoint is used for these calls to show the ease in which you can get to the required data by using URLs such as *endpoint*/ContactSet('guid') and *endpoint*/ContactSet('guid')/Contact_Tasks.

### SOAP Calls ###
- Search for contacts
- Complete activity

The SOAP endpoint is used for these calls to show the basics of how to interact with the endpoint.  The complete activity call **MUST** be made to the SOAP endpoint as the OData endpoint does not currently support execute calls.

### Local Storage ###
This class handles storing the recently viewed records and the current CRM organization URL that is being used.  The class uses NSUserDefaults to store that information.  If you are creating an app that is going to store information for offline use, you should leverage other storage options such as Core Data.  This sample focuses on the interaction with CRM and is not intended to be a sample showing the other storage options.

### XML Parsing Helper ###
This class parses the XML returned from the SOAP endpoint.  It leverages the libxml library that is built into iOS.  The class returns results in a more useable NSDictionary format.  This custom XML parser is needed because the SOAP response from CRM is not formatted in a way that NSXMLParser can handle.

## Objects ##
The CRMObject class is the base class that defines the methods and properties that are common to all objects.

The CRMContact class handles all instances of contacts that will be shown in the application.  This class also starts to parse the contact's related activities list.

The CRMActivity class handles both the recently completed activities related to a contact and the new activity records that can be created in this app.

## Views ##

### Settings View ###
Unless you choose to hardcode an endpoint URL, you will want to display the settings page to the user on first launch.  The settings view allows the user to enter in their CRM URL and then kicks off the authentication process for them.

**Note**:
This code block in the save endpoint method is required to ensure the old token information is completely cleared when changing endpoints.

	id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
    [cache removeAllWithError:nil];
    [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore = [ADKeychainTokenCacheStore new];
        
    for(NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies])
    {
    	[[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
        
### Home View ###
This view allows you to access the records you have recently viewed or search for other records.

### Object Details View ###
This view shows more details about the selected contact including recently completed records.  The view also allows you to launch into a new completed task form.

### New Activity View ###
This view allows you to create a completed task related to the selected contact.  You can edit the subject, date, and add notes.  When submitting, the task is created in CRM, and then completed.

### UI Styling ###
There is a file called ColorsAndFonts that defines the colors that are used throughout this application.  You can tweak the colors in the application or add new colors and use them to skin the application to suit your needs.

## Class Categories ##
There are two class categories in this folder both on NSString.  The XMLEncode category is used to encode FetchXML to send in the retrieve multiple call.  The XMLEncode category is specific to the requirements of this sample.  You may want to leverage a 3rd party library to handle this in your app.  The StringFormatting category is used to ensure there is always something displayed in the UI where a string should be.

