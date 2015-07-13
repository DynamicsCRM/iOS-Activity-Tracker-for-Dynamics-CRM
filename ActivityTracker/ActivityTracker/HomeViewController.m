//
//  HomeViewController.m
//


#import "HomeViewController.h"
#import "ObjectDetailsViewController.h"
#import "SettingsViewController.h"
#import "Contact+DisplayStrings.h"
#import <ADALiOS/ADAL.h>
#import "ColorsAndFonts.h"
#import "LocalStorage.h"

typedef NS_ENUM(NSInteger, HomeViewDisplayMode)
{
    HomeViewDisplayRecents,
    HomeViewDisplaySearch
};

@interface HomeViewController ()
{
    IBOutlet UISearchBar *theSearchBar;
    IBOutlet UITableView *resultsView;
    IBOutlet UIImageView *loadingIndicator;
    
    HomeViewDisplayMode currMode;
    
    NSMutableArray *recents;
    
}

@property (strong,nonatomic) NSMutableArray *searchResults;
@end

@implementation HomeViewController

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
    
    self.title = @"Activity Tracker";
    
    currMode = HomeViewDisplayRecents;
    
    resultsView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-settings"] landscapeImagePhone:[UIImage imageNamed:@"icon-settings"] style:UIBarButtonItemStylePlain target:self action:@selector(settingsClick:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([[LocalStorage localStorage] getHost] == nil)
    {
        [self settingsClick:nil];
    }
    
    [[CRMClient sharedClient] loginWithEndpoint:[[LocalStorage localStorage] getHost] completion:^(ADAuthenticationResult *result){
        
        if (result.error == nil)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self loadRecents];
            });
        }
        else
        {
            [[LocalStorage localStorage] saveHost:nil];
        }
    }];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [resultsView deselectRowAtIndexPath:[resultsView indexPathForSelectedRow] animated:NO];
}

- (void)loadRecents
{
    NSArray *guids = [NSMutableArray arrayWithArray:[[LocalStorage localStorage] getRecents]];
    
    if (guids.count == 0 && recents.count != 0)
    {
        [resultsView reloadData];
        [theSearchBar becomeFirstResponder];
        return;
    }
    
    [self animateSpinner];
    
    [self retrieveRecentContactsWithGuids:guids];
}

// A helper function that adds the given contact to the stored contacts
// then it is added to the currently loaded contacts
// If there are more than 10 recent contacts is removes the least recently viewed
- (void)addContatToRecent:(Contact*)contact
{
    [[LocalStorage localStorage] addToRecents:contact];
    
    if (![recents containsObject:contact])
    {
        [recents insertObject:contact atIndex:0];
        if ([recents count] > 10)
        {
            [recents removeObject:[recents lastObject]];
        }
    }
}

- (void)settingsClick:(id)sender
{
    SettingsViewController *settingsView = [[SettingsViewController alloc] initWithNibName:@"SettingsView" bundle:nil];
    
    [self.navigationController pushViewController:settingsView animated:YES];
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

#pragma mark - CRM Requests

// Performs a CRM RetrieveMultipleReuest that returns all records
// that include the search text.
- (void)retrieveAllContactsLike:(NSString*)searchText
{
    RetrieveMultipleRequest *retrieve = [[RetrieveMultipleRequest alloc] init];
    FetchExpression *fetch = [[FetchExpression alloc] init];
    
    fetch.query = [NSString stringWithFormat:@"<fetch version=\"1.0\" mapping=\"logical\">"
                   "<entity name=\"contact\">"
                   "<attribute name=\"fullname\" />"
                   "<attribute name=\"address1_line1\" />"
                   "<attribute name=\"address1_city\" />"
                   "<attribute name=\"address1_stateorprovince\" />"
                   "<attribute name=\"address1_postalcode\" />"
                   "<attribute name=\"emailaddress1\" />"
                   "<attribute name=\"jobtitle\" />"
                   "<attribute name=\"telephone1\" />"
                   "<attribute name=\"contactid\" />"
                   "<attribute name=\"company\" />"
                   "<order attribute=\"fullname\" />"
                   "<filter type=\"and\" >"
                   "<condition attribute=\"fullname\" operator=\"like\" value=\"%%%@%%\" />"
                   "</filter>"
                   "</entity>"
                   "</fetch>",searchText];
    
    retrieve.query = fetch;
    
    [[CRMClient sharedClient] execute:retrieve withCompletionBlock:^(OrganizationResponse *response, NSError *error){
        
        RetrieveMultipleResponse *fetchResponse = (RetrieveMultipleResponse *)response;
        NSMutableArray *contacts = [NSMutableArray new];
        
        for (Entity *entity in [fetchResponse entityCollection].entities)
        {
            Contact *contact = [entity toEntity:[Contact class]];
            [contacts addObject:contact];
        }
        
        self.searchResults = contacts;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [resultsView reloadData];
            [self stopSpinner];
        });
    }];
}


