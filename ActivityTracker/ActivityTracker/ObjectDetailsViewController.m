//
//  ObjectDetailsViewController.m
//


#import "ObjectDetailsViewController.h"
#import "NewActivityViewController.h"
#import "Contact+DisplayStrings.h"
#import "NSString+StringFormatting.h"
#import "ActivityPointer+DisplayStrings.h"
#import "ColorsAndFonts.h"

@interface ObjectDetailsViewController ()
{
    IBOutlet UIView *detailsView;
    IBOutlet UILabel *mainLabel;
    IBOutlet UILabel *secondaryLabel;
    IBOutlet UILabel *thirdLabel;
    IBOutlet UILabel *addressLabel;
    IBOutlet UILabel *phoneLabel;
    IBOutlet UILabel *emailLabel;
    
    IBOutlet UITableView *activitiesList;
    IBOutlet UIImageView *loadingIndicator;
}

@property (strong, nonatomic) NSMutableArray *recentActivities;
@end

@implementation ObjectDetailsViewController

@synthesize displayObject;

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
    // Do any additional setup after loading the view.
    
    self.title = @"Contact";
    
    detailsView.backgroundColor = VERY_LIGHT_GREY;
    mainLabel.textColor = LIGHT_BLUE;
    secondaryLabel.textColor = MEDIUM_GREY;
    thirdLabel.textColor = MEDIUM_GREY;
    addressLabel.textColor = DARK_GREY;
    phoneLabel.textColor = DARK_GREY;
    emailLabel.textColor = DARK_GREY;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    activitiesList.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshObject];
}

// Updates the UI based on the current contact and refreshes activity list
- (void)refreshObject
{
    mainLabel.text = [NSString dashesForEmpty:displayObject.detailLine1];
    secondaryLabel.text = [NSString dashesForEmpty:displayObject.detailLine2];
    thirdLabel.text = [NSString dashesForEmpty:displayObject.detailLine3];
    addressLabel.text = [NSString dashesForEmpty:displayObject.addressInfo];
    phoneLabel.text = [NSString dashesForEmpty:displayObject.mainPhone];
    emailLabel.text = [NSString dashesForEmpty:displayObject.mainEmail];
    
    [activitiesList setContentOffset:CGPointMake(0, 0)];
    
    [self refreshActivities];
}

- (void)refreshActivities
{
    [self animateSpinner];
    
    [self retrieveActivitiesForContact:self.displayObject];
}

- (IBAction)actionClick:(id)sender
{
    NewActivityViewController *activityView = [[NewActivityViewController alloc] initWithNibName:@"NewActivityView" bundle:nil];
    activityView.displayObject = self.displayObject;
    
    UIButton *activityButton = (UIButton*)sender;
    
    switch (activityButton.tag)
    {
        case 10:
            activityView.activityType = @"Check In";
            break;
        case 11:
            activityView.activityType = @"Note";
            break;
        case 12:
            activityView.activityType = @"Follow Up";
            break;
        case 13:
            activityView.activityType = @"Phone Call";
            break;
    }
    
    [self.navigationController pushViewController:activityView animated:YES];
}

- (IBAction)addressClick:(id)sender
{
    if ([displayObject.addressInfo length] == 0)
    {
        return;
    }
    
    NSString *addressString = [addressLabel.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *mapsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com?q=%@", addressString]];
    
    [[UIApplication sharedApplication] openURL:mapsURL];
}

- (IBAction)phoneClick:(id)sender
{
    if ([displayObject.mainPhone length] == 0)
    {
        return;
    }
    
    NSString *cleanedString = [[displayObject.mainPhone componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
    NSString *escapedPhoneNumber = [cleanedString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@", escapedPhoneNumber]];
    
    [[UIApplication sharedApplication] openURL:phoneURL];
}

- (IBAction)emailClick:(id)sender
{
    if ([displayObject.mainEmail length] == 0)
    {
        return;
    }
    
    NSURL *emailURL = [NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@", displayObject.mainEmail]];
    
    [[UIApplication sharedApplication] openURL:emailURL];
}

// The spinner methods show a custom progress indicator
- (void)animateSpinner
{
    loadingIndicator.hidden = NO;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI];
    rotationAnimation.duration = .5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    
    [loadingIndicator.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopSpinner
{
    loadingIndicator.hidden = YES;
    
    [loadingIndicator.layer removeAnimationForKey:@"rotationAnimation"];
}

#pragma mark CRM Requests

// Retrives completed activities for the given contact
// Sorts in descending order with the most recent completed first
- (void)retrieveActivitiesForContact:(Contact*)contact
{
    RetrieveMultipleRequest *retrieve = [[RetrieveMultipleRequest alloc] init];
    FetchExpression *fetch = [[FetchExpression alloc] init];

    fetch.query = [NSString stringWithFormat:@"<fetch version=\"1.0\" mapping=\"logical\">"
                   "<entity name=\"activitypointer\">"
                   "<attribute name=\"activitytypecode\" />"
                   "<attribute name=\"subject\" />"
                   "<order attribute=\"modifiedon\" descending=\"true\" />"
                   "<filter type=\"and\" >"
                   "<condition attribute=\"regardingobjectid\" operator=\"eq\" value=\"{%@}\" />"
                   "<condition attribute=\"statecode\" operator=\"eq\" value=\"1\" />"
                   "</filter>"
                   "</entity>"
                   "</fetch>" ,contact.ContactId.UUIDString];
    
    retrieve.query = fetch;
    
    [[CRMClient sharedClient] execute:retrieve withCompletionBlock:^(OrganizationResponse *response, NSError *error){
        
        RetrieveMultipleResponse *fetchResponse = (RetrieveMultipleResponse *)response;
        NSMutableArray *activities = [NSMutableArray new];
        
        for (Entity *entity in [fetchResponse entityCollection].entities)
        {
            ActivityPointer *activity = [entity toEntity:[ActivityPointer class]];
            [activities addObject:activity];
        }
        
        self.recentActivities = activities;
        dispatch_async(dispatch_get_main_queue(), ^{
            [activitiesList reloadData];
            [self stopSpinner];
        });
    }];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [self.recentActivities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ResultsCell";
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"MMM d, yyyy";
    
    UITableViewCell *retVal = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (retVal == nil)
    {
        retVal = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    ActivityPointer *currActivity = [self.recentActivities objectAtIndex:indexPath.row];
    
    retVal.textLabel.text = currActivity.Subject;
    retVal.textLabel.textColor = DARK_PURPLE;
    
    retVal.detailTextLabel.text = [dateFormat stringFromDate:currActivity.ModifiedOn];
    retVal.detailTextLabel.textColor = MEDIUM_GREY;
    
    retVal.imageView.image = [currActivity activityImage];
    
    return retVal;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"RECENTLY COMPLETED ACTIVITIES";
}

#pragma mark - UITableView Delegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 26.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, [tableView.delegate tableView:tableView heightForHeaderInSection:section])];
    header.backgroundColor = [UIColor whiteColor];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.text = [tableView.dataSource tableView:tableView titleForHeaderInSection:section];
    textLabel.textColor = DARK_GREY;
    textLabel.font = [textLabel.font fontWithSize:14.0];
    [textLabel sizeToFit];
    textLabel.frame = CGRectMake(20,
                                 (header.frame.size.height  - textLabel.frame.size.height) / 2.0,
                                 textLabel.frame.size.width,
                                 textLabel.frame.size.height);
    [header addSubview:textLabel];
    
    return header;
}

@end
