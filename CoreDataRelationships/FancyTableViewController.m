//
//  ViewController.m
//  CoreDataRelationships
//
//  Created by Daniel Haaser on 10/6/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "FancyTableViewController.h"
#import "AppDelegate.h"
#import "Employee.h"
#import "Manager.h"
#import "BurgerFlipper.h"
#import "FancyTableViewCell.h"
#import <CoreData/CoreData.h>

@interface FancyTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FancyTableViewController
{
    NSArray* tableData;
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self fetchAllEmployees];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchAllEmployees
{
    NSManagedObjectContext* context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;

    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    // create an error variable to pass to the execute method
    NSError *error;
    
    // retrieve results
    tableData = [context executeFetchRequest:request error:&error];
    
    if (tableData == nil)
    {
        NSLog(@"OH GEEZE IT'S ALL GONE WRONG");
    }
}

- (UIColor*)colorForCellAtIndexPath:(NSIndexPath*)indexPath
{
    NSInteger row = indexPath.row;
    
    UIColor* color;
    
    switch (row % 5)
    {
        case 0: color = [UIColor colorWithRed:26/255.0f green:188/255.0f blue:156/255.0f alpha:1.0f]; break;
        case 1: color = [UIColor colorWithRed:46/255.0f green:204/255.0f blue:113/255.0f alpha:1.0f]; break;
        case 2: color = [UIColor colorWithRed:52/255.0f green:152/255.0f blue:219/255.0f alpha:1.0f]; break;
        case 3: color = [UIColor colorWithRed:155/255.0f green:89/255.0f blue:182/255.0f alpha:1.0f]; break;
        case 4: color = [UIColor colorWithRed:52/255.0f green:73/255.0f blue:94/255.0f alpha:1.0f]; break;
    }
    
    return color;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableData.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FancyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"FancyCell"];
    
    cell.backgroundColor = [self colorForCellAtIndexPath:indexPath];
    
    Employee* employee = tableData[indexPath.row];
    
    cell.name = [[NSString stringWithFormat:@"%@ %@", employee.firstName, employee.lastName] uppercaseString];
    cell.jobTitle = employee.jobTitle;
    
    if ([employee isKindOfClass:[Manager class]])
    {
        Manager* manager = (Manager*) employee;
        cell.stuffDone = @"TPS Reports Filed";
        cell.stuffDoneAmount = manager.tpsReportsFiled.integerValue;
    }
    else if ([employee isKindOfClass:[BurgerFlipper class]])
    {
        BurgerFlipper* burgerFlipper = (BurgerFlipper*) employee;
        cell.stuffDone = @"Burgers Flipped";
        cell.stuffDoneAmount = burgerFlipper.burgersFlipped.integerValue;
    }
    
    return cell;
}

#pragma mark - Button Actions

- (IBAction)actionBurgerKings:(id)sender
{
    
}

- (IBAction)actionExpensiveEmployees:(id)sender
{
    
}

- (IBAction)actionLazyManagers:(id)sender
{
    
}

@end
