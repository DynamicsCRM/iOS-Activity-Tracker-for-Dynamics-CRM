//
//  ActivityPointer+DisplayStrings.m
//  ActivityTracker
//

#import "ActivityPointer+DisplayStrings.h"

@implementation ActivityPointer (DisplayStrings)

// Determine which image to show in recent list
- (UIImage *)activityImage
{
    if ([self.ActivityTypeCode isEqualToString:@"task"])
    {
        return [UIImage imageNamed:@"icon-activity-check"];
    }
    else if ([self.ActivityTypeCode isEqualToString:@"phonecall"])
    {
        return [UIImage imageNamed:@"icon-activity-phone"];
    }
    else if ([self.ActivityTypeCode isEqualToString:@"appointment"])
    {
        return [UIImage imageNamed:@"icon-activity-appt"];
    }
    
    return [UIImage imageNamed:@"icon-activity-generic"];
}
@end
