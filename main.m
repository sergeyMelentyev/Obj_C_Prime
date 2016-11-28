#import <Foundation/Foundation.h>
// Use Xcode -> Help -> Documentation and API reference
// Use Xcode -> Product -> Profile for leaks checking

/*** COMPARISON ***/
// equal objects have the same letters in the same order
// identical if objects are the same

/*** NSNULL ***/
// nil can not be added to any collection
[array addObject:[NSNull null]];

/*** CONSTANTS ***/
#define PI 3.14159265
extern NSString *const NSLocaleCurrentCode;		// constant defined in some other place
NSString *const NSLocaleCurrentCode = @"currency";		// some other place

/*** NSNUMBER ***/
// can not be mutable, create a new obj if need a new number
[array addObject:@4];		// literal syntax, convert int or float primitive into NSNumber
[NSNumber numberWithInt:1];

/*** NSValue ***/
// use as pointer to struct primitive
NSPoint *somePoint = NSMakePoint(100, 100);
NSValue *pointValue = [NSValue valueWithPoint: somePoint];
[array addObject: pointValue];

/*** ENUM***/
// a set of constants, only one is allowed
typedef enum {
	BlenderSpeedStir = 1, BlenderSpeedChop = 2
} BlenderSpeed;
BlenderSpeed speed;

typedef NS_ENUM(char, BlenderSpeed) {		// preprocessor macro that takes 2 args (data type, name)
	BlenderSpeedStir, BlenderSpeedChop
};

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

/*** CALLBACKS ***/
[[NSRunLoop currentRunLoop] run];
// Target-action, sending one callback to one object
BNRperson *anyInstanceName = [[BNRperson alloc]init];
NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
							target:anyInstanceName selector:@selector(anyMethodName:)
								userInfo:nil repeats:YES];
// Helper object with protocols, sending an assortment of callbacks to one object
BNRperson *anyInstanceName = [[BNRperson alloc]init];
NSURL *url = [NSURL URLWithString:@"http"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
								delegate:anyInstanceName startImmediately:YES];
// Notifications, register as observer
BNRperson *anyInstanceName = [[BNRperson alloc]init];
[[NSNotificationCenter defaultCenter] addObserver:anyInstanceName
								selector:@selector(anyMethodName:)
									name:NSSystemTimeZoneDidChangeNotification object:nil];
// Blocks
^{ NSLog(@"Logic here"); }
^(int varName){ NSLog(@"Logic here"); return varName; }
NSArray *origional = @[@"String"]; NSMutableArray *devowelized = [NSMutableArray array];
NSArray *vowels = @[@"t", @"r"];


/*** CUSTOM CLASSES ***/
// Header file.h, the only interface that is visible
@class BNRAsset;		// the same as #import but with less information, faster
@interface BNRperson: NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    int _weightInKilos;     // instance variable cannot be read/wright from outside
}
-(int) weightInKilos;       // instance methods can read/wright instance variables
-(void) setWeightInKilos:(int) weight;
@property (nonatomic, readonly) int name;       // property attributes, read only
@property (nonatomic) int weightInK;        // props are the same as instances, without methods
@property (nonatomic, weak) BNRAsset *assets;		// weak reference does not imply ownership
-(float) bodyMassIndex;		// instance method
+(int) bodyMass;		// class method
// in order to implement callback methods, need to respond to as the protocol delegates
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;	// called after each chunk
-(void) connectionDidFinishLoading:(NSURLConnection *)connection;		// called after last chunk
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;	// if fails
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
    static NSDateFormatter * date = nil;		// all instances of class will have the same data
    return [self weightInK] / [self weightInK];
}
@end

// executable file.m
BNRperson *person = [[BNRperson alloc] init];
[person setWeightInKilos:96];       // message sending for instances
person.weightInK = 100;     // dot notation for props

/*** NSERROR READING WRITING DATA ***/
NSError *error;		// declare a pointerto an NSError obj, will only be created if error will acquire
BOOL success = [string wrireToFile:@"tmp/name.txt"
						atomically: YES
							encoding: NSUTF8StringEncoding
								error: &error];		// passing address of pointer var
if (!success)
	NSLog(@"error", [error localizedDescription]);

// reading string from file
NSString *str = [[NSString alloc] initWithContentsOfFile:@"tmp/name.txt"
									encoding: NSASCIIStringEncoding
										error: &error];
if (!str)
	NSLog(@"error", [error localizedDescription])

// reading data from file
NSData *readData = [NSData dataWithContentsOfFile:@"tmp/name.png"];

// reading data from url
NSURL *url = [NSUrl URLWithString:@"http"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
NSError *error = nil;
NSData *data = [NSURLConnection sendSynchronousRequest:request
										returningResponse:NULL 
											error:&error];
BOOL written = [data writeToFile:@"temp/name.png"
						options:0		// NSDataWriteAtomic for writing as a whole file
							error:&error];
// function that will return the right direction
// https://developer.apple.com/reference/foundation/nssearchpathdirectory
NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSdesktopDirectory, NSUserDomainMask, YES);
NSString *desktopPath = desktops[0];
