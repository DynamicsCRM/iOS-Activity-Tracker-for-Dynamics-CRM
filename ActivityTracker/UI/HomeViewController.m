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

//  HomeViewController.m

#import "HomeViewController.h"
#import "ObjectDetailsViewController.h"
#import "SettingsViewController.h"

#import "CRMContact.h"
#import "CRMActivity.h"

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
    NSMutableArray *searchResults;
}
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
    recents = [NSMutableArray arrayWithArray:[[LocalStorage localStorage] getRecents]];
    
    [resultsView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([[LocalStorage localStorage] getHost] == nil)
    {
        [self settingsClick:nil];
    }
    
    [[CRMClient sharedClient] setNewEndpoint:[[LocalStorage localStorage] getHost] withCompletionBlock:^(BOOL success) {
        if (success)
        {
            //[theSearchBar becomeFirstResponder];
        }
    }];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [resultsView deselectRowAtIndexPath:[resultsView indexPathForSelectedRow] animated:NO];
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

#pragma mark - UISearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if ([searchBar.text length] != 0)
    {
        currMode = HomeViewDisplaySearch;
        searchResults = nil;
        [resultsView reloadData];
        [searchBar resignFirstResponder];
        [self animateSpinner];
        [[CRMClient sharedClient] searchFor:searchBar.text withCompletionBlock:^(NSArray *results, NSError *error) {
            if (error != nil)
            {
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error performing your search.  Please ensure you are connected to the internet." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [errorAlert show];
            }
            else
            {
                searchResults = [NSMutableArray arrayWithArray:[CRMContact parseResults:results]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [resultsView reloadData];
                    [searchBar setShowsCancelButton:YES animated:YES];
                    [self stopSpinner];
                });
            }
        }];
    }
    else
    {
        currMode = HomeViewDisplayRecents;
        recents = [NSMutableArray arrayWithArray:[[LocalStorage localStorage] getRecents]];
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
    recents = [NSMutableArray arrayWithArray:[[LocalStorage localStorage] getRecents]];
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
        return [searchResults count];
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
    
    CRMObject *currObject = nil;
    if (currMode == HomeViewDisplayRecents)
    {
        currObject = [recents objectAtIndex:indexPath.row];
    }
    else
    {
        currObject = [searchResults objectAtIndex:indexPath.row];
    }
    
    retVal.textLabel.text = currObject.resultLine1;
    retVal.detailTextLabel.text = currObject.resultLine2;
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
    CRMObject *currObject = nil;
    if (currMode == HomeViewDisplayRecents)
    {
        currObject = [recents objectAtIndex:indexPath.row];
    }
    else
    {
        currObject = [searchResults objectAtIndex:indexPath.row];
    }
    
    ObjectDetailsViewController *details = [[ObjectDetailsViewController alloc] initWithNibName:@"ObjectDetailsView" bundle:nil];
    details.displayObject = currObject;
    
    [[LocalStorage localStorage] addToRecents:currObject];
    
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
