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

//  NewActivityViewController.m

#import "NewActivityViewController.h"

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
    
    CRMActivity *newActivity = [[CRMActivity alloc] init];
    newActivity.activityType = @"task";
    newActivity.activityDate = activityDate;
    newActivity.activitySubject = subjectField.text;
    newActivity.activityNotes = notesView.text;
    
    [self.displayObject.recentActivities insertObject:newActivity atIndex:0];
    
    [self animateSpinner];
    
    [[CRMClient sharedClient] create:newActivity relatedTo:(CRMContact*)self.displayObject withCompletionBlock:^(BOOL success) {
        if (success)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
                [self stopSpinner];
            });
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
