//
//  FancyTableViewCell.m
//  CoreDataRelationships
//
//  Created by Daniel Haaser on 10/22/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "FancyTableViewCell.h"

@interface FancyTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblStuffDone;
@property (weak, nonatomic) IBOutlet UILabel *lblStuffDoneAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblJobTitle;

@end


@implementation FancyTableViewCell

#pragma mark - Lifecycle

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setters

- (void)setName:(NSString *)name
{
    if (_name != name)
    {
        _name = [name copy];
    }
    
    self.lblName.text = _name;
}

- (void)setStuffDone:(NSString *)stuffDone
{
    if (_stuffDone != stuffDone)
    {
        _stuffDone = [stuffDone copy];
    }
    
    self.lblStuffDone.text = _stuffDone;
}

- (void)setStuffDoneAmount:(NSInteger)stuffDoneAmount
{
    if (_stuffDoneAmount != stuffDoneAmount)
    {
        _stuffDoneAmount = stuffDoneAmount;
    }
    
    self.lblStuffDoneAmount.text = [NSString stringWithFormat:@"%d", stuffDoneAmount];
}

- (void)setJobTitle:(NSString *)jobTitle
{
    if (_jobTitle != jobTitle)
    {
        _jobTitle = [jobTitle copy];
    }
    
    self.lblJobTitle.text = _jobTitle;
}

@end
