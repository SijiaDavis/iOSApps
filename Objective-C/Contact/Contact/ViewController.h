//
//  ViewController.h
//  Contact
//
//  Created by Sijia Davis on 11/16/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFirstName;
@property (weak, nonatomic) IBOutlet UITextField *textLastName;
@property (weak, nonatomic) IBOutlet UITextField *textAge;
@property (weak, nonatomic) IBOutlet UIImageView *imgImage;

- (IBAction)clickSave:(id)sender;
- (IBAction)clickChoosePhoto:(id)sender;

@end

