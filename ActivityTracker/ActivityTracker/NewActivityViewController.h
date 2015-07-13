//
//  NewActivityViewController.h
//


#import <UIKit/UIKit.h>
#import "Model.h"

@interface NewActivityViewController : UIViewController

@property (nonatomic, strong) Contact *displayObject;
@property (nonatomic, strong) NSString *activityType;

@end
