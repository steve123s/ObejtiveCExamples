//
//  NSString+Trimming.m
//  ObjectiveCTest
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import "NSString+Trimming.h"

// MARK: - Categories
@implementation NSString (Trimming)

- (NSString*)ds_stringByTrimming {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/*
 
 “As you’ve seen, categories can add new methods to any class, even ones you didn’t write. In fact, this is their most common purpose”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books. 
 
 */

@end
