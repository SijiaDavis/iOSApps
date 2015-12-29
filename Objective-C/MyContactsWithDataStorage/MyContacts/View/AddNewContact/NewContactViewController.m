//
//  NewContactViewController.m
//  MyContacts
//
//  Created by Sijia Davis on 11/12/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "NewContactViewController.h"
#import "Contact.h"
#import "Validation.h"

@interface NewContactViewController ()

@end

@implementation NewContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set place holder picture.
    _imgImage.image                   = [UIImage imageNamed:@"no-profile-image.tiff"];
    
    // Make profile picture round.
    _imgImage.layer.cornerRadius      = _imgImage.frame.size.height/2;
    _imgImage.clipsToBounds           = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSManagedObjectContext *)managedObjectContext {
    
    // Method to retrieve the managed object context from the AppDelegate.
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)clickChoosePicture:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate                 = self;
    picker.allowsEditing            = YES;
    picker.sourceType               = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:true completion:nil];
}

#pragma mark - Image Picker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    _imgImage.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:TRUE completion:nil];
}

- (IBAction)firstNameEditChanged:(id)sender
{
    self.firstNameTextField.layer.borderWidth   = 0;
    self.firstNameTextField.layer.shadowColor   = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
}

- (IBAction)lastNameEditChanged:(id)sender
{
    self.lastNameTextField.layer.borderWidth    = 0;
    self.lastNameTextField.layer.shadowColor    = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
}

- (IBAction)emailEditChanged:(id)sender
{
    self.emailTextField.layer.borderWidth       = 0;
    self.emailTextField.layer.shadowColor       = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
}

