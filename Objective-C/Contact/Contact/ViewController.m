//
//  ViewController.m
//  Contact
//
//  Created by Sijia Davis on 11/16/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import "ViewController.h"
#import "Logs.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    DLog(@"-> Begin");
    
    [super viewDidLoad];
    
    // Fetch the saved data before the view loads.
    NSUserDefaults  *defaults       = [NSUserDefaults standardUserDefaults];
    
    NSString        *firstName      = [defaults objectForKey:@"firstName"];
    NSString        *lastName       = [defaults objectForKey:@"lastName"];
    
    NSInteger       age             = [defaults integerForKey:@"age"];
    NSString        *ageString      = [NSString stringWithFormat:@"%li", (long)age];
    
    NSData          *imageData      = [defaults dataForKey:@"image"];
    UIImage         *contactImage   = [UIImage imageWithData:imageData];
    
    // Update the view with saved data.
    _textFirstName.text             = firstName;
    _textLastName.text              = lastName;
    _textAge.text                   = ageString;
    _imgImage.image                 = contactImage;
   
    if (age == 0)
    {
        _textAge.text = @"";
    }
    
    if (contactImage == nil)
    {
         _imgImage.image = [UIImage imageNamed:@"placeholder.png"];
    }
    
    DLog(@"-> End");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickChoosePhoto:(id)sender
{
    DLog(@"-> Begin");
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate                 = self;
    picker.allowsEditing            = YES;
    picker.sourceType               = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:TRUE completion:nil];
    
    DLog(@"-> End");
}

- (IBAction)clickSave:(id)sender
{
    DLog(@"-> Begin");

    // Hide the keyboard.
    [_textFirstName resignFirstResponder];
    [_textLastName  resignFirstResponder];
    [_textAge       resignFirstResponder];
    
    // Create strings and integer to store the txt information.
    NSString       *firstName        = [_textFirstName text];
    NSString       *lastName         = [_textLastName text];
    NSInteger      age               = [[_textAge text] integerValue];
    
    // Create instances of NSData
    UIImage        *contactImage     = _imgImage.image;
    NSData         *imageData        = UIImageJPEGRepresentation(contactImage, 100);
    
    // Store the data
    NSUserDefaults *defaults         = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:firstName  forKey:@"firstName"];
    [defaults setObject:lastName   forKey:@"lastName"];
    [defaults setInteger:age       forKey:@"age"];
    [defaults setObject:imageData  forKey:@"image"];
    
    [defaults synchronize];
    
    // Show confirmation message.
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                                            message:@"Contact information is saved!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    DLog(@"-> End");
}

#pragma mark - Image Picker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    DLog(@"-> Begin");

    _imgImage.image = image;
    [picker dismissModalViewControllerAnimated:YES];
    
    DLog(@"-> End");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    DLog(@"-> Begin");

    [picker dismissViewControllerAnimated:TRUE completion:nil];
    
    DLog(@"-> End");
}

@end
