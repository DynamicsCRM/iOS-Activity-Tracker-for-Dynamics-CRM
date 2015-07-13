//
//  LocalStorage.m
//

#import "LocalStorage.h"

#define HOST_KEY        @"CRMHost"
#define RECENTS_KEY     @"RecentRecords"

@implementation LocalStorage

+ (LocalStorage *)localStorage
{
    static LocalStorage *localStorage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localStorage = [[LocalStorage alloc] init];
    });
    
    return localStorage;
}

- (NSString *)getHost
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *host = [defaults objectForKey:HOST_KEY];
    
    return host;
}

- (void)saveHost:(NSString *)host
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *currHost = [defaults objectForKey:HOST_KEY];
    
    if (![currHost isEqualToString:host])
    {
        [defaults removeObjectForKey:RECENTS_KEY];
    }
    
    [defaults setObject:host forKey:HOST_KEY];
    
    [defaults synchronize];
}

// Recent records need to use an Archiver and Unarchiver to properly store the objects
- (NSArray *)getRecents
{
    NSArray *results = nil;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *recentData = [defaults objectForKey:RECENTS_KEY];
    if (recentData != nil)
    {
        NSMutableOrderedSet *recents = [NSKeyedUnarchiver unarchiveObjectWithData:recentData];
        results = [recents array];
    }
    
    return results;
}

// Adds the contact to the standard user defaults through its contactId
// This was a simpler solution than storing all the contacts data and just having
// the recent contacts automatically loaded on load 
- (void)addToRecents:(Contact *)recent
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableOrderedSet *recents = nil;
    NSData *recentData = [defaults objectForKey:RECENTS_KEY];
    if (recentData != nil)
    {
        recents = [NSKeyedUnarchiver unarchiveObjectWithData:recentData];
    
        if ([recents containsObject:recent.ContactId])
        {
            [recents removeObject:recent.ContactId];
        }
    }
    
    if (recents == nil)
    {
        recents = [NSMutableOrderedSet orderedSet];
    }
    
    [recents insertObject:recent.ContactId atIndex:0];
    
    if ([recents count] > 10)
    {
        [recents removeObjectAtIndex:10];
    }
    
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:recents] forKey:RECENTS_KEY];
    
    [defaults synchronize];
}

@end
