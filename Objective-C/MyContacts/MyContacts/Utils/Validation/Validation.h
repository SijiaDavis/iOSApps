//
//  Validation.h
//  MyContacts
//
//  Created by Sijia Davis on 11/16/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject

+ (NSPredicate *) nameTest;
+ (NSPredicate *) emailTest;

@end
