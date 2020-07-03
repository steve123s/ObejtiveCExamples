//
//  main.m
//  SciFiQuotes
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SFApp.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDesktopDirectory, NSUserDomainMask, YES);
        NSString *desktopPath = [paths objectAtIndex:0];

        SFApp *app = [[SFApp alloc] initWithFile:[desktopPath stringByAppendingPathComponent:@"quotes.txt"]];
        [app printQuote];
    }
    return 0;
}
