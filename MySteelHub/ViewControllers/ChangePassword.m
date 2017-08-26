//
//  ChangePassword.m
//  MySteelHub
//
//  Created by Abhishek Singla on 09/08/16.
//  Copyright © 2016 MySteelHub. All rights reserved.
//

#import "ChangePassword.h"

@interface ChangePassword ()
{
    
    __weak IBOutlet UITextField *txtOldPassword;
    __weak IBOutlet UITextField *txtPassword;
    __weak IBOutlet UITextField *txtConfirmPassword;
    
    
}
@end

@implementation ChangePassword

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleLabel:@"Change Password"];
    [self setMenuButton];
    [self setBackButton];
    
    
    
    //Custom UI for TextFilds
    [self customtxtfield:txtOldPassword withrightIcon:nil borderLeft:true borderRight:true borderBottom:nil borderTop:true];
    
    [txtOldPassword setValue:[UIColor lightGrayColor]
                  forKeyPath:@"_placeholderLabel.textColor"];
    
    //Custom UI for TextFilds
    [self customtxtfield:txtPassword withrightIcon:nil borderLeft:true borderRight:true borderBottom:nil borderTop:true];
    
    [txtPassword setValue:[UIColor lightGrayColor]
                  forKeyPath:@"_placeholderLabel.textColor"];
    
    //Custom UI for TextFilds
    [self customtxtfield:txtConfirmPassword withrightIcon:nil borderLeft:true borderRight:true borderBottom:true borderTop:true];
    
    [txtConfirmPassword setValue:[UIColor lightGrayColor]
                      forKeyPath:@"_placeholderLabel.textColor"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clkSubmit:(id)sender {
    
    
    if ([self validateData]) {
        
        NSDictionary *dictData = [NSDictionary dictionaryWithObjectsAndKeys:txtOldPassword.text,@"old_password",txtPassword.text,@"new_password", nil];
        
        [model_manager.loginManager changePassword:dictData completion:^(NSDictionary *json, NSError *error) {
            if (json != nil) {
                
                NSLog(@"json Response change apasseword : %@",json);
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"Success"
                                              message:@"Password updated successfully"
                                              preferredStyle:UIAlertControllerStyleAlert];
                
                
                [self presentViewController:alert animated:YES completion:nil];
                
                
                UIAlertAction* ok = [UIAlertAction
                                     actionWithTitle:@"OK"
                                     style:UIAlertActionStyleCancel
                                     handler:^(UIAlertAction * action)
                                     {
                                         [self.navigationController popViewControllerAnimated:true];
                                         //Do some thing here
                                         //   [view dismissViewControllerAnimated:YES completion:nil];
                                         
                                     }];
                [alert addAction:ok];

                
            }
            else
            {
                
                NSLog(@"Error Response change apasseword : %@",error);
                
            }
            
        }];
        
    }
}

-(BOOL)validateData
{
    NSString *value = [txtOldPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if([value length] == 0)
    {
        
        NSLog(@"Please Enter old password");
        [self showError:@"Please enter old password"];
        return false;
        
    }
    
    
    value = [txtPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    
    
    if([value length] == 0)
    {
        
        NSLog(@"Please enter password");
        [self showError:@"Please enter password"];
        return false;
        
    }
    
    value = [txtConfirmPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    
    if([value length] == 0)
    {
        
        NSLog(@"Please enter confirm password");
        [self showError:@"Please enter confirm password"];
        return false;
        
    }
    
    
    if (![txtConfirmPassword.text isEqualToString:txtPassword.text]) {
        
        NSLog(@"Password does not match");
        [self showError:@"Password does not match"];
        return false;
    }
    
    return true;
    
}

-(void)showError:(NSString*)error
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"%@", error] preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    
    // Present action sheet.
    [self presentViewController:alert animated:YES completion:nil];
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
