#import <Foundation/Foundation.h>
// Use Xcode -> Product -> Profile for leaks checking


		/*** CONSTANTS ***/
#define PI 3.14159265
extern NSString *const NSLocaleCurrentCode;	// constant defined in some other place
NSString *const NSLocaleCurrentCode = @"currency";	// some other place


		/*** ENUM***/
// a set of constants, only one is allowed
typedef enum {
	BlenderSpeedStir = 1, BlenderSpeedChop = 2
} BlenderSpeed; BlenderSpeed speed;

typedef NS_ENUM(char, BlenderSpeed) {	// preprocessor macro that takes 2 args (data type, name)
	BlenderSpeedStir, BlenderSpeedChop
};


		/*** COMPARISON ***/
// equal objects have the same letters in the same order
// identical if objects are the same


		/*** NSNULL OBJECT ***/
// nil can not be added to any collection
[array addObject:[NSNull null]];


		/*** NSNUMBER ***/
// can not be mutable, create a new obj if need a new number
[array addObject:@4];	// literal syntax, convert int or float primitive into NSNumber
[NSNumber numberWithInt:1];


		/*** NSValue ***/
// use as pointer to struct primitive
NSPoint *somePoint = NSMakePoint(100, 100);
NSValue *pointValue = [NSValue valueWithPoint: somePoint];
[array addObject: pointValue];


		/*** C STRING ***/
char *str;


		/*** NSSTRING ***/
// immutable object
@property(readonly) NSUInteger length;
@property(readonly, copy) NSString *lowercaseString;
@property(readonly, copy) NSString *uppercaseString;
@property(readonly) double doubleValue;	// float, int, integer, long, bool

- (instancetype)initWithCharacters:(const unichar *)characters length:(NSUInteger)length;
- (instancetype)initWithString:(NSString *)aString;

+ (instancetype)stringWithFormat:(NSString *)format, ...;
+ (instancetype)stringWithCharacters:(const unichar *)characters length:(NSUInteger)length;
+ (instancetype)stringWithString:(NSString *)string;

- (NSString *)stringByAppendingFormat:(NSString *)format, ...;
- (NSString *)stringByAppendingString:(NSString *)aString;

+ (instancetype)stringWithContentsOfFile:(NSString *)path 
								encoding:(NSStringEncoding)enc error:(NSError * _Nullable *)error;
- (instancetype)initWithContentsOfFile:(NSString *)path 
								encoding:(NSStringEncoding)enc error:(NSError * _Nullable *)error;

+ (instancetype)stringWithContentsOfURL:(NSURL *)url 
								encoding:(NSStringEncoding)enc error:(NSError * _Nullable *)error;
- (instancetype)initWithContentsOfURL:(NSURL *)url 
							encoding:(NSStringEncoding)enc error:(NSError * _Nullable *)error;

- (NSString *)substringFromIndex:(NSUInteger)from;
- (NSString *)substringWithRange:(NSRange)range;

- (unichar)characterAtIndex:(NSUInteger)index;
- (void)getCharacters:(unichar *)buffer range:(NSRange)range;

- (BOOL)isEqualToString:(NSString *)aString;
- (NSComparisonResult)compare:(NSString *)string;
- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string;
- (BOOL)containsString:(NSString *)str;
- (NSRange)rangeOfString:(NSString *)searchString;	// the range of the first occurrence

- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;

// string utils
typealias unichar = UInt16;
typedef enum NSComparisonResult: NSInteger {
	NSOrderedAscending=-1L, NSOrderedSame, NSOrderedDescending 
} NSComparisonResult;


		/*** NSMUTABLESTRING ***/
// mutable object
+ (NSMutableString *)stringWithCapacity:(NSUInteger)capacity;	//  empty obj with initial storage of chars
- (NSMutableString *)initWithCapacity:(NSUInteger)capacity;

