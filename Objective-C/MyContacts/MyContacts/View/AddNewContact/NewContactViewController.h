//
//  NewContactViewController.h
//  MyContacts
//
//  Created by Sijia Davis on 11/12/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;

@class NewContactViewController;

@protocol NewContactViewControllerDelegate <NSObject>

-(void)newContactViewControllerDidCancel:(NewContactViewController *)controller;
-(void)newContactViewController:(NewContactViewController *)controller didAddContact:(Contact *)contact;

@end

@interface NewContactViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (nonatomic, weak) id <NewContactViewControllerDelegate> delegate;

- (IBAction)firstNameEditChanged:(id)sender;
- (IBAction)lastNameEditChanged:(id)sender;
- (IBAction)emailEditChanged:(id)sender;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
