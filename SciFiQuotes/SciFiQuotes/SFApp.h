//
//  SFApp.h
//  SciFiQuotes
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFQuote.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFApp : NSObject

@property NSMutableArray<SFQuote *> *quotes;

- (instancetype)initWithFile:(NSString*)filename;
- (void)printQuote;

@end

NS_ASSUME_NONNULL_END
