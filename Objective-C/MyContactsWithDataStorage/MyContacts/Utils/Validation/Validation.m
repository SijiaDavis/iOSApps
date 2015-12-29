//
//  Validation.m
//  MyContacts
//
//  Created by Sijia Davis on 11/16/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import "Validation.h"

@implementation Validation

NSString *nameFilterString  = @"[A-Za-z]+";
NSString *emailFilterString = @"^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,4})$";

+ (NSPredicate *) nameTest
{
    NSPredicate *nameTest   = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameFilterString];
    return nameTest;
}

+ (NSPredicate *) emailTest
{
    NSPredicate *emailTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailFilterString];
    return emailTest;
}


@end
