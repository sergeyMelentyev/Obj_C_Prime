#import <Foundation/Foundation.h>
// Use Xcode -> Help -> Documentation and API reference
// Use Xcode -> Product -> Profile for leaks checking

/*** COMPARISON ***/
// equal objects have the sane letters in the same order
// identical objects if they are the same objects

/*** NSNUMBER ***/
// can not be mutable, create a new obj if need a new number
[NSNumber numberWithInt:1];

/*** NSSTRING NSMUTABLESTRING***/
NSString *string = @"";		// create an instance of NSString obj with literal syntax
NSString *string = [NSString stringWithFormat: @"%@", objName];		// dynamic instance creation
[string length]; [stringOne isEqualToString: stringTwo];

/*** NSSET NSMUTABLESET ***/
// unordered collection, particular obj can only appear in a set once
// fastest way for checking object membership
-(BOOL)containsObject:(id)anObj;
-(NSSet *)filteredSetUsingPredicate:(NSPredicate *)predicate;		// create a new filtered NSSet
-(void)filterUsingPredicate:(NSPredicate *)predicate;		// filter NSMutableSet

/*** NSARRAY ***/
// Immutable ordered collection, holds a list of pointers to other objects, cannot be sorted
NSArray *array = @[objOne, objTwo];		// literal syntax
[array count]; 
for (NSDate *d in array) {}		// fast enumeration

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate;		// create a new filtered array
NSPredicate *predicate = [NSPredicate predicateWithFormat: @"holder.valueOfAssets > 70"];
NSArray *filteredArray = [fullArray filteredArrayUsingPredicate: predicate];

/*** NSMUTABLEARRAY ***/
// Mutable ordered collection can be sorted
NSMutableArray *mutArray = [NSMutableArray array];		// create an empty instance
NSMutableArray *mutArray = [[NSMutableArray alloc] init];		// create an empty instance
[mutArray addObject:objOne]; [mutArray insertObject:objTwo atIndex:0];
[mutArray removeObjectAtIndex:0];
-(NSUInteger)indexOfObject:(id)anobject;		// check each object for isEqual:anObject
-(NSUInteger)indexOfObjectIdenticalTo:(id)anObject;		// check each obj == anObject

-(void)sortUsingDescriptors:(NSArray *)sortDescriptors;		// sorting method
NSSortDescriptor *last = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending: YES];
NSSortDescriptor *first = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending: YES];
[mutArray sortUsingDescriptors: @[first, last]];

-(void)filterUsingPredicate:(NSPredicate *)predicate;		// filtering method

/*** NSDICTIONARY NSMUTABLEDICTIONARY ***/
// Unordered collection of key-value pares
NSDictionary *numOfMoons = @{@"Earth": @1, @"Mars": @2};		//literal syntax, NSString keys, NSNumber values
NSDictionary *numOfMoons = @{@"Earth": @[@"Luna"], @"Mars": @[@"Deimos", @"Phobos"]};		// nested collections
[dictName setObject:objName forkey:@"keyName"];

/*** CUSTOM CLASSES ***/
// Header file.h, the only interface that is visible
@class BNRAsset;		// the same as #import but with less information, faster
@interface BNRperson : NSObject {
    int _weightInKilos;     // instance variable cannot be read/wright from outside
}
-(int) weightInKilos;       // instance methods can read/wright instance variables
-(void) setWeightInKilos:(int) weight;
@property (nonatomic, readonly) int name;       // property attributes, read only
@property (nonatomic) int weightInK;        // props are the same as instances, without methods
@property (nonatomic, weak) BNRAsset *assets;		// weak reference does not imply ownership
-(float) bodyMassIndex;		// instance method
+(int) bodyMass;		// class method
@end

// Implementation file.m
@interface BNRperson () {		// class extension for private declarations, not inherited by subclass
	NSMutableArray *_assets;
}
@property (nonatomic) int officeAlarmCode;
@end

@implementation BNRperson		// class implementation
-(int) weightInKilos {      // instance methods can read/wright instance variables
    return _weightInKilos;
}
-(void) setWeightInKilos:(int) weight {
    _weightInKilos = weight;
}
-(float) bodyMassIndex {
    float normalBMI = [super bodyMassIndex];		// call super class method
    return [self weightInK] / [self weightInK];
}
@end

// executable file.m
BNRperson *person = [[BNRperson alloc] init];
[person setWeightInKilos:96];       // message sending for instances
person.weightInK = 100;     // dot notation for props

// 
