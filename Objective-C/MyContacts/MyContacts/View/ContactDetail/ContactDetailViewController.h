//
//  ContactDetailViewController.h
//  MyContacts
//
//  Created by Sijia Davis on 11/13/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactDetailViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView  *profileImage;
@property (weak, nonatomic) IBOutlet UILabel      *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel      *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel      *emailLabel;

@property(nonatomic, retain)         NSString     *profileImageString;
@property(nonatomic, retain)         NSString     *nameLabelText;
@property(nonatomic, retain)         NSString     *phoneNumberLabelText;
@property(nonatomic, retain)         NSString     *emailLabelText;

@end
