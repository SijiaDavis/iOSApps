//
//  VenueCell.h
//  CoffeeKit
//
//  Created by Sijia Davis on 11/20/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *checkinsLabel;

@end
