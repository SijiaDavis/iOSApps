//
//  Contact.h
//  MyContacts
//
//  Created by Sijia Davis on 11/12/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *profilePictureName;

@end
