//
//  FailedBankInfo+CoreDataProperties.h
//  FailedBankCD
//
//  Created by Sijia Davis on 11/16/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FailedBankInfo.h"
#import "FailedBankDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface FailedBankInfo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *state;
@property (nullable, nonatomic, retain) FailedBankDetails *details;

@end

NS_ASSUME_NONNULL_END