- (void)appendFormat:(NSString *)format, ...;	// adds a constructed string
- (void)appendString:(NSString *)aString;
- (void)deleteCharactersInRange:(NSRange)range;	// removes chars in a given range
- (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc;
- (NSUInteger)replaceOccurrencesOfString:(NSString *)target 
								withString:(NSString *)replacement 
									options:(NSStringCompareOptions)options range:(NSRange)searchRange;


		/*** NSSET ***/
// static sets of distinct objects, unordered collection, fastest way for checking obj membership
@property(readonly) NSUInteger count;

// initializes a newly allocated set and adds to it objects
- (instancetype)initWithArray:(NSArray<ObjectType> *)array;
- (instancetype)initWithObjects:(ObjectType)firstObj, ...;
- (instancetype)initWithSet:(NSSet<ObjectType> *)set;

// creates and returns a set
+ (instancetype)set;
+ (instancetype)setWithArray:(NSArray<ObjectType> *)array;	// set of uniqued collection of obj in array
+ (instancetype)setWithObject:(ObjectType)object;	// set that contains a single given object
+ (instancetype)setWithObjects:(ObjectType)firstObj, ...;	// ending with nil
+ (instancetype)setWithSet:(NSSet<ObjectType> *)set;

- (NSSet<ObjectType> *)setByAddingObject:(ObjectType)anObject;	// new set formed by adding a given object
- (NSSet<ObjectType> *)setByAddingObjectsFromSet:(NSSet<ObjectType> *)other;
- (NSSet<ObjectType> *)setByAddingObjectsFromArray:(NSArray<ObjectType> *)other;

-(BOOL)containsObject:(id)anObj;
-(NSSet *)filteredSetUsingPredicate:(NSPredicate *)predicate;	// create a new filtered NSSet
-(void)filterUsingPredicate:(NSPredicate *)predicate;	// filter NSMutableSet

// accessing set members
- (BOOL)containsObject:(ObjectType)anObject;
- (NSSet<ObjectType> *)filteredSetUsingPredicate:(NSPredicate *)predicate;	// eval predicate against all obj
- (void)makeObjectsPerformSelector:(SEL)aSelector;	// send message specified by a selector to each obj 
- (ObjectType)member:(ObjectType)object;	// determines whether set contains an obj equal to a given obj

- (NSEnumerator<ObjectType> *)objectEnumerator;	// enumerator obj that let access each obj in the set
NSEnumerator *enumerator = [mySet objectEnumerator]; id value;
while ((value = [enumerator nextObject])) { }

- (void)enumerateObjectsUsingBlock:(void (^)(ObjectType obj, BOOL *stop))block;	// execute block using all obj

// comparing sets
- (BOOL)isSubsetOfSet:(NSSet<ObjectType> *)otherSet;	// whether every obj in set is present in another set
- (BOOL)intersectsSet:(NSSet<ObjectType> *)otherSet;	// whether at least one obj in set present in another
- (BOOL)isEqualToSet:(NSSet<ObjectType> *)otherSet;	// if otherSet equal to receiving set
- (id)valueForKey:(NSString *)key;	// results of invoking valueForKey: on each of the receiving set
- (void)setValue:(id)value forKey:(NSString *)key;	// invokes setValue:forKey: on each of the set

// returns an array of the set content sorted as specified by a given array of sort descriptors
- (NSArray<ObjectType> *)sortedArrayUsingDescriptors:(NSArray<NSSortDescriptor *> *)sortDescriptors;


		/*** NSMUTABLESET ***/
// mutable, unordered collection of distinct objects
+ (instancetype)setWithCapacity:(NSUInteger)numItems;	// create and return  set with a given capacity
- (instancetype)initWithCapacity:(NSUInteger)numItems;	// returns an initialized set with a given capacity

- (void)addObject:(ObjectType)object;
- (void)addObjectsFromArray:(NSArray<ObjectType> *)array;
- (void)removeObject:(ObjectType)object;
- (void)removeAllObjects;

- (void)filterUsingPredicate:(NSPredicate *)predicate;	// eval pred against set and remove if pred is false
NSMutableSet *mutableSet = [NSMutableSet setWithObjects:@"One", @"Two", @"Three", @"Four", nil];
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith 'T'"];
[mutableSet filterUsingPredicate:predicate];

// combining and recombining sets
- (void)unionSet:(NSSet<ObjectType> *)otherSet;	// add each obj in otherSet to receiving if not present
- (void)minusSet:(NSSet<ObjectType> *)otherSet;	// remove each obj in otherSet from the receiving if present
- (void)intersectSet:(NSSet<ObjectType> *)otherSet;	// remove from set each obj that isn’t in otherSet
- (void)setSet:(NSSet<ObjectType> *)otherSet;	// empties set then add each obj contained in otherSet


		/*** NSARRAY ***/
// Immutable ordered collection, holds a list of pointers to other objects, cannot be sorted
NSArray *array = @[objOne, objTwo];	// literal syntaxx
for (NSDate *d in array) {}	// fast enumeration

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate;	// create a new filtered array
NSPredicate *predicate = [NSPredicate predicateWithFormat: @"holder.valueOfAssets > 70"];
NSArray *filteredArray = [fullArray filteredArrayUsingPredicate: predicate];


		/*** NSMUTABLEARRAY ***/
// Mutable ordered collection can be sorted
NSMutableArray *mutArray = [NSMutableArray array];	// create an empty instance
NSMutableArray *mutArray = [[NSMutableArray alloc] init];	// create an empty instance
[mutArray addObject:objOne]; [mutArray insertObject:objTwo atIndex:0];
[mutArray removeObjectAtIndex:0];
-(NSUInteger)indexOfObject:(id)anobject;	// check each object for isEqual:anObject
-(NSUInteger)indexOfObjectIdenticalTo:(id)anObject;	// check each obj == anObject

-(void)sortUsingDescriptors:(NSArray *)sortDescriptors;	// sorting method
NSSortDescriptor *last = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending: YES];
NSSortDescriptor *first = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending: YES];
[mutArray sortUsingDescriptors: @[first, last]];

