//
//  FancyTableViewCell.h
//  CoreDataRelationships
//
//  Created by Daniel Haaser on 10/22/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FancyTableViewCell : UITableViewCell

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* stuffDone;
@property (nonatomic, assign) NSInteger stuffDoneAmount;
@property (nonatomic, copy) NSString* jobTitle;

@end
