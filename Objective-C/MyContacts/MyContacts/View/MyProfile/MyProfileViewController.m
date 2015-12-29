//
//  MyProfileViewController.m
//  MyContacts
//
//  Created by Sijia Davis on 11/13/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import "MyProfileViewController.h"
#import "Logs.h"
#import "Contact.h"
#import <QuartzCore/QuartzCore.h>

@interface MyProfileViewController ()

@end

@implementation MyProfileViewController

- (void)viewDidLoad {
    
    DLog(@"-> Begin");
    [super viewDidLoad];
    
    // Create a instance of Contact object to hold information of myself.
    Contact *contact                            = [[Contact alloc] init];
    contact.firstName                           = @"Sijia";
    contact.lastName                            = @"Davis";
    contact.email                               = @"sdavis@grouphnetwork.com";
    contact.phoneNumber                         = @"7853177171";
    contact.profilePictureName                  = @"myProfilePic.tiff";
    
    // Assign label values.
    self.nameLabel.text                         = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    self.emailLabel.text                        = contact.email;
    self.phoneNumberLabel.text                  = contact.phoneNumber;
    self.profilePicture.image                   = [UIImage imageNamed:contact.profilePictureName];
    
    // Make profile picture round.
    self.profilePicture.layer.cornerRadius      = self.profilePicture.frame.size.height/2;
    self.profilePicture.clipsToBounds           = YES;
    
    DLog(@"-> End");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
