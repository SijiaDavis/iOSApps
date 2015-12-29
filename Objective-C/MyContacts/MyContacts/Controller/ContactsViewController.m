//
//  ContactsViewController.m
//  MyContacts
//
//  Created by Sijia Davis on 11/12/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contact.h"
#import "ContactCell.h"
#import "NewContactViewController.h"
#import "Logs.h"
#import "ContactDetailViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

@synthesize contacts;
@synthesize filteredContacts;
@synthesize contactSearchBar;
@synthesize searchController;

- (void)viewDidLoad
{
    DLog(@"-> Begin");
    
    [super viewDidLoad];
    
    // Create an array of contacts.
    contacts = [NSMutableArray arrayWithCapacity:50];
    
    // Create Contact objects to fill out the array.
    Contact *contact                = [[Contact alloc] init];
    
    contact.firstName               = @"Mike";
    contact.lastName                = @"Green";
    contact.email                   = @"mike@gmail.com";
    contact.phoneNumber             = @"7774448888";
    contact.profilePictureName      = @"images-2.jpeg";
    [contacts addObject:contact];
    
    contact                         = nil;
    contact                         = [[Contact alloc] init];
    contact.firstName               = @"Lindsay";
    contact.lastName                = @"Jill";
    contact.email                   = @"lindsay@gmail.com";
    contact.phoneNumber             = @"7873342345";
    contact.profilePictureName      = @"images-4.jpeg";
    [contacts addObject:contact];
    
    contact                         = nil;
    contact                         = [[Contact alloc] init];
    contact.firstName               = @"Judi";
    contact.lastName                = @"Thomas";
    contact.email                   = @"judi@gmail.com";
    contact.phoneNumber             = @"7342342234";
    contact.profilePictureName      = @"images-0.jpeg";
    [contacts addObject:contact];
    
    contact                         = nil;
    contact                         = [[Contact alloc] init];
    contact.firstName               = @"Tiffany";
    contact.lastName                = @"Jill";
    contact.email                   = @"tiff@gmail.com";
    contact.phoneNumber             = @"7342333234";
    contact.profilePictureName      = @"images-3.jpeg";
    [contacts addObject:contact];
    
    
    self.filteredContacts = [NSMutableArray arrayWithCapacity:[contacts count]];
    [self.tableView reloadData];
    
    DLog(@"-> End");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    DLog(@"-> Begin");
    
    return 1;
    
    DLog(@"-> End");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DLog(@"-> Begin");
    
    // Check to see whether the regular table or search results table should be displayed.
    if ([self.contactSearchBar.text length]>0)
    {
        // Use search results table's length.
        return [self.filteredContacts count];
    }
    else
    {
        // Use regular table's length.
        return [self.contacts count];
    }
    
    DLog(@"-> End");
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactCell *cell = (ContactCell *)[tableView dequeueReusableCellWithIdentifier:@"ContactCell"];
    
    // Create a new Contact Object.
    Contact *contact = nil;

    // Check to see whether the regular table or search results table should be displayed.
    if ([self.contactSearchBar.text length]>0)
    {
        // Set the Contact table to be the regular array.
        contact = (self.filteredContacts)[indexPath.row];
    }
    else
    {
        // Set the Contact table to be the search results array.
        contact = (self.contacts)[indexPath.row];
    }
    
    cell.nameLabel.text                   = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    cell.profileImage.image               = [UIImage imageNamed:contact.profilePictureName];
    
    // Make profile picture round.
    cell.profileImage.layer.cornerRadius  = cell.profileImage.frame.size.height/2;
    cell.profileImage.clipsToBounds       = YES;
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (void)newContactViewControllerDidCancel:(NewContactViewController *)controller
{
    DLog(@"-> Begin");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    DLog(@"-> End");
}



- (void)newContactViewController:(NewContactViewController *)controller didAddContact:(Contact *)contact
{
    DLog(@"-> Begin");
    
    [self.contacts addObject:contact];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.contacts count]-1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    DLog(@"-> End");
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    DLog(@"-> Begin");
    
    [self.filteredContacts removeAllObjects];
    
    // Filter the contact array.
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.firstName contains[c]%@||SELF.lastName contains[c]%@", searchText, searchText];
    
    // Fill the search result table.
    self.filteredContacts = [NSMutableArray arrayWithArray:[self.contacts filteredArrayUsingPredicate:predicate]];
    DLog(@"filteredContacs array is %@",self.filteredContacts);
    
    [self.tableView reloadData];
    
    DLog(@"-> End");
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText
{
    DLog(@"-> Begin");
    
    [self filterContentForSearchText:searchText scope:[[searchController.searchBar scopeButtonTitles] objectAtIndex:[searchController.searchBar selectedScopeButtonIndex]]];
    
    DLog(@"-> End");
}

/*
#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"-> Begin");
    
    // Perform segue to contact detail.
    [self performSegueWithIdentifier:@"contactDetail" sender:tableView];
    
    DLog(@"-> End");
}
 */

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DLog(@"-> Begin");
    
    // segue for adding new contact.
    if ([segue.identifier isEqualToString:@"AddContact"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        NewContactViewController *newContactViewController = [navigationController viewControllers][0];
        newContactViewController.delegate = self;
    }
    
    // segue for showing detail information of existing contact.
    else if ([segue.identifier isEqualToString:@"contactDetail"])
    {
        DLog(@"In the contact detail segue");
        
        ContactDetailViewController *contactDetailViewController = (ContactDetailViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // Check which data table is displayed on contact view.
        if ( [self.contactSearchBar.text length ] > 0 )
        {
            NSString *fName                                     = [[filteredContacts objectAtIndex:[indexPath row]] firstName];
            NSString *lName                                     = [[filteredContacts objectAtIndex:[indexPath row]] lastName];
            contactDetailViewController.nameLabelText           = [NSString stringWithFormat:@"%@ %@", fName, lName];
            contactDetailViewController.emailLabelText          = [[filteredContacts objectAtIndex:[indexPath row]] email];
            contactDetailViewController.phoneNumberLabelText    = [[filteredContacts objectAtIndex:[indexPath row]] phoneNumber];
            contactDetailViewController.profileImageString      = [[filteredContacts objectAtIndex:[indexPath row]] profilePictureName];
        }
        
        else
        {
            
            NSString *fName                                     = [[contacts objectAtIndex:[indexPath row]] firstName];
            NSString *lName                                     = [[contacts objectAtIndex:[indexPath row]] lastName];
            contactDetailViewController.nameLabelText           = [NSString stringWithFormat:@"%@ %@", fName, lName];
            contactDetailViewController.emailLabelText          = [[contacts objectAtIndex:[indexPath row]] email];
            contactDetailViewController.phoneNumberLabelText    = [[contacts objectAtIndex:[indexPath row]] phoneNumber];
            contactDetailViewController.profileImageString      = [[contacts objectAtIndex:[indexPath row]] profilePictureName];
            
        }
    }
    
    DLog(@"-> End");
}

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
