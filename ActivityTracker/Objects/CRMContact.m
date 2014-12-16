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

//  CRMContact.m

#import "CRMContact.h"

@implementation CRMContact

@synthesize crmID, recentActivities;
@synthesize fullName, jobTitle, email, phoneNumber, accountName;

@synthesize addressLine1, addressCity, addressState, addressZip;

// Encode and decode methods to deal with storing in defaults
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:crmID forKey:@"crmID"];
    [aCoder encodeObject:fullName forKey:@"fullName"];
    [aCoder encodeObject:jobTitle forKey:@"jobTitle"];
    [aCoder encodeObject:email forKey:@"email"];
    [aCoder encodeObject:phoneNumber forKey:@"phoneNumber"];
    [aCoder encodeObject:addressLine1 forKey:@"addressLine1"];
    [aCoder encodeObject:addressCity forKey:@"addressCity"];
    [aCoder encodeObject:addressState forKey:@"addressState"];
    [aCoder encodeObject:addressZip forKey:@"addressZip"];
    [aCoder encodeObject:accountName forKey:@"accountName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.crmID = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"crmID"];
        self.fullName = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"fullName"];
        self.jobTitle = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"jobTitle"];
        self.email = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"email"];
        self.phoneNumber = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"phoneNumber"];
        self.addressLine1 = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"addressLine1"];
        self.addressCity = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"addressCity"];
        self.addressState = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"addressState"];
        self.addressZip = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"addressZip"];
        self.accountName = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"accountName"];
    }
    
    return self;
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

- (NSString *)resultLine1
{
    return self.fullName;
}

- (NSString *)resultLine2
{
    NSMutableString *retVal = [[NSMutableString alloc] init];
    
    if (self.accountName != nil)
    {
        [retVal appendString:self.accountName];
    }
    
    if (self.jobTitle != nil)
    {
        if ([retVal length] != 0)
        {
            [retVal appendString:@" - "];
        }
        
        [retVal appendString:self.jobTitle];
    }
    return retVal;
}

- (NSString *)detailLine1
{
    return self.fullName;
}

- (NSString *)detailLine2
{
    return self.jobTitle;
}

- (NSString *)detailLine3
{
    return self.accountName;
}

- (NSString *)addressInfo
{
    if (self.addressLine1 == nil && self.addressCity == nil && self.addressState == nil && self.addressZip == nil)
    {
        return @"";
    }
    return [NSString stringWithFormat:@"%@\n%@ %@ %@", [NSString dashesForEmpty:self.addressLine1], [NSString dashesForEmpty:self.addressCity], [NSString dashesForEmpty:self.addressState], [NSString dashesForEmpty:self.addressZip]];
}

- (NSString *)mainPhone
{
    return self.phoneNumber;
}

- (NSString *)mainEmail
{
    return self.email;
}

// This determines which fields are returned from the OData endpoint
+ (NSString *)selectString
{
    return @"ContactId,FullName,Address1_Line1,Address1_City,Address1_StateOrProvince,Address1_PostalCode,EMailAddress1,JobTitle,Telephone1";
}

// This returns the FetchXML to search for the inputted term
+ (NSString *)fetchSearchString:(NSString *)searchTerm
{
    NSString *escapedSearchTerm = [searchTerm xmlEncode];
    return [NSString stringWithFormat:@""
            "<fetch mapping='logical' count='25'>"
            "<entity name='contact'>"
            "<attribute name='contactid'/>"
            "<attribute name='fullname'/>"
            "<attribute name='jobtitle'/>"
            "<link-entity name='account' from='accountid' to='parentcustomerid' link-type='outer'>"
            "<attribute name='name' alias='accountname' />"
            "</link-entity>"
            "<filter type='and'>"
            "<condition attribute='fullname' operator='like' value='%%%@%%' />"
            "<condition attribute='statecode' operator='eq' value='0'/>"
            "</filter>"
            "</entity>"
            "</fetch>",
            escapedSearchTerm
            ];
}

// This returns the FetchXML to get recent tasks related to the record
- (NSString *)fetchRecentTasks
{
    return [NSString stringWithFormat:@""
            "<fetch mapping='logical' count='5'>"
            "<entity name='task'>"
            "<attribute name='activityid'/>"
            "<attribute name='subject'/>"
            "<attribute name='scheduledstart'/>"
            "<attribute name='description'/>"
            "<order attribute='scheduledstart' descending='true' />"
            "<filter type='and'>"
            "<condition attribute='regardingobjectid' operator='eq' value='%@' />"
            "</filter>"
            "</entity>"
            "</fetch>",
            self.crmID
            ];
}

