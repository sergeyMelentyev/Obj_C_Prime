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

// CUSTOM CLASSES
@interface BNRperson : NSObject {
    int _weightInKilos;     // instance variable cannot be read/wright from outside
}
-(int) weightInKilos;       // instance methods can read/wright instance variables
-(void) setWeightInKilos:(int) weight;
@property (nonatomic, readonly) int name;       // property attributes, read only
@property (nonatomic) int weightInK;        // props are the same as instances, without methods
-(float) bodyMassIndex;
@end

@implementation BNRperson
-(int) weightInKilos {      // instance methods can read/wright instance variables
    return _weightInKilos;
}
-(void) setWeightInKilos:(int) weight {
    _weightInKilos = weight;
}
-(float) bodyMassIndex {
    return [self weightInK] / [self weightInK];
}
@end

BNRperson *person = [[BNRperson alloc] init];
[person setWeightInKilos:96];       // message sending for instances
person.weightInK = 100;     // dot notation for props

// 
