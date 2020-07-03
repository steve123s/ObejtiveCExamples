//
//  SFApp.m
//  SciFiQuotes
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import "SFApp.h"

@implementation SFApp

- (instancetype)initWithFile:(NSString*)filename {
    if (self = [super init]) {
        // load the quotes filename we were given
        NSError *error;
        NSString *contents = [NSString stringWithContentsOfFile:filename usedEncoding:nil error:&error];

        if (error != nil) {
            // something went wrong – bail out!
            NSLog(@"Fatal error: %@", [error localizedDescription]);
            exit(0);
        }

        // still here? We're good to go!
        NSArray *lines = [contents componentsSeparatedByString:@"\n"];

        // create an empty array to hold the SFQuotes.
        self.quotes = [NSMutableArray arrayWithCapacity:[lines count]];

        // loop over all the lines, creating quote objects
        for (NSString *line in lines) {
            SFQuote *quote = [[SFQuote alloc] initWithLine:line];

            if (quote != nil) {
                // we got a valid quote back; add it
                [self.quotes addObject:quote];
            }
        }
    }

    return self;
}

- (void)printQuote {
    NSInteger random = arc4random_uniform((u_int32_t)[self.quotes count]);
    SFQuote *selected = self.quotes[random];

    printf("%s\n", [selected.text cStringUsingEncoding:NSUTF8StringEncoding]);
    printf("\t – %s\n", [selected.person cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