// Takes in an array of GUIDs and retrieves all the contacts with those GUIDs
// through a RetrieveMultipleRequest
- (void)retrieveRecentContactsWithGuids:(NSArray*)guids
{
    //Create FetchXML for all GUID array
    NSString *valueString = @"";
    for (NSUUID *guid in guids)
    {
        valueString = [valueString stringByAppendingString:[NSString stringWithFormat:@"<value> {%@} </value>",guid.UUIDString]];
    }
    
    RetrieveMultipleRequest *retrieve = [[RetrieveMultipleRequest alloc] init];
    FetchExpression *fetch = [[FetchExpression alloc] init];
    
    fetch.query = [NSString stringWithFormat:@"<fetch version=\"1.0\" mapping=\"logical\">"
                   "<entity name=\"contact\">"
                   "<attribute name=\"fullname\" />"
                   "<attribute name=\"address1_line1\" />"
                   "<attribute name=\"address1_city\" />"
                   "<attribute name=\"address1_stateorprovince\" />"
                   "<attribute name=\"address1_postalcode\" />"
                   "<attribute name=\"emailaddress1\" />"
                   "<attribute name=\"jobtitle\" />"
                   "<attribute name=\"telephone1\" />"
                   "<attribute name=\"contactid\" />"
                   "<attribute name=\"company\" />"
                   "<filter type=\"and\" >"
                   "<condition attribute=\"contactid\" operator=\"in\" >"
                   "%@"
                   "</condition>"
                   "</filter>"
                   "</entity>"
                   "</fetch>",valueString];
    
    retrieve.query = fetch;
    
    [[CRMClient sharedClient] execute:retrieve withCompletionBlock:^(OrganizationResponse *response, NSError *error){
        
        RetrieveMultipleResponse *fetchResponse = (RetrieveMultipleResponse *)response;
        NSMutableArray *contacts = [NSMutableArray new];
        
        for (Entity *entity in [fetchResponse entityCollection].entities)
        {
            Contact *contact = [entity toEntity:[Contact class]];
            [contacts addObject:contact];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            recents = contacts;
            [resultsView reloadData];
            [self stopSpinner];
        });
    }];
}

#pragma mark - UISearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if ([searchBar.text length] != 0)
    {
        currMode = HomeViewDisplaySearch;
        self.searchResults = nil;
        [resultsView reloadData];
        [searchBar resignFirstResponder];
        [self animateSpinner];
        
        [self retrieveAllContactsLike:searchBar.text];
        [searchBar setShowsCancelButton:YES animated:YES];
    }
    else
    {
        currMode = HomeViewDisplayRecents;
        [searchBar setShowsCancelButton:NO animated:YES];
        
        [resultsView reloadData];
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *) searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
    searchBar.text = @"";
    currMode = HomeViewDisplayRecents;

    [searchBar setShowsCancelButton:NO animated:YES];
    
    [resultsView reloadData];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (currMode == HomeViewDisplayRecents)
    {
        return [recents count];
    }
    else
    {
        return [self.searchResults count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ResultsCell";
    
    UITableViewCell *retVal = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (retVal == nil)
    {
        retVal = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        retVal.selectedBackgroundView = [[UIView alloc] init];
    }
    
    Contact *contact = nil;
    if (currMode == HomeViewDisplayRecents)
    {
        contact = [recents objectAtIndex:indexPath.row];
    }
    else
    {
        contact = [self.searchResults objectAtIndex:indexPath.row];
    }
    
    retVal.textLabel.text = contact.resultLine1;
    retVal.detailTextLabel.text = contact.resultLine2;
    retVal.imageView.image = [UIImage imageNamed:@"icon-contact"];
    retVal.selectedBackgroundView.backgroundColor = BLUE_HIGHLIGHT;
    
    retVal.textLabel.textColor = LIGHT_BLUE;
    retVal.detailTextLabel.textColor = MEDIUM_GREY;
    
    return retVal;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (currMode == HomeViewDisplayRecents)
    {
        return @"RECENT RECORDS";
    }
    else
    {
        return @"SEARCH RESULTS";
    }
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact *currObject = nil;
    if (currMode == HomeViewDisplayRecents)
    {
        currObject = [recents objectAtIndex:indexPath.row];
    }
    else
    {
        currObject = [self.searchResults objectAtIndex:indexPath.row];
    }
    
    ObjectDetailsViewController *details = [[ObjectDetailsViewController alloc] initWithNibName:@"ObjectDetailsView" bundle:nil];
    details.displayObject = currObject;
    
    [self addContatToRecent:currObject];

    [self.navigationController pushViewController:details animated:YES];
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
                                 (header.frame.size.height  - textLabel.frame.size.height),
                                 textLabel.frame.size.width,
                                 textLabel.frame.size.height);
    [header addSubview:textLabel];
    
    return header;
}

@end
