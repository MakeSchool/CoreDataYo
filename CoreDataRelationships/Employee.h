//
//  Employee.h
//  CoreDataRelationships
//
//  Created by Daniel Haaser on 10/6/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Address, Department, Manager;

@interface Employee : NSManagedObject

@property (nonatomic, retain) NSString * jobTitle;
@property (nonatomic, retain) NSDate * hireDate;
@property (nonatomic, retain) NSNumber * salary;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) Address *address;
@property (nonatomic, retain) Department *department;
@property (nonatomic, retain) Manager *managedBy;

@end
