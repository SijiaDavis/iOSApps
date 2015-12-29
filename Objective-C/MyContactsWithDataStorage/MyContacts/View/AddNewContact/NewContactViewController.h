//
//  NewContactViewController.h
//  MyContacts
//
//  Created by Sijia Davis on 11/12/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Contact;

@class NewContactViewController;

@protocol NewContactViewControllerDelegate <NSObject>

-(void)newContactViewControllerDidCancel:(NewContactViewController *)controller;
-(void)newContactViewController:(NewContactViewController *)controller;

@end

@interface NewContactViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imgImage;

@property (nonatomic, weak) id <NewContactViewControllerDelegate> delegate;

- (IBAction)firstNameEditChanged:(id)sender;
- (IBAction)lastNameEditChanged:(id)sender;
- (IBAction)emailEditChanged:(id)sender;

- (IBAction)clickChoosePicture:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
