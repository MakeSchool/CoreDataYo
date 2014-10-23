//
//  Manager.h
//  CoreDataRelationships
//
//  Created by Daniel Haaser on 10/6/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Employee.h"

@class Department, Employee;

@interface Manager : Employee

@property (nonatomic, retain) NSNumber * tpsReportsFiled;
@property (nonatomic, retain) NSSet *manages;
@property (nonatomic, retain) Department *managesDepartment;
@end

@interface Manager (CoreDataGeneratedAccessors)

- (void)addManagesObject:(Employee *)value;
- (void)removeManagesObject:(Employee *)value;
- (void)addManages:(NSSet *)values;
- (void)removeManages:(NSSet *)values;

@end
