#import <Foundation/Foundation.h>
// USE Xcode -> Help -> Documentation and API reference

// NSSTRING 
NSString *string = @"";		// create an instance of NSString obj with literal syntax
NSString *string = [NSString stringWithFormat: @"%@", objName];		// dynamic instance creation
[string length]; [stringOne isEqualToString: stringTwo];

// NSArray is immutable, holds a list of pointers to other objects
NSArray *array = @[objOne, objTwo];		// create an instance with literal syntax
[array count]; 
for (NSDate *d in array) {}		// fast enumeration

// NSMutableArray
NSMutableArray *mutArray = [NSMutableArray array];		// create an empty instance
NSMutableArray *mutArray = [[NSMutableArray alloc] init];		// create an empty instance
[mutArray addObject:objOne]; [mutArray insertObject:objTwo atIndex:0];
[mutArray removeObjectAtIndex:0];
