//
//  ContactInfo+CoreDataProperties.h
//  MyContacts
//
//  Created by Sijia Davis on 11/17/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ContactInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactInfo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSNumber *isMySelf;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSData *profilePicture;

@end

NS_ASSUME_NONNULL_END
