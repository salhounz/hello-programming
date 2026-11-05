#import <Foundation/Foundation.h>

@interface Counter : NSObject {
    NSInteger _count;
}
- (void)increment;
- (NSInteger)value;
@end

@implementation Counter
- (void)increment { _count++; }
- (NSInteger)value { return _count; }
@end

int main(void) {
    @autoreleasepool {

        /*
            Type Systems & Variables
        */
        // C types describe scalars; Objective-C pointers refer to dynamically messaged objects.
        NSInteger score = 10;
        score += 5;
        NSString *language = @"Objective-C";
        (void)language;

        /*
            Control Flow Operations
        */
        // C flow-control statements and fast enumeration handle decisions and iteration.
        NSString *result = score >= 10 ? @"pass" : @"retry";
        for (NSNumber *value in @[@1, @2, @3]) { score += value.integerValue; }
        (void)result;

        /*
            Execution Blocks
        */
        // Methods group object behavior and blocks are callable values.
        NSInteger (^add)(NSInteger, NSInteger) = ^NSInteger(NSInteger left, NSInteger right) {
            return left + right;
        };
        NSInteger sum = add(2, 3);
        (void)sum;

        /*
            Code Health & Documentation
        */
        // Use line and block comments; document methods and ownership contracts.
        // A single-line comment.
        /* A multi-line comment.
           Explain lifetime assumptions and API behavior. */

        /*
            Built-In Collections
        */
        // NSArray is ordered, NSDictionary maps keys, and NSSet stores distinct objects.
        NSArray<NSNumber *> *values = @[@1, @2, @3];
        NSDictionary<NSString *, NSNumber *> *inventory = @{@"apples": @3};
        NSSet<NSNumber *> *unique = [NSSet setWithArray:@[@1, @1, @2]];
        (void)inventory; (void)unique;

        /*
            Data Mutability
        */
        // Immutable and mutable Foundation collections differ; mutableCopy makes a shallow mutable copy.
        NSMutableArray<NSNumber *> *copied = [values mutableCopy];
        [copied addObject:@4];
        NSCAssert(values.count == 3, @"Original remains unchanged");

        /*
            Access & Encapsulation
        */
        // An interface exposes operations while the implementation maintains instance state.
        Counter *counter = [Counter new];
        [counter increment];
        NSCAssert([counter value] == 1, @"Counter increments");

        /*
            Design Paradigms & Patterns
        */
        // Object composition and blocks support reusable behavior.
        NSArray<NSNumber *> *selected = [values filteredArrayUsingPredicate:
            [NSPredicate predicateWithBlock:^BOOL(NSNumber *value, NSDictionary *bindings) {
                return value.integerValue > 1;
            }]];
        (void)selected;

        /*
            Memory Management
        */
        // ARC manages object references; autorelease pools bound deferred releases.
        __weak Counter *weakCounter = counter;
        NSCAssert(weakCounter != nil, @"Strong owner is still alive");

        /*
            Concurrency & Parallelism
        */
        // NSOperationQueue schedules operations; the CLI waits so work finishes before exit.
        NSOperationQueue *queue = [NSOperationQueue new];
        [queue addOperationWithBlock:^{ /* Independent work belongs here. */ }];
        [queue waitUntilAllOperationsAreFinished];

        /*
            Performance Optimization
        */
        // Use collection membership operations and profile actual allocations and work.
        BOOL containsTwo = [unique containsObject:@2];
        (void)containsTwo;

        NSLog(@"Hello, World!");
    }
    return 0;
}
