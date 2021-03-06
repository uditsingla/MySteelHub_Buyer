#import <Foundation/Foundation.h>

@interface LabeledActivityIndicatorView : UIView {
  BOOL shown;
	UIViewController *controller;
}
@property (nonatomic, strong) UIViewController *controller;

-(LabeledActivityIndicatorView *) initWithController:(UIViewController *)ctrl andText:(NSString *)text;
-(void) show;
-(void) hide;

@end
