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

//  LocalStorage.m

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

- (void)addToRecents:(CRMObject *)recent
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableOrderedSet *recents = nil;
    NSData *recentData = [defaults objectForKey:RECENTS_KEY];
    if (recentData != nil)
    {
        recents = [NSKeyedUnarchiver unarchiveObjectWithData:recentData];
        NSArray *filtered = [[recents filteredOrderedSetUsingPredicate:[NSPredicate predicateWithFormat:@"crmID == %@", recent.crmID]] array];
        [recents removeObjectsInArray:filtered];
    }
    
    if (recents == nil)
    {
        recents = [NSMutableOrderedSet orderedSet];
    }
    
    [recents insertObject:recent atIndex:0];
    
    if ([recents count] > 10)
    {
        [recents removeObjectAtIndex:10];
    }
    
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:recents] forKey:RECENTS_KEY];
    
    [defaults synchronize];
}

@end
