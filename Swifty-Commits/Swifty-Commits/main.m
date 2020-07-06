//
//  main.m
//  Swifty-Commits
//
//  Created by Daniel Esteban Salinas on 05/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCApp.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *repo = @"facebook/react";

        if (argc == 2) {
            repo = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
        }

        SCApp *app = [SCApp new];
        [app fetchCommitsForRepo:repo];
        
    }
    return 0;
}
