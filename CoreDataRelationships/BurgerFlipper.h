//
//  BurgerFlipper.h
//  CoreDataRelationships
//
//  Created by Daniel Haaser on 10/6/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Employee.h"


@interface BurgerFlipper : Employee

@property (nonatomic, retain) NSNumber * burgersFlipped;

@end