- (void)parseActivities:(NSArray*)activites
{
    self.recentActivities = [NSMutableArray array];
    for (NSDictionary *objectDict in activites)
    {
        CRMActivity *result = [[CRMActivity alloc] init];
        [result updateFromDict:objectDict];
        [self.recentActivities addObject:result];
    }
}

+ (NSArray*)parseResults:(NSArray*)results
{
    NSMutableArray *retVal = [NSMutableArray arrayWithCapacity:[results count]];
    
    for (int i = 0; i < [results count]; i++)
    {
        NSDictionary *objectDict = [results objectAtIndex:i];
        CRMContact *result = [[CRMContact alloc] init];
        NSArray *attributes = [objectDict objectForKey:@"Attributes"];
        for (NSDictionary *attributeDict in attributes)
        {
            [result updateFromSOAPDict:attributeDict];
        }
        [retVal addObject:result];
    }
    
    return retVal;
}

// Update the record with the results from the SOAP endpoint
- (void)updateFromSOAPDict:(NSDictionary*)dict
{
    NSString *pairName = [dict objectForKey:@"nodeName"];
    NSString *key = nil;
    NSObject *value = nil;
    
    NSArray *keyValuePair = [dict objectForKey:pairName];
    for (NSDictionary *info in keyValuePair)
    {
        if (key == nil)
        {
            key = [info objectForKey:@"key"];
        }
        
        if (value == nil)
        {
            value = [info objectForKey:@"value"];
        }
    }
    
    if ([key isEqualToString:@"contactid"])
    {
        self.crmID = (NSString*)value;
    }
    else if ([key isEqualToString:@"fullname"])
    {
        self.fullName = (NSString*)value;
    }
    else if ([key isEqualToString:@"jobtitle"])
    {
        self.jobTitle = (NSString*)value;
    }
    else if ([key isEqualToString:@"accountname"])
    {
        NSArray *linkedEntityDicts = (NSArray *)value;
        for (NSDictionary *entityDict in linkedEntityDicts)
        {
            NSString *value = [entityDict objectForKey:@"Value"];
            if (value != nil)
            {
                self.accountName = value;
            }
        }
    }
}

// Update the record with the results from the OData endpoint
- (void)updateFromDict:(NSDictionary*)dict
{
    if ([dict objectForKey:@"ContactId"] != nil && ![[dict objectForKey:@"ContactId"] isKindOfClass:[NSNull class]])
    {
        self.crmID = [dict valueForKey:@"ContactId"];
    }
    if ([dict objectForKey:@"FullName"] != nil && ![[dict objectForKey:@"FullName"] isKindOfClass:[NSNull class]])
    {
        self.fullName = [dict valueForKey:@"FullName"];
    }
    if ([dict objectForKey:@"JobTitle"] != nil && ![[dict objectForKey:@"JobTitle"] isKindOfClass:[NSNull class]])
    {
        self.jobTitle = [dict valueForKey:@"JobTitle"];
    }
    if ([dict objectForKey:@"EMailAddress1"] != nil && ![[dict objectForKey:@"EMailAddress1"] isKindOfClass:[NSNull class]])
    {
        self.email = [dict valueForKey:@"EMailAddress1"];
    }
    if ([dict objectForKey:@"Telephone1"] != nil && ![[dict objectForKey:@"Telephone1"] isKindOfClass:[NSNull class]])
    {
        self.phoneNumber = [dict valueForKey:@"Telephone1"];
    }
    if ([dict objectForKey:@"Address1_Line1"] != nil && ![[dict objectForKey:@"Address1_Line1"] isKindOfClass:[NSNull class]])
    {
        self.addressLine1 = [dict valueForKey:@"Address1_Line1"];
    }
    if ([dict objectForKey:@"Address1_City"] != nil && ![[dict objectForKey:@"Address1_City"] isKindOfClass:[NSNull class]])
    {
        self.addressCity = [dict valueForKey:@"Address1_City"];
    }
    if ([dict objectForKey:@"Address1_StateOrProvince"] != nil && ![[dict objectForKey:@"Address1_StateOrProvince"] isKindOfClass:[NSNull class]])
    {
        self.addressState = [dict valueForKey:@"Address1_StateOrProvince"];
    }
    if ([dict objectForKey:@"Address1_PostalCode"] != nil && ![[dict objectForKey:@"Address1_PostalCode"] isKindOfClass:[NSNull class]])
    {
        self.addressZip = [dict valueForKey:@"Address1_PostalCode"];
    }
}
@end
