//
//  AnotherPerson.h
//  ObjectiveCTest
//
//  Created by Daniel Esteban Salinas on 03/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnotherPerson : NSObject

@property NSString *name;

- (NSString*)name;
- (void)setName:(NSString *)newName;

- (void)printGreeting;

// MARK: - Propery Attributes

/*
 
 There are 11 property attributes in total, but they can be combined in a range ways so there are lots of possible combinations. Here are all 11 properties, sorted roughly by how likely I think it is you’ll come across them:

 strong: This is the default for objects, and means “hold onto the memory.” This is the default for properties in Swift.
 
 weak: This creates a weak reference for objects, just like weak properties in Swift. This is useful for breaking strong reference cycles.
 
 copy: This takes a copy of whatever object is assigned to the property.
 
 assign: This is the default for primitive types, and just assigns the value to the ivar.
 
 nonatomic: An atomic property is one that will include extra code to ensure reading a value at the same time as it’s being written on another thread won’t produce garbage data. A non-atomic property is the opposite: that extra code isn’t added, so you need to make sure you don’t read and write the property simultaneously.
 
 retain: An old form of strong. If you see this, it’s a sure signal you’re working with old code.
 
 readonly: Do not generate a setter for this property.
 
 readwrite: Generate a getter and setter for this property. This is the default for properties of all types.
 
 atomic: See nonatomic above. Creating an atomic property has a small performance impact, but it keeps your code safe. This is the default for properties of all types.
 
 getter=: This lets you change the name of synthesized getter method.
 
 setter=: This lets you change the name of synthesized setter method.
 
 Some of those come in groups, where you can specify only one item from each group. For example, you may only choose one from strong, weak, copy, assign, and retain; one from readonly and readwrite; and one from atomic and nonatomic. Trying to specify two from each group doesn’t make sense because they conflict.
 
 */

/*
 In our code right now, the name property is defined like this:
 
 @property NSString *name;
 
 With no attributes attached, the defaults are used. If we wanted to be explicit, we could write the following instead:
 */

@property (strong, atomic, readwrite) NSString *name2;

/*
 In this case, atomic and readwrite are the default settings and we’re only changing strong, so we can make it even simpler:
 */

@property (copy) NSString *name3;

// MARK: - Atomic vs. Nonatomic

/*
 Some people look at “atomic” and confuse it with “thread-safe” which is not true. An atomic property ensures that if two different threads try to set a value at the same time, a third thread trying to read a value will get something sensible back. The write is atomic: it either doesn’t happen or it fully happens, it doesn’t “half happen.”

 Thread safety is something else entirely, and means that some code can be executed safely: if you move house from San Francisco to Paris you’ll change your street address, city, and country. If I try to read your address while you’re part-way through changing your address, I might get your street address as the Champs-Élysées (updated), but your city and country as San Francisco and United States (not updated).

 When you create IBOutlets, you’ll find that Xcode declares them as nonatomic properties because they ought never to be accessed from anywhere other than the main thread. I have always created my IBOutlet connections in my header files, but I don’t think there’s anything stopping you from creating them in the implementation file once you understand class extensions – more on that soon.
 */

// MARK: - Modifying properties in place

/*
 If you want to move a button down 10 pixels, you might write something like this in Swift:

 button.frame.origin.x += 10
 Even though that’s only a semi-colon short of being syntactically valid Objective-C, it won’t compile. Now that you know how properties work, you might even be able to guess why: this line of code tries to read a property (“get the existing origin X”) and write it (“add 10 to it”) in a single line of code. This isn’t possible with Objective-C properties, so you will often see code like this:

 CGRect frame = button.frame;
 button.frame = CGRectOffset(frame, 0, 50);
 */

// MARK: - Class Properties

/*
 
 class properties are never synthesized, which means you must create their ivar by hand and also create their methods. To demonstrate this here’s the name property recreated as a class property:

 @interface MyClass: NSObject
 @property (class) NSString *name;
 @end

 @implementation MyClass
 static NSString *_name = nil;

 + (NSString*)name {
     return _name;
 }

 + (void)setName:(NSString*)str {
     _name = str;
 }
 @end
 
 As you can see, we need to explicitly create the _name backing storage for the property, then create the name and setName methods for reading and writing to that backing storage.
 
 */

// Initializers
- (instancetype)initWithName:(NSString*)name;

@end

NS_ASSUME_NONNULL_END
