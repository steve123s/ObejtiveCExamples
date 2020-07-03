//
//  main.m
//  ObjectiveCTest
//
//  Created by Daniel Esteban Salinas on 02/07/20.
//  Copyright © 2020 danielsalinas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "AnotherPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // MARK: - Logs (print)
        NSLog(@"Hello, World!");
        
        // MARK: - Ints
        int integer = 10;
        
        // MARK: - Constants
        const int constant = 20;
        
        // MARK: - Strings (Objects must be allocated using a pintes (*))
        NSString *str = @"Reject common sense to make the impossible possible!";
        
        // MARK: - Arrays
        NSArray *array = @[@"item1", @"item2", @"item3"];
        
        // MARK: - Conditionals
        // MARK: - If/Else
        /**
         
         “If the content of your conditional statement is just one statement, you can omit the braces.”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         */
        
        // Examples
        if (integer == 10) {
            NSLog(@"Hello, World!");
        } else {
            NSLog(@"Goodbye!");
        }

        if (integer == 10)
            NSLog(@"Hello, World!");
        else
            NSLog(@"Goodbye!");
        
        if (integer == 10) NSLog(@"Hello, World!");
        
        // MARK: - Switch
        /**
         
         “Switch statements have implicit fallthrough. This is the opposite of Swift, and means you nearly always want to write break; at the end of case blocks to avoid fallthrough.”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         */
        
        // Example
        switch (integer) {
            case 10:
                NSLog(@"It's 20!");
                break;

            case 40:
                NSLog(@"It's 40!");
                break;

            case 60:
                NSLog(@"It's 60!");
                break;

            default:
                NSLog(@"It's something else.");
        }
        
        // Pattern matching but limited to ranges
        switch (integer) {
            case 1 ... 30:
                NSLog(@"It's between 1 and 30!");
                break;

            default:
                NSLog(@"It's something else.");
        }
        
        // Switch cases do not requiere to have a default to always match
        // Also you can declare a var inside a case if sorrounded by {} or not doing so in the first line
        switch (integer) {
            case 10:
            {
                int foo = 1;
                NSLog(@"It's something else.");
            }
        }

        switch (integer) {
            case 10:
                NSLog(@"It's something else.");
                int foo = 1;
        }
        
        // MARK: - Loops
        
        /**
         
         “Objective-C has the full set of loop options, including the C-style for loop that was deprecated in Swift 2.2.

         Let’s start off with the most common loop type, known as fast enumeration:”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         */
        
        // Examples
        // The %@ part is called a format specifier, and means “insert the contents of an object here
        NSArray *names = @[@"Laura", @"Janet", @"Kim"];

        for (NSString *name in names) {
            NSLog(@"Hello, %@", name);
        }
        
        // %d is another format specifier, and means “int"
        for (int i = 1; i <= 5; ++i) {
            NSLog(@"%d * %d is %d", i, i, i * i);
        }
    
        /**
         
         “You can use while just like in Swift, and do/while is identical to Swift’s repeat/while construct.

         As with conditions, you can omit braces from loops if your loop body contains only one statement.”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         */
        
        // MARK: - Nil Coalescing
        
        // :? instead of ??
        // This will print a name or “Anonymous” depending on whether the name variable has a value
        NSString *name = nil;
        NSLog(@"Hello, %@!", name ?: @"Anonymous");
        
        // MARK: - Pointers
        // MARK: - Good to know:
        /**
         
         “Objective-C developers create variables rather than constants by default, which is the opposite mindset of Swift developers. In fact, if you asked a random Objective-C developer “how do you make a constant string?” I’d say it’s 50/50 whether they can give you the right answer first time.

         To put this into context, the below code will not compile:

         const i = 10;
         i = 20;
         
         That creates a constant integer then tries to change it, which is clearly bad. But this code works fine:

         const NSString *first = @"Hello";
         first = @"World";
         
         You can even write this, which evaluates to the same thing:

         NSString const *first = @"Hello";
         first = @"World";
         
         The reason for this is subtle but important: both of those lines mean “I want to ensure the string doesn’t change, but I don’t mind if the pointer does.” Remember, all objects are pointers, so this is equivalent to saying, “I don’t mind if you move your signpost to point somewhere else, as long as you don’t change my house.”

         NSString is an immutable class, which means its value cannot be changed once it has been created. When you think you’re changing its value, what’s actually happening is that the old string is destroyed, a new one is created, and the pointer is updated to reflect the change.

         We can demonstrate this by using the %p format specifier for NSLog(), which means “print the pointer of this object.” This is useful for debugging purposes, because it allows you to track the specific value of an object in memory. In our case, we can see the pointer address change as a new object is produced. Try this code:

         NSString *first = @"Hello";
         NSLog(@"%p", first);
         first = @"World";
         NSLog(@"%p", first);
         
         When I ran that, I got the following output:

         2016-05-06 11:56:55.204 OCTest[57100:15178322] 0x100001038
         2016-05-06 11:56:55.205 OCTest[57100:15178322] 0x100001078
         
         So, at first the string lived at memory address 0x100001038, but after it was at 0x100001078 – the pointer has been moved.

         If we want to create a string that can’t be changed, what we need is a constant pointer. The NSString itself is effectively already const because it’s immutable, so we now just need to make sure no one moves our signpost. To do this, you need to move the const keyword after the pointer’s asterisk, like this:

         NSString * const first = @"Hello";
         
         */
        
        // MARK: - NSNumber
        
        /**
         
         NSNumber is designed to be a storage device, because Objective-C has one dramatic shortcoming that may well shock you: arrays and dictionaries can only hold objects. This means you can’t place integers into arrays, nor floats, doubles, or booleans.

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         This is a huge problem, so Objective-C gives us NSNumber: a class that serves to wrap each of those number types in an object so that we can put them into arrays, dictionaries, sets, and other places that require objects.

         You can create NSNumber instances using one of its many initializers, for example numberWithInteger accepts an NSInteger and returns an NSNumber instance that wraps it. You can then read back the number in the same or different data type, using methods like floatValue, intValue, and integerValue. For example:

         NSNumber *ten = [NSNumber numberWithInteger:10];
         float floatTen = [ten floatValue];
         However, it’s more common to see more @ symbol abuse to declare NSNumber literals. Using this technique, you can just write @ followed by an integer, a float, a double, or a boolean, and the compiler will produce an NSNumber instance for you. For example:
         
         NSNumber *integerTen = @10;
         NSNumber *booleanTrue = @YES;
         NSNumber *doublePi = @M_PI;

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         */
        
        // MARK: - Block Syntax
        
        /*
         
         Objective-C’s block syntax is quite different from Swift’s: there’s a caret symbol (^) followed by a list of parameters in parentheses, then the contents of the block itself. In the code above, that means the contents of the block is just the NSLog() line, and it will receive three parameters: obj, idx, andstop`.

         All three of the parameters need some explaining. The first one, obj, has the data type id, which is Objective-C’s version of Swift’s AnyObject. This will be set to an item in the array so that it can be processed. The second one, idx, is the position of the current item in the array – it’s short for “index”.

         The last parameter is a pointer to a boolean, which might seem bizarre at first: surely you can just refer to a boolean directly? Well, yes, but this parameter is used to bail out of the enumeration loop part way through. If it were a regular boolean, you could change its value in the block but that wouldn’t be visible outside the block. By passing a pointer to a boolean, you can modify its contents (“please stop looping now”) and that change will be visible outside the block.
         
         To demonstrate the stop parameter, this example loops through several villains, but stops when it reaches the weeping angels:

         [villains enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
             if ([obj isEqualToString:@"Weeping Angels"]) {
                 NSLog(@"Can the Doctor defeat the %@? Oh, apparently not.", obj);
                 *stop = true;
             } else {
                 NSLog(@"Can the Doctor defeat the %@? Yes he can!", obj);
             }
         }];
         
         Note the syntax: *stop means “change the value that stop is pointing to. Note also that even though obj is of type id – any object – we can still call isEqualToString on it. If you try using code completion, you’ll see that Xcode offers you every possible code completion for every class, because it has no idea what id might actually be. Lovely.
         
         */
        
        // http://goshdarnblocksyntax.com
        
        // MARK: - Filtering Arrays
        
        /**
         
         That just leaves the filteredArrayUsingPredicate method. If you’ve used Core Data or CloudKit before, you’ll be familiar with the concept of NSPredicate: a class designed to store how data should be fetched or filtered. This can be used to emulate Swift’s filter() method, for example we could write a predicate that returns only villains that have names made up of two words:

         NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id obj, NSDictionary *bindings) {
             return [[obj componentsSeparatedByString:@" "] count] == 2;
         }];
         
         NSArray *twoWordVillains = [villains filteredArrayUsingPredicate:predicate];
         The body of the block takes the input object being tested (obj), splits it up by spaces, then counts the resulting array, If the count is equal to 2 then the item is included in the filtered array, otherwise not.
         
         */
        
        // MARK: - Dictionaries
        
        NSDictionary *ships = @{
            @"Serenity": @"Firefly",
            @"Enterprise": @"Star Trek",
            @"Executor": @"Star Wars"
        };
        
        // Older dictionaries were often wtitten like this
        NSDictionary *ships2 = [NSDictionary dictionaryWithObjectsAndKeys:
            @"Firefly", @"Serenity",
            @"Star Trek", @"Enterprise",
            @"Star Wars", @"Executor",
            nil
        ];
        
        /**
         Old and new syntax is also available when reading values back from arrays. To demonstrate this, here are two ways to print out the values in an array, new first then old:
         */
        for (NSString *key in ships) {
            NSLog(@"The ship %@ features in %@", key, ships[key]);
        }

        for (NSString *key in ships) {
            NSLog(@"The ship %@ features in %@", key, [ships objectForKey:key]);
        }
        
        /**
         
         “Dictionaries get a lot of use in Objective-C because the language has no support for tuples. When you want to return multiple values from a method, expect to use dictionaries.”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         */
        
        // MARK: - Sets
        
        NSSet *odd = [NSSet setWithObjects:@1, @3, @5, @7, @9, nil];
        NSSet *even = [NSSet setWithObjects:@2, @4, @6, @8, @10, nil];
        NSSet *combined = [odd setByAddingObjectsFromSet:even];
        NSMutableSet *mutable = [combined mutableCopy];
        [mutable addObject:@0];
        [mutable removeAllObjects];
        
        // Counted Sets
        
        /**
         To give you a working example, the code below creates a counted set of several numbers, then prints out how often each number appears using the countForObject method:
         */
        
        NSCountedSet *numbers = [NSCountedSet setWithObjects: @1, @3, @2, @8, @3, @6, @8, @8, @5, @1, @6, @3, nil];

        for (NSString *value in [numbers allObjects]) {
            NSLog(@"%@ appears %ld times", value, [numbers countForObject:value]);
        }
        
        // MARK: - NSValue
        
        /**
         
         “As you’ve already learned, Objective-C’s collection types are designed to store objects, which means arrays of integers are only possible if you wrap the integers inside NSNumber instances. But what about arrays of CGRect, CGSize, CGPoint, or something else? Yep: those don’t work either – they are all structs in Objective-C (one of the few things that are!), and so can’t be in collections

         Apple’s solution to this is to create a generic object wrapper that handles a variety of different types. It’s called NSValue, and you’ll see it sprinkled throughout both macOS and iOS. For example, in project 16 of Hacking with Swift we wrote some code to handle resizing a text view when the keyboard was shown. It involved this line of Swift code:

         let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
         The method we wrote received a userInfo dictionary when the keyboard was shown or hidden, and inside that was a NSValue for the frame of the keyboard, and inside that was a CGRect containing the actual values.”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         */
        
        // MARK: - NSError
        
        NSError *error;
        NSString *contents = [NSString stringWithContentsOfFile:@"hello.txt" usedEncoding:nil error:&error];
        
        /**
         
         That starts relatively simply: it creates a new NSError variable called error. However, it gets created to nil because this is where we want an error to be placed if something went wrong in the following call. Then, in the code, I pass &error to the error parameter, which is new. If an error is produced by the method call, an NSError object is created and placed inside the error variable.

         This syntax is necessary because we’re actually dealing with pointer pointers – i.e. a pointer to a pointer. If we had created an NSError and passed it into the method where it was modified we might have only needed a regular pointer, but in cases where no error is produced it’s wasteful to create an NSError object when it isn’t needed. Instead, we pass a pointer to a pointer: rather than modifying an object being passed, the method can modify the pointer itself so that it points to a new object.

         Helpfully for all of us, this syntax occurs fairly infrequently in Objective-C, and nearly always when using NSError.
         
         */
        
        // MARK: - Blocks
        
        
        /**
         
         Blocks are the Objective-C equivalent of Swift’s closures, but if you thought closure syntax was bad you ain’t seen nothing yet. Don’t believe me? Here’s a simple closure in Swift:
         
         */