- (IBAction)cancel:(id)sender
{
    [self.delegate newContactViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
    // A BOOL to check if the user inputs are valid.
    BOOL _isContactInfoValid = YES;
   
    // Use Predicate to check if fields contains non-letter character.
    NSPredicate *_nameTest  = [Validation nameTest];
    // Use Predicate to check if email has correct form.
    NSPredicate *_emailTest = [Validation emailTest];
    
    // Error messages to display
    NSString *errorMessage           = [[NSString alloc] init];
    errorMessage                     = @" ";
    NSString *errorLastNameEmpty     = [[NSString alloc] init];
    NSString *errorFirstNameInvalid  = [[NSString alloc] init];
    NSString *errorLastNameInvalid   = [[NSString alloc] init];
    NSString *errorEmailInvalid      = [[NSString alloc] init];
    
    // Invalid case one: LastName text field is empty.
    if (![self.lastNameTextField hasText])
    {
        // Invalid!
        _isContactInfoValid = NO;
        
        // Turn the border of text field red.
        self.lastNameTextField.layer.borderWidth   = 1.0f;
        self.lastNameTextField.layer.borderColor   = [UIColor redColor].CGColor;
        self.lastNameTextField.alpha               = 0.0;
        self.lastNameTextField.backgroundColor     = [UIColor whiteColor];
        
        // Add some cool effects to the boarder.
        [UIView animateWithDuration:0.1 animations:^{
            
            UIBezierPath *shadowPath                    = [UIBezierPath bezierPathWithRect:self.lastNameTextField.bounds];
            self.lastNameTextField.layer.masksToBounds  = NO;
            self.lastNameTextField.layer.shadowColor    = [UIColor redColor].CGColor;
            self.lastNameTextField.layer.shadowOffset   = CGSizeMake(1.0f, 1.0f);
            self.lastNameTextField.layer.shadowOpacity  = 0.5f;
            self.lastNameTextField.layer.shadowPath     = shadowPath.CGPath;
            self.lastNameTextField.alpha                = 1.0;
            self.lastNameTextField.layer.cornerRadius   = 4.0;
        }];
        
        
        // Error message
        errorLastNameEmpty = @"Must enter a last name! ";
        errorMessage = [errorMessage stringByAppendingString:errorLastNameEmpty];
      
    }
    
    // Invalid case two: First name contains non-letter charater (given that First name is not empty).
    if(![_nameTest evaluateWithObject:self.firstNameTextField.text] && [self.firstNameTextField hasText])
    {
        // Invalid!
        _isContactInfoValid = NO;
        
        // Turn the border of text field red.
        self.firstNameTextField.layer.borderWidth     = 1.0f;
        self.firstNameTextField.layer.borderColor     = [UIColor redColor].CGColor;
        self.firstNameTextField.alpha                 = 0.0;
        self.firstNameTextField.backgroundColor       = [UIColor whiteColor];
        
        // Add some cool effects to the boarder.
        [UIView animateWithDuration:0.1 animations:^{
            
            UIBezierPath *shadowPath                      = [UIBezierPath bezierPathWithRect:self.firstNameTextField.bounds];
            self.firstNameTextField.layer.masksToBounds   = NO;
            self.firstNameTextField.layer.shadowColor     = [UIColor redColor].CGColor;
            self.firstNameTextField.layer.shadowOffset    = CGSizeMake(1.0f, 1.0f);
            self.firstNameTextField.layer.shadowOpacity   = 0.5f;
            self.firstNameTextField.layer.shadowPath      = shadowPath.CGPath;
            self.firstNameTextField.alpha                 = 1.0;
            self.firstNameTextField.layer.cornerRadius    = 4.0;
        }];

        // Error message
        errorFirstNameInvalid = @"First name can only contain letters! ";
        errorMessage = [errorMessage stringByAppendingString:errorFirstNameInvalid];
    }
    
    // Invalid case three: Last name contains non-letter character.
    if(![_nameTest evaluateWithObject:self.lastNameTextField.text] && [self.lastNameTextField hasText])
    {
        // Invalid!
        _isContactInfoValid = NO;
        
        // Turn the border of text field red.
        self.lastNameTextField.layer.borderWidth        = 1.0f;
        self.lastNameTextField.layer.borderColor        = [UIColor redColor].CGColor;
        self.lastNameTextField.alpha                    = 0.0;
        self.lastNameTextField.backgroundColor          = [UIColor whiteColor];
        
        // Add some cool effects to the boarder.
        [UIView animateWithDuration:0.1 animations:^{
            
            UIBezierPath *shadowPath                     = [UIBezierPath bezierPathWithRect:self.lastNameTextField.bounds];
            self.lastNameTextField.layer.masksToBounds   = NO;
            self.lastNameTextField.layer.shadowColor     = [UIColor redColor].CGColor;
            self.lastNameTextField.layer.shadowOffset    = CGSizeMake(1.0f, 1.0f);
            self.lastNameTextField.layer.shadowOpacity   = 0.5f;
            self.lastNameTextField.layer.shadowPath      = shadowPath.CGPath;
            self.lastNameTextField.alpha                 = 1.0;
            self.lastNameTextField.layer.cornerRadius    = 4.0;
        }];

        // Error message
        errorLastNameInvalid = @"Last name can only contain letters! ";
        errorMessage = [errorMessage stringByAppendingString:errorLastNameInvalid];
    }
    
    // Invalid case four: Email address has invalid format (given that Email address is not empty).
    if(![_emailTest evaluateWithObject:self.emailTextField.text] && [self.emailTextField hasText])
    {
        // Invalid!
        _isContactInfoValid = NO;
        
        // Turn the border of text field red.
        self.emailTextField.layer.borderWidth           = 1.0f;
        self.emailTextField.layer.borderColor           = [UIColor redColor].CGColor;
        self.emailTextField.alpha                       = 0.0;
        self.emailTextField.backgroundColor             = [UIColor whiteColor];
        
        // Add some cool effects to the boarder.
        [UIView animateWithDuration:0.1 animations:^{
            
            UIBezierPath *shadowPath                    = [UIBezierPath bezierPathWithRect:self.emailTextField.bounds];
            self.emailTextField.layer.masksToBounds     = NO;
            self.emailTextField.layer.shadowColor       = [UIColor redColor].CGColor;
            self.emailTextField.layer.shadowOffset      = CGSizeMake(1.0f, 1.0f);
            self.emailTextField.layer.shadowOpacity     = 0.5f;
            self.emailTextField.layer.shadowPath        = shadowPath.CGPath;
            self.emailTextField.alpha                   = 1.0;
            self.emailTextField.layer.cornerRadius      = 4.0;
        }];

        // Error message
        errorEmailInvalid = @"Invalid Email! ";
        errorMessage = [errorMessage stringByAppendingString:errorEmailInvalid];
    }
    
    // If any textfield is invalid, show pop-up.
    if (!_isContactInfoValid)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                              message:errorMessage
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    // If all information is valid, create new contact.
    else
    {
        // Create instance of NSData to store profile picture.
        UIImage                *contactProfilePicture  = _imgImage.image;
        NSData                 *imageData              = UIImageJPEGRepresentation(contactProfilePicture, 100);
        
        NSManagedObjectContext *context                = [self managedObjectContext];
        
        // Create a new managed object
        NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"ContactInfo" inManagedObjectContext:context];
        [newContact setValue:self.firstNameTextField.text   forKey:@"firstName"];
        [newContact setValue:self.lastNameTextField.text    forKey:@"lastName"];
        [newContact setValue:self.emailTextField.text       forKey:@"email"];
        [newContact setValue:self.phoneNumberTextField.text forKey:@"phoneNumber"];
        [newContact setValue:imageData                      forKey:@"profilePicture"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Opps, can't Save! %@ %@", error, [error localizedDescription]);
        }
        [self.delegate newContactViewController:self];
    }
}

#pragma mark - Table view data source

// Method for binging up the keyboard when the user tap anywhere in the row.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Firstname
    if (indexPath.row == 0)
    {
        [self.firstNameTextField becomeFirstResponder];
    }
    // Lastname
    else if (indexPath.row == 1)
    {
        [self.lastNameTextField becomeFirstResponder];
    }
    // Email
    else if (indexPath.row == 2)
    {
        [self.emailTextField becomeFirstResponder];
        
        // Set default keyboard to email keyboard.
        self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
        [self.emailTextField reloadInputViews];
    }
    // Phone number
    else if (indexPath.row == 3)
    {
        [self.phoneNumberTextField becomeFirstResponder];
        
        // Set default keyboard to number keyboard.
        self.phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
        [self.phoneNumberTextField reloadInputViews];
    }
}

@end
