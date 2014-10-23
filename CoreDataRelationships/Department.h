//
//  Department.h
//  CoreDataRelationships
//
//  Created by Daniel Haaser on 10/6/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Address, Employee, Manager;

@interface Department : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Address *address;
@property (nonatomic, retain) NSSet *members;
@property (nonatomic, retain) Manager *manager;
@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addMembersObject:(Employee *)value;
- (void)removeMembersObject:(Employee *)value;
- (void)addMembers:(NSSet *)values;
- (void)removeMembers:(NSSet *)values;

@end
