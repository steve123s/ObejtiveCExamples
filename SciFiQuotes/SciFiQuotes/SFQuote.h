//
//  SFQuote.h
//  SciFiQuotes
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFQuote : NSObject

@property NSString *text;
@property NSString *person;

- (nullable instancetype)initWithLine:(NSString*)line;

@end

NS_ASSUME_NONNULL_END
