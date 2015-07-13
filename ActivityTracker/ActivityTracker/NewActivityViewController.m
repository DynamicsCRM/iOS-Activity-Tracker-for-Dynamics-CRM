//
//  NewActivityViewController.m
//


#import "NewActivityViewController.h"
#import "Contact+DisplayStrings.h"
#import "ActivityPointer+DisplayStrings.h"
#import "ColorsAndFonts.h"

@interface NewActivityViewController ()
{
    IBOutlet UIImageView *loadingIndicator;
    IBOutlet UIView *detailsView;
    IBOutlet UILabel *mainLabel;
    IBOutlet UILabel *secondaryLabel;
    IBOutlet UILabel *thirdLabel;
    
    IBOutlet UIScrollView *scroller;
    IBOutlet UIView *scrollerBackground;
    
    IBOutlet UITextField *subjectField;
    IBOutlet UITextField *dateField;
    IBOutlet UITextView *notesView;
    
    IBOutletCollection(UILabel) NSArray *fieldLabels;
    
    NSDate *activityDate;
    NSDateFormatter *dateFormat;
}
@end

@implementation NewActivityViewController

@synthesize displayObject, activityType;

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
    
    for (UILabel * label in fieldLabels)
    {
        label.textColor = DARK_GREY;
    }
    
    detailsView.backgroundColor = VERY_LIGHT_GREY;
    scrollerBackground.backgroundColor = LINE_COLOR;
    
    mainLabel.text = displayObject.detailLine1;
    mainLabel.textColor = LIGHT_BLUE;
    
    secondaryLabel.text = displayObject.detailLine2;
    secondaryLabel.textColor = MEDIUM_GREY;
    
    thirdLabel.text = displayObject.detailLine3;
    thirdLabel.textColor = MEDIUM_GREY;
    
    activityDate = [NSDate date];
    dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"M/d/yyyy";
    
    dateField.text = [dateFormat stringFromDate:activityDate];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    datePicker.date = activityDate;
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    dateField.inputView = datePicker;
    
    self.title = self.activityType;
    
    subjectField.text = [NSString stringWithFormat:@"%@ with %@ on %@", self.activityType, self.displayObject.resultLine1, [dateFormat stringFromDate:activityDate]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:self action:@selector(submitClick:)];
    self.navigationItem.rightBarButtonItem.tintColor = LIGHT_BLUE;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The spinner methods show a custom progress indicator
- (void)animateSpinner
{
    loadingIndicator.superview.hidden = NO;
    
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
    loadingIndicator.superview.hidden = YES;
    
    [loadingIndicator.layer removeAnimationForKey:@"rotationAnimation"];
}

- (void)dateChange:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)sender;
    if ([subjectField.text isEqualToString:[NSString stringWithFormat:@"%@ with %@ on %@", self.activityType, self.displayObject.resultLine1, [dateFormat stringFromDate:activityDate]]])
    {
        activityDate = picker.date;
        dateField.text = [dateFormat stringFromDate:activityDate];
        subjectField.text = [NSString stringWithFormat:@"%@ with %@ on %@", self.activityType, self.displayObject.resultLine1, [dateFormat stringFromDate:activityDate]];
    }
    else
    {
        activityDate = picker.date;
        dateField.text = [dateFormat stringFromDate:activityDate];
    }
}

// A new task is created based on the information provided
// Subject is the only required field and will prompt the user if it is blank
- (void)submitClick:(id)sender
{
    if ([subjectField.text length] == 0)
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Subject Required" message:@"A subject is required." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [error show];
        return;
    }
    self.navigationItem.rightBarButtonItem.enabled = NO;
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [self.view endEditing:YES];
    
    
    Task *newTask = [[Task alloc] init];
    newTask.ActivityTypeCode = @"task";
    newTask.ModifiedOn = activityDate;
    newTask.Subject = subjectField.text;
    newTask.Description = notesView.text;
    newTask.RegardingObjectId = [self.displayObject toEntityReference];
    
    [self animateSpinner];
    [self createNewActivity:newTask];
}

#pragma mark - CRM Requests

// Creates a new activty from the activity passed in- specifically looking for a task
// View returns to the contact details page after success
- (void)createNewActivity:(Entity*)activity
{
    //Limits to the type being created to Tasks
    if (![activity isKindOfClass:[Task class]])
    {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The activity type you are attempting to create is not supported." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [errorAlert show];
        self.navigationItem.rightBarButtonItem.enabled = YES;
        [self.navigationItem setHidesBackButton:NO animated:YES];
        [self stopSpinner];
    }
    
    [[CRMClient sharedClient] create:activity completionBlock:^(NSUUID *id, NSError *error){
        if (error == nil)
        {
            [self completeActivity:id];
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error creating this record.  Please ensure you are connected to the internet." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [errorAlert show];
                self.navigationItem.rightBarButtonItem.enabled = YES;
                [self.navigationItem setHidesBackButton:NO animated:YES];
                [self stopSpinner];
            });
        }
    }];
}

// A helper function that is used to complete an activaty after is has been created
// All activities created from the app are automatically marked as completed
- (void)completeActivity:(NSUUID *)entity
{
    SetStateRequest *request = [[SetStateRequest alloc] init];
    
    request.entityMoniker = [[EntityReference alloc] initWithLogicalName:@"task" id:entity];
    request.state = [[OptionSetValue alloc] initWithValue:1];
    request.status = [[OptionSetValue alloc] initWithValue:5];
    
    [[CRMClient sharedClient] execute:request withCompletionBlock:^(OrganizationResponse *response, NSError *error){
        if (error == nil)
        {
           dispatch_async(dispatch_get_main_queue(), ^{
               [self.navigationController popViewControllerAnimated:YES];
               [self stopSpinner];
           });
        }
        else
        {
            NSLog(@"Error marking activity as complete %@", error.localizedDescription);
        }
    }];
}

#pragma mark - Keyboard Notifications
- (void)keyboardShow:(NSNotification*)notification
{
    CGRect keyboardFrame = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGSize contentSize = CGSizeMake(scroller.frame.size.width, scroller.frame.size.height + keyboardFrame.size.height);
    [scroller setContentSize:contentSize];
    scroller.scrollEnabled = YES;
    
}

- (void)keyboardWillHide:(NSNotification*)notification
{
    scroller.scrollEnabled = NO;
    [scroller setContentOffset:CGPointMake(0, 0) animated:YES];
}

#pragma mark - UITextView Delegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    CGPoint scrollPoint = textView.superview.frame.origin;
    
    [scroller setContentOffset:scrollPoint animated:YES];
}

@end
