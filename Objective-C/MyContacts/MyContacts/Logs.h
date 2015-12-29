//
//  Logs.h
//
//
//  Created by Damien on 26/10/2015.
//  Copyright © 2015 Onatys. All rights reserved.
//

#ifndef Logs_h
#define Logs_h


#endif /* Logs_h */

#ifdef DEBUG
#define DLog(s, ...)	NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define DLog(...)

#endif