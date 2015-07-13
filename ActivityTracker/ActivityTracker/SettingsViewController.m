//
//  SettingsViewController.m
//

#import "SettingsViewController.h"
//#import <ADALiOS/ADKeychainTokenCacheStore.h>
#import <ADALiOS/ADAL.h>
#import "ColorsAndFonts.h"
#import "LocalStorage.h"

@interface SettingsViewController ()
{
    IBOutlet UILabel *label;
    IBOutlet UITextField *endpointField;
}

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Settings";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveClick:)];
    self.navigationItem.rightBarButtonItem.tintColor = LIGHT_BLUE;
    
    label.textColor = DARK_GREY;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *hostString = [[LocalStorage localStorage] getHost];
    
    if (hostString != nil)
    {
        endpointField.text = hostString;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Checks if the user has logged in before, if not it logs into the org at the given endpoint
// The user will be prompted to input credentials using the ADAL storyboard views
// The credentials are then stored into local stoarge
- (void)saveClick:(id)sender
{
    NSString *hostString = [[LocalStorage localStorage] getHost];
    
    if ([hostString isEqualToString:endpointField.text])
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [[CRMClient sharedClient] loginWithEndpoint:endpointField.text  completion:^(ADAuthenticationResult *result){
            dispatch_async(dispatch_get_main_queue(), ^{

                if (result.error == nil)
                {
                    [self.navigationController popViewControllerAnimated:YES];
                    [[LocalStorage localStorage] saveHost:endpointField.text];
                }
            });
        }];
    }
}

@end
