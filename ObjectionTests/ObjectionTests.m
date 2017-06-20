#import <XCTest/XCTest.h>
#import "Objection.h"

@interface Foo : NSObject

- (instancetype)initWithName:(NSString *)name;

@end

@implementation Foo

- (instancetype)initWithName:(NSString *)name
{
    return nil;
}

@end


@interface ObjectionTests : XCTestCase

@property (nonatomic, strong) JSObjectionInjector *injector;

@end

@implementation ObjectionTests

- (void)setUp
{
    [super setUp];

    self.injector = [JSObjection createInjector];
}

- (void)testGetObjectInitializerArgumentList_customInitializerWillReturnNil_expectNilAndNoCrash
{
    Foo *foo = [self.injector getObject:[Foo class]
                            initializer:@selector(initWithName:)
                           argumentList:@[@"The Name"]];
    
    XCTAssertNil(foo);
}

@end
