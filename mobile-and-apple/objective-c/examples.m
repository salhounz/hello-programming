#import <Foundation/Foundation.h>

// A C function can coexist with Objective-C message sends.
static NSString *Label(NSString *title, BOOL done) {
    NSString *status = done ? @"done" : @"next";
    return [NSString stringWithFormat:@"[%@] %@", status, title];
}

int main(void) {
    // ARC manages strong object references; the pool drains autoreleases.
    @autoreleasepool {
        NSString *owner = @"Ada";
        NSUInteger previewLimit = 2;
        BOOL showCompleted = NO;
        NSString *nickname = nil;
        NSLog(@"Tasks for %@", nickname ?: owner);

        // Collection literals contain objects: @YES boxes a scalar BOOL.
        NSArray<NSDictionary *> *tasks = @[
            @{@"title": @"Read a chapter", @"done": @YES},
            @{@"title": @"Water plants", @"done": @NO},
            @{@"title": @"Plan a walk", @"done": @NO}
        ];
        NSMutableArray<NSString *> *pending = [NSMutableArray array];

        // Fast enumeration visits each dictionary; subscripting reads keys.
        for (NSDictionary *task in tasks) {
            NSString *title = task[@"title"];
            BOOL done = [task[@"done"] boolValue];
            if (!done) {
                [pending addObject:title];
            }
            if (showCompleted || !done) {
                NSLog(@"%@", Label(title, done));
            }
        }

        NSRange range = NSMakeRange(0, MIN(previewLimit, pending.count));
        NSArray *preview = [pending subarrayWithRange:range];
        NSLog(@"Preview: %@", [preview componentsJoinedByString:@", "]);

        NSSet *tags = [NSSet setWithArray:@[@"home", @"learning", @"home"]];
        NSLog(@"Unique tags: %lu", (unsigned long)tags.count);
        NSDictionary *minutes = @{@"reading": @20, @"walk": @30};
        NSNumber *estimate = minutes[@"gardening"];
        NSLog(@"Missing estimate: %@", estimate ?: @0);

        // mutableCopy separates collection membership, sharing its elements.
        NSMutableArray *extended = [pending mutableCopy];
        [extended addObject:@"Write a note"];
        NSLog(@"Original: %lu; copy: %lu",
              (unsigned long)pending.count, (unsigned long)extended.count);

        // Blocks are callable objects and can capture surrounding values.
        NSString *(^announce)(NSString *) = ^NSString *(NSString *title) {
            return [NSString stringWithFormat:@"%@: %@", owner, title];
        };
        NSLog(@"%@", announce(@"Review today's tasks"));
    }
    return 0;
}
