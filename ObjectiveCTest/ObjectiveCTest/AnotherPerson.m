//
//  AnotherPerson.m
//  ObjectiveCTest
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import "AnotherPerson.h"

// MARK: - Hide properties with extension
@interface AnotherPerson ()
@property NSString *similarAsAPrivateName;
@end

/*
 Remember, only Person.h gets imported into main.m, so as far as the main() function is called there is no name property on the Person class.
 
 You can only create class extensions if you have the source code to the class. This means you can’t create class extensions for UIKit classes.”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
 */

@implementation AnotherPerson

/*
 
 “Writing your own getter and setter is also a helpful way to understand what’s going on with the synthesized ivars, and helps demonstrate one of the most common pitfalls with Objective-C’s properties.”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
 
 */

@synthesize name = _name;

- (void)printGreeting {
    NSLog(@"Hello, %@!", self.name);
}

// Get
- (NSString*)name {
    NSLog(@"Reading name!");
    return _name;
}

// Set
- (void)setName:(NSString *)newName {
    NSLog(@"Writing name!");
    _name = newName;
}

/*
 
 The first thing that code does is synthesize the property to the _name ivar. This is what Xcode does for us by default, but as soon as you override the accessor methods you need to synthesize the ivar yourself. The two accessor methods must be named exactly as shown, receiving and returning the same data type as the property uses, but you’ll find that Xcode’s code completion will help you write them if you’re not sure.

 Inside the methods, as promised, you’ll find an example of when it’s a good idea to access ivars directly: the name method returns the value of _name, and the setName method sets the value of _name directly. This is not only a good idea – it’s actually required. If we had written self.name inside the setName method, then it would call setName to set the name, which would call setName to set the name, and so on – the setter would call itself a few thousand times until your app eventually crashed.

 Now that you have custom accessor methods that print out messages when called, you can see exactly what Objective-C is up to behind the scenes. Running the code right now should print out “Writing name!”, “Reading name!”, and finally, “Hello, Taylor!
 
 “TL;DR: Unless you have specific reason, always use self. to access ivars through their properties.”

 Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
 
 */

// MARK: - Initializers
- (instancetype)initWithName:(NSString*)name {
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

@end
