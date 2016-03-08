//
//  DDTodoListTests.m
//  DDTodoListTests
//
//  Created by Daniel Djurfelter on 03/03/16.
//  Copyright © 2016 Daniel Djurfelter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DDTodoListViewModel.h"
#import "DDTodoItem.h"

@interface DDTodoListTests : XCTestCase

@property (nonatomic, strong) DDTodoListViewModel* viewModel;
@property (nonatomic, strong) UITableView* tableView;

@end

@implementation DDTodoListTests

- (void)setUp {
    [super setUp];
    self.viewModel = [DDTodoListViewModel new];
    self.tableView = [UITableView new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.viewModel = nil;
    self.tableView = nil;
}

- (void)testAddToViewModel {
    NSInteger initialCount = [self.viewModel tableView:self.tableView numberOfRowsInSection:0];
    [self.viewModel addItem:[[DDTodoItem alloc] initWithTitle:@"Hello"]];
    
    NSInteger newCount = [self.viewModel tableView:self.tableView numberOfRowsInSection:0];
    NSInteger expectedCount = initialCount+1;
    
    XCTAssert(newCount == expectedCount, @"Adding to view model failed, expected %@, got %@", @(expectedCount), @(newCount));
}

-(void)testDeleteFromViewModel {
    NSInteger initialCount = [self.viewModel tableView:self.tableView numberOfRowsInSection:0];
    [self.viewModel removeItemAtIndex:initialCount-1];
    
    NSInteger newCount = [self.viewModel tableView:self.tableView numberOfRowsInSection:0];
    NSInteger expectedCount = initialCount-1;
    
    XCTAssert(newCount == expectedCount, @"Removing from view model failed, expected %@, got %@", @(expectedCount), @(newCount));
}

- (void)testViewModelInsertionPerformance {
    // This is an example of a performance test case.
    [self measureBlock:^{
        for (int i = 0; i < 1000; i++) {
            NSString *title = [NSString stringWithFormat:@"%d", i];
            DDTodoItem *item = [[DDTodoItem alloc] initWithTitle:title];
            [self.viewModel addItem:item];
        }
    }];
}

@end
