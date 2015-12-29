//
//  MyProfileViewController.h
//  MyContacts
//
//  Created by Sijia Davis on 11/13/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel       *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel       *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel       *emailLabel;
@property (weak, nonatomic) IBOutlet UIImageView   *profilePicture;

@end