-(void)filterUsingPredicate:(NSPredicate *)predicate;	// filtering method


		/*** NSDICTIONARY NSMUTABLEDICTIONARY ***/
// Unordered collection of key-value pares
NSDictionary *numOfMoons = @{@"Earth": @1, @"Mars": @2};	//literal syntax, NSString keys, NSNumber values
NSDictionary *numOfMoons = @{@"Earth": @[@"Luna"], @"Mars": @[@"Deimos", @"Phobos"]};	// nested collections
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
_block int counter = 0;	// modifier for an external var to change it withing a block
int (^newBlock)(int argName, int argLast);	// declare block variable
newBlock = ^(int argName, int argLast) {	// assign block to variable
	int returnArg = argName + argLast; 
	return returnArg; }
int anyVar = newBlock(1,2);	// call newBlock like a function

NSArray *origional = @[@"String"]; NSMutableArray *devowelized = [NSMutableArray array];
NSArray *vowels = @[@"t", @"r"];
void (^devower)(id, NSUInteger, BOOL *);	// block variable declaration
devower = ^(id string, NSUInteger i, BOOL *stop) {	// compose a block and assign it to the var
	NSMutableString *newString = [NSMutableString stringWithString: string];
	for(NSString *s in origional) {
		NSRange fullRange = NSMakeRange(0, [newString length]);
		[newString replaceOccurrencesOfString:s
						withString:@"" options: NSCaseInsensitiveSearch range:fullRange];
	}
	[devowelized addObject:newString];
};
void (^devower)(id, NSUInteger, BOOL *) = ^(id string, NSUInteger i, BOOL *stop) {}	// short hand
[origional enumerateObjectsUsingBlock:devower];	//passing in a block


		/*** CUSTOM CLASSES ***/
// Header file.h, the only interface that is visible
@class BNRAsset;	// the same as #import but with less information, faster
@interface BNRperson: NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    int _weightInKilos;	// instance variable cannot be read/wright from outside
}
-(int) weightInKilos;	// instance methods can read/wright instance variables
-(void) setWeightInKilos:(int) weight;
@property (nonatomic, readonly) int name;	// property attributes, read only
@property (nonatomic) int weightInK;	// props are the same as instances, without methods
@property (nonatomic, weak) BNRAsset *assets;	// weak reference does not imply ownership
-(float) bodyMassIndex;	// instance method
+(int) bodyMass;	// class method
// in order to implement callback methods, need to respond to as the protocol delegates
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;	// called after each chunk
-(void) connectionDidFinishLoading:(NSURLConnection *)connection;	// called after last chunk
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;	// if fails
@end

// Implementation file.m
@interface BNRperson () {	// class extension for private declarations, not inherited by subclass
	NSMutableArray *_assets;
}
@property (nonatomic) int officeAlarmCode;
@end

@implementation BNRperson	// class implementation
-(int) weightInKilos {	// instance methods can read/wright instance variables
    return _weightInKilos;
}
-(void) setWeightInKilos:(int) weight {
    _weightInKilos = weight;
}
-(float) bodyMassIndex {
    float normalBMI = [super bodyMassIndex];	// call super class method
    static NSDateFormatter * date = nil;	// all instances of class will have the same data
    return [self weightInK] / [self weightInK];
}
@end

// executable file.m
BNRperson *person = [[BNRperson alloc] init];
[person setWeightInKilos:96];	// message sending for instances
person.weightInK = 100;	// dot notation for props


		/*** PROTOCOLS ***/
@protocol UITableViewDataSource <NSObject>
@required
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@optional
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
		toIndexPath:(NSIndexPath *)destinationIndexPath;
@end


		/*** NSERROR READING WRITING DATA ***/
NSError *error;	// declare a pointerto an NSError obj, will only be created if error will acquire
BOOL success = [string wrireToFile:@"tmp/name.txt"
						atomically: YES
							encoding: NSUTF8StringEncoding
								error: &error];	// passing address of pointer var
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
