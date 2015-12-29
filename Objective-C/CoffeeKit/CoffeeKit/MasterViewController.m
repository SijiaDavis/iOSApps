//
//  MasterViewController.m
//  CoffeeKit
//
//  Created by Sijia Davis on 11/19/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import "VenueCell.h"
#import "Location.h"
#import "Stats.h"
#import "MasterViewController.h"

#import "Logs.h"

#define kCLIENTID @"AUJOCU0HG3HVGPYFOX2KB13RNY4MMWDFOARROSZ3W3DASC3W"
#define kCLIENTSECRET @"JXGNXTZVRUF4MF1TM51S21GOD0RWEMIL1DAO1CFN5PASGHHB"

@interface MasterViewController ()
@property (nonatomic, strong) NSArray *venues;
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureRestKit];
    [self loadVenues];
}

- (void)configureRestKit
{
    DLog(@"-> Begin");
    
    // Initialize AFNetworking HTTPClient
    NSURL        *baseURL = [NSURL URLWithString:@"https://api.foursquare.com"];
    AFHTTPClient *client  = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // Initialize RestKit
    RKObjectManager *objectManager   = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // Setup object mappings
    RKObjectMapping *venueMapping    = [RKObjectMapping mappingForClass:[Venue class]];
    [venueMapping    addAttributeMappingsFromArray:@[@"name"]];
    
    RKObjectMapping *locationMapping = [RKObjectMapping mappingForClass:[Location class]];
    [locationMapping addAttributeMappingsFromArray:@[@"distance"]];
    
    RKObjectMapping *statsMapping    = [RKObjectMapping mappingForClass:[Stats class]];
    [statsMapping addAttributeMappingsFromArray:@[@"checkinsCount"]];
    
    [venueMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"location"
                                                                                 toKeyPath:@"location"
                                                                                 withMapping:locationMapping]];
    
    
    [venueMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"stats"
                                                                                 toKeyPath:@"stats"
                                                                                 withMapping:statsMapping]];
    
    // Register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:venueMapping
                                                                            method:RKRequestMethodGET
                                                                            pathPattern:@"/v2/venues/search"
                                                                            keyPath:@"response.venues"
                                                                            statusCodes:[NSIndexSet indexSetWithIndex:200]
                                                                            ];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    DLog(@"-> End");
}

- (void)loadVenues
{
    DLog(@"-> Begin");
    
    NSString *latLon       = @"40.70, -74.01";
    NSString *clientID     = [NSString stringWithUTF8String:kCLIENTID.UTF8String];
    NSString *clientSecret = [NSString stringWithUTF8String:kCLIENTSECRET.UTF8String];
    
    NSDictionary *queryParams;
    queryParams = [NSDictionary dictionaryWithObjectsAndKeys:latLon, @"ll",clientID,@"client_id",clientSecret, @"client_secret", @"4bf58dd8d48988d1e0931735",@"categoryId",@"20151118",@"v",nil];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/v2/venues/search" parameters:queryParams success:^
     (RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
    {
         _venues = mappingResult.array;
        
         [self.tableView reloadData];
     }
    failure:^(RKObjectRequestOperation *operation, NSError *error)
    {
        NSLog(@"What do you mean by 'there is no coffee?':%@", error);
    }];
    
    DLog(@"-> End");
}

- (void)viewWillAppear:(BOOL)animated
{
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _venues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"-> Begin");
    
    VenueCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"VenueCell" forIndexPath:indexPath];
    Venue     *venue = _venues[indexPath.row];
    
    cell.nameLabel.text     = venue.name;
    cell.distanceLabel.text = [NSString stringWithFormat:@"%.0fm", venue.location.distance.floatValue];
    cell.checkinsLabel.text = [NSString stringWithFormat:@"%d checkins", venue.stats.checkinsCount.intValue];
    
    return cell;
    
    DLog(@"-> End");
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"timeStamp"] description];
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];

    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	     // Replace this implementation with code to handle the error appropriately.
	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}    

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

@end
