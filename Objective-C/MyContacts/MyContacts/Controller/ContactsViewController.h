//
//  ContactsViewController.h
//  MyContacts
//
//  Created by Sijia Davis on 11/12/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewContactViewController.h"

@interface ContactsViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate, NewContactViewControllerDelegate>

@property (nonatomic, strong)            NSMutableArray       *contacts;
@property (nonatomic, strong)            NSMutableArray       *filteredContacts;

@property (nonatomic, strong) IBOutlet   UISearchBar          *contactSearchBar;

@property (nonatomic, strong)            UISearchController   *searchController;

@end
