//
//  Person.m
//  ObjectiveCTest
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import "Person.h"

@implementation Person

/**
 
 1) The - marks the start of a normal method. If we had used + instead it would be a static method, i.e. one that belongs to the class rather than instances.
 
 2) The return type is placed in parentheses before the method name. void means “nothing is returned.”
 
 3) Conventionally, a space is placed after the - but not before the method name. So, don’t place a space after the closing parenthesis of (void).
 
 */

- (void)printGreeting {
    NSLog(@"Hello!");
}

// Parameters
- (void)printGreeting:(NSString*)greeting {
    NSLog(@"%@", greeting);
}

/*
 “The coding convention in Objective-C is that the first parameter is part of the method name, which occasionally makes for some clumsy method names like dismissViewControllerAnimated.”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books. 
 */

/*
 “For example, if we wanted a new method that greeting a person by name, we would write something like this:
 */

- (void)printGreetingTo:(NSString*)name {
    NSLog(@"Hello, %@", name);
}

- (void)printGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time {
    if ([time isEqualToString:@"morning"]) {
        NSLog(@"Good morning, %@", name);
    } else {
        NSLog(@"Good evening, %@", name);
    }
}

// Returning multiple values
- (NSDictionary*)fetchGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time {
    if ([time isEqualToString:@"morning"]) {
        return @{
            @"English": [NSString stringWithFormat:@"Good morning, %@", name],
            @"French": [NSString stringWithFormat:@"Bonjour, %@", name]
        };
    } else {
        return @{
            @"English": [NSString stringWithFormat:@"Good evening, %@", name],
            @"French": [NSString stringWithFormat:@"Bonsoir, %@", name]
        };
    }
}

// MARK: - Properties
/*
 When you want to access a property on your class, there are three ways to do so, but for now let’s use the most important way: writing self. then your property name. Here’s how the printGreeting method should look in Person.m:
 */

- (void)printProperty {
    NSLog(@"Hello, %@!", self.name);
}

/*
 “The second way to access a property is using a method call, like this:
*/

- (void)printProperty2 {
    NSLog(@"Hello, %@!", [self name]);
}

/*
 This is where properties can get a bit confusing for newbies: when you write self.name to read a property, behind the scenes it’s just syntactic sugar for writing [self name]. When you use self.name to write a property, it’s just syntactic sugar for writing [self setName:@“...”]. We could have written this in main.m:

 [person setName:@"Taylor"];”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
 */

/*
 “When you use @property to declare a name property, Xcode does more than just create name and setName methods. It also creates an ivar called _name, and connects that to the two methods it generates. This is called synthesizing an ivar, and it’s the preferred approach – you create the property, and let Xcode do the rest.

 I already showed you two ways to access properties: dot syntax and accessor methods. But there’s a third way, which is to bypass the property entirely and access the synthesized ivar. This is done a lot in Objective-C, usually for no good reason. Using this approach, we could write the printGreeting method to be this:
*/

- (void)printName3 {
    NSLog(@"Hello, %@!", _name);
}

/*
 Apple’s own documentation makes it clear this is really not a smart idea, and yet you’ll see this code all over the place. There are legitimate reasons for needing to access an ivar directly, but sadly the most common reason is “it’s faster.” This is true, but by such a microscopically irrelevant amount that it might as well not be.”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
 */

@end
