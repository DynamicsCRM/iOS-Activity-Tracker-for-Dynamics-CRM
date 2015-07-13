//
//  Contact+DisplayStrings.m
//  ActivityTracker
//

#import "Contact+DisplayStrings.h"
#import "NSString+StringFormatting.h"

@implementation Contact (DisplayStrings)

- (NSString *)resultLine1
{
    return self.FullName;
}

- (NSString *)resultLine2
{
    NSMutableString *retVal = [[NSMutableString alloc] init];
    
    if (self.Company != nil)
    {
        [retVal appendString:self.Company];
    }
    
    if (self.JobTitle != nil)
    {
        if ([retVal length] != 0)
        {
            [retVal appendString:@" - "];
        }
        
        [retVal appendString:self.JobTitle];
    }
    return retVal;
}

- (NSString *)detailLine1
{
    return self.FullName;
}

- (NSString *)detailLine2
{
    return self.JobTitle;
}

- (NSString *)detailLine3
{
    return self.Company;
}

- (NSString *)addressInfo
{
    if (self.Address1_Line1 == nil && self.Address1_City == nil && self.Address1_StateOrProvince == nil && self.Address1_PostalCode == nil)
    {
        return @"";
    }
    return [NSString stringWithFormat:@"%@\n%@ %@ %@", [NSString dashesForEmpty:self.Address1_Line1], [NSString dashesForEmpty:self.Address1_City], [NSString dashesForEmpty:self.Address1_StateOrProvince], [NSString dashesForEmpty:self.Address1_PostalCode]];
}

- (NSString *)mainPhone
{
    return self.Telephone1;
}

- (NSString *)mainEmail
{
    return self.EMailAddress1;
}


@end
