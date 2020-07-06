//
//  SCApp.h
//  Swifty-Commits
//
//  Created by Daniel Esteban Salinas on 05/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCApp : NSObject

- (void)fetchCommitsForRepo:(NSString*)repo;

@end

NS_ASSUME_NONNULL_END
