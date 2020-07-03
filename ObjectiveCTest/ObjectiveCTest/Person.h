//
//  Person.h
//  ObjectiveCTest
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property NSString *name; // A property or instance property

- (void)printGreeting;

/*
 
 “Remember: main.m imports only the header file, so as far as it’s concerned the Person class supports only the properties and methods listed there. Regardless of whether the method is listed in Person.h or not, having it in Person.m means it’s available to other methods inside Person.m – this is why it was effectively private until we added it to Person.h.”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
 
 */

/*
 
 “There’s another catch, but this time it’s more serious: Objective-C doesn’t really have any understanding of private methods. Sure, we can avoid declaring a method in the header file, but anyone can still call it if they know how. For example, this code works after removing printGreeting from Person.h:

 Person *person = [Person new];
 [person performSelector:@selector(printGreeting)];”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books. 
 
 */

// Parameters
- (void)printGreeting:(NSString*)greeting;

/*
 “As you can see, the function declaration is just a matter of taking the first line of the function implementation, then replacing the opening brace with a semi-colon.”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books. 
 */

- (void)printGreetingTo:(NSString*)name;

- (void)printGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time;

- (NSDictionary*)fetchGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time;

- (void)printName;

- (void)printProperty2;

- (void)printName3;

@end

NS_ASSUME_NONNULL_END
