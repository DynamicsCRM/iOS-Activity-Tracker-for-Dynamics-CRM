//
//  AppDelegate.m
//  ActivityTracker
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ColorsAndFonts.h"
#import <CRMMobileSDK/CRMMobileSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)setupColorsAndFonts
{
    [[UINavigationBar appearance] setBarTintColor:DARK_BLUE];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    NSDictionary *titleTextAttributes =@{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"icon-back"];
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"icon-back"];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupColorsAndFonts];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    HomeViewController *homeView = [[HomeViewController alloc] initWithNibName:@"HomeView" bundle:nil];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:homeView];
    mainNav.navigationBar.translucent = NO;
    
    self.window.rootViewController = mainNav;
    
    [self.window makeKeyAndVisible];
    
    [CRMClient clientWithClientID:@"1dc3cd16-85f4-449e-9145-98c996ea6a85" redirectURI:@"http://crm.codesamples/"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
}

@end