//         let printUniversalGreeting = {
//             print("Bah-weep-graaaaagnah wheep nini bong")
//         }

//         printUniversalGreeting()
         
        // And here is that same code translated into Objective-C:

         void (^printUniversalGreeting)(void) = ^{
             NSLog(@"Bah-weep-graaaaagnah wheep nini bong");
         };

         printUniversalGreeting();
        
        /*
         
         Yes, Objective-C’s block syntax is its own special type of bad, and you could probably make a gameshow called “Objective-C syntax or line noise?”. I’m afraid we’re stuck with it, though, so let’s try to break it down a little:

         void: The block returns nothing.
         (^printUniversalGreeting): Put the block into a variable called “printUniversalGreeting”.
         (void): The block accepts no parameters.
         = ^{ ... }: The contents of the block.
         
         */
        
        // Block with data types
        NSString* (^printUniversalGreeting2)(NSString *) = ^(NSString *name) {
            return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
        };
        
        /*
         
         Again, let’s break down that first line:

         NSString*: The block will return a string.
         (^printUniversalGreeting): It’s called “printUniversalGreeting”.
         (NSString *): It must accept a string parameter.
         = ^: Assign the following block to the variable.
         (NSString *name): This block accepts a string parameter.
         
         */
        
        // Separated looks like this:
        // declare the variable
        NSString* (^printUniversalGreeting3)(NSString *);

        // assign it a block to run
        printUniversalGreeting3 = ^(NSString *name) {
            return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
        };

        // now run it and print the result
        NSLog(@"%@", printUniversalGreeting3(@"Jim"));

        // assign a different block to run
        printUniversalGreeting3 = ^(NSString *name) {
            return [NSString stringWithFormat:@"Nanu Nanu, %@!", name];
        };
        
        // now run it again
        NSLog(@"%@", printUniversalGreeting3(@"Jim"));
        
        // MARK: - Alias
        
        /**
         
         “You might find it useful to use typedef to create an alias for your block type. For example:

         typedef NSString* (^MyBlock)(NSString*);
         
         That means, “create the data type MyBlock as an alias for a block that accepts a string and returns a string.” With that in place, you can now write this:

         MyBlock printUniversalGreeting = ^(NSString *name) {
             return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
         };”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         */
        
        // You can modify a variable inside the block, like this:

        NSInteger __block number = 0;

        NSString* (^printMeaningOfLife)(void) = ^{
            number = 42;
            return [NSString stringWithFormat:@"How many roads must a man walk down? %ld.", number];
        };

        NSLog(@"%@", printMeaningOfLife());
        
        // MARK: - Strong Reference Cycles
        
        /**
         
         “Blocks can sometimes cause memory problems, just like closures in Swift. The problem is identical: if a block is owned by object A, and has a strong reference to object A, then you have a strong reference cycle. That is, object A can’t be freed because its block exists, and its block can’t be freed because object A exists. Fortunately, the solution is identical too, at least in theory: make the block have a weak reference to its owner.

         In practice, Swift has the edge because they added capture lists to make strong reference cycles less likely – that’s the name for those things in brackets you write in closures, e.g. [unowned self]. Objective-C doesn’t have these, and instead requires you to use a __weak qualifier, like this:

         MyViewController * __weak weakSelf = self;

         NSString* (^myBlock)(void) = ^{
             return [weakSelf runSomeMethod];
         };”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books. 
         
         */
        
        // MARK: - Classes
        
        Person *person = [Person new];
        [person printGreeting];
        [person printGreeting:@"Welcome!"];
        [person printGreetingTo:@"Taylor!" atTimeOfDay:@"evening"];
        
        /*
         
         “In Swift, any file you create in you project is automatically built into your app’s namespace, which means a class you declare in file A is automatically available in file B. Not so in Objective-C: we need to #import the header file for Person.h to be able to use it in main.m.”

         Excerpt From: Paul Hudson. “Objective-C for Swift Developers.” Apple Books.
         
         */
        
        // Manipulating a propery
        person.name = @"Taylor";
        [person printName];
        
        // Initializers
        AnotherPerson *anotherPerson = [[AnotherPerson alloc] initWithName:@"James"];
        [anotherPerson printGreeting];
        
    }
    
    return 0;
}
