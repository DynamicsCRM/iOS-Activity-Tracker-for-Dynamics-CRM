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

//  CRMActivity.m

#import "CRMActivity.h"

@implementation CRMActivity

@synthesize crmID, recentActivities;
@synthesize activityType, activitySubject, activityDate, activityNotes;

// Determine which image to show in recent list
- (UIImage *)activityImage
{
    if ([self.activityType isEqualToString:@"task"])
    {
        return [UIImage imageNamed:@"icon-activity-check"];
    }
    else if ([self.activityType isEqualToString:@"phonecall"])
    {
        return [UIImage imageNamed:@"icon-activity-phone"];
    }
    else if ([self.activityType isEqualToString:@"appointment"])
    {
        return [UIImage imageNamed:@"icon-activity-appt"];
    }
    
    return [UIImage imageNamed:@"icon-activity-generic"];
}

// This determines which fields are returned from the OData endpoint
+ (NSString *)selectString
{
    return @"ActivityId,Subject,ActualEnd,Description,ActivityTypeCode";
}

// Update the record with the results from the OData endpoint
- (void)updateFromDict:(NSDictionary*)dict
{
    if ([dict objectForKey:@"ActivityId"] != nil && ![[dict objectForKey:@"ActivityId"] isKindOfClass:[NSNull class]])
    {
        self.crmID = [dict valueForKey:@"ActivityId"];
    }
    if ([dict objectForKey:@"Subject"] != nil && ![[dict objectForKey:@"Subject"] isKindOfClass:[NSNull class]])
    {
        self.activitySubject = [dict valueForKey:@"Subject"];
    }
    if ([dict objectForKey:@"ActualEnd"] != nil && ![[dict objectForKey:@"ActualEnd"] isKindOfClass:[NSNull class]])
    {
        NSString *dateString = [dict valueForKey:@"ActualEnd"];
        NSCharacterSet *numberSet = [NSCharacterSet decimalDigitCharacterSet];
        NSString *seconds = [dateString stringByTrimmingCharactersInSet:[numberSet invertedSet]];
        self.activityDate = [NSDate dateWithTimeIntervalSince1970:[seconds doubleValue]/1000];
    }
    if ([dict objectForKey:@"Description"] != nil && ![[dict objectForKey:@"Description"] isKindOfClass:[NSNull class]])
    {
        self.activityNotes = [dict valueForKey:@"Description"];
    }
    if ([dict objectForKey:@"ActivityTypeCode"] != nil && ![[dict objectForKey:@"ActivityTypeCode"] isKindOfClass:[NSNull class]])
    {
        self.activityType = [dict valueForKey:@"ActivityTypeCode"];
    }
}

// Return a dictionary to send to the OData endpoint in order to create a new activity record
- (NSDictionary *)createDictionary
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    NSMutableDictionary *retVal = [NSMutableDictionary dictionary];
    
    [retVal setObject:self.activitySubject forKey:@"Subject"];
    [retVal setObject:[dateFormat stringFromDate:self.activityDate] forKey:@"ActualEnd"];
    [retVal setObject:self.activityNotes forKey:@"Description"];
    
    return retVal;
}

// This returns the Execute XML to mark the activity as complete
- (NSString*)markAsCompleteXML
{
    NSString *retVal = [NSString stringWithFormat:@""
                        "<Execute xmlns='http://schemas.microsoft.com/xrm/2011/Contracts/Services' xmlns:i='http://www.w3.org/2001/XMLSchema-instance'>"
                        "<request i:type='c:SetStateRequest' xmlns:a='http://schemas.microsoft.com/xrm/2011/Contracts' xmlns:c='http://schemas.microsoft.com/crm/2011/Contracts'>"
                        "<a:Parameters xmlns:b='http://schemas.datacontract.org/2004/07/System.Collections.Generic'>"
                        "<a:KeyValuePairOfstringanyType>"
                        "<b:key>EntityMoniker</b:key>"
                        "<b:value i:type='a:EntityReference'>"
                        "<a:Id>%@</a:Id>"
                        "<a:LogicalName>task</a:LogicalName>"
                        "<a:Name i:nil='true' />"
                        "</b:value>"
                        "</a:KeyValuePairOfstringanyType>"
                        "<a:KeyValuePairOfstringanyType>"
                        "<b:key>State</b:key>"
                        "<b:value i:type='a:OptionSetValue'>"
                        "<a:Value>1</a:Value>"
                        "</b:value>"
                        "</a:KeyValuePairOfstringanyType>"
                        "<a:KeyValuePairOfstringanyType>"
                        "<b:key>Status</b:key>"
                        "<b:value i:type='a:OptionSetValue'>"
                        "<a:Value>5</a:Value>"
                        "</b:value>"
                        "</a:KeyValuePairOfstringanyType>"
                        "</a:Parameters>"
                        "<a:RequestId i:nil='true' />"
                        "<a:RequestName>SetState</a:RequestName>"
                        "</request>"
                        "</Execute>", self.crmID
                        ];
    return retVal;
}

@end
