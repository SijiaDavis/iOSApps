//
//  ViewController.h
//  FailedBankCD
//
//  Created by Sijia Davis on 11/16/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong)           NSManagedObjectContext        *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel          *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator  *persistentStoreCoordinator;

@property (nonatomic, retain)           NSFetchedResultsController    *fetchedResultsController;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

