//
//  AppDelegate.m
//  CoreDataRelationships
//
//  Created by Daniel Haaser on 10/6/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "AppDelegate.h"
#import "Department.h"
#import "Address.h"
#import "Employee.h"
#import "Manager.h"
#import "BurgerFlipper.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [[NSUserDefaults standardUserDefaults] setObject:@YES forKey:@"dbInitialized"];
    
    
    // ----------------------------------------------------------
    //                   Add Stuff to Database
    // ----------------------------------------------------------
    NSManagedObjectContext* context = [self managedObjectContext];
    
    Address* corporateHQAddress = [NSEntityDescription insertNewObjectForEntityForName:@"Address" inManagedObjectContext:context];
    corporateHQAddress.streetNumber = @"572";
    corporateHQAddress.street = @"Moewginary Lane";
    corporateHQAddress.city = @"SasCATchewan";
    corporateHQAddress.state = @"Catlifornia";
    corporateHQAddress.zip = @"54200";
    
    Department* salesDepartment = [NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:context];
    salesDepartment.name = @"Sales";
    salesDepartment.address = corporateHQAddress;
    
    Department* manufacturing = [NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:context];
    manufacturing.name = @"Manufacturing";
    manufacturing.address = corporateHQAddress;

    Department* executiveDepartment = [NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:context];
    executiveDepartment.name = @"Executive";
    executiveDepartment.address = corporateHQAddress;
    
    Manager* ianTheExecutive = [NSEntityDescription insertNewObjectForEntityForName:@"Manager" inManagedObjectContext:context];
    ianTheExecutive.firstName = @"Ian";
    ianTheExecutive.lastName = @"Execu-pants";
    ianTheExecutive.jobTitle = @"Overpaid Head Honcho";
    ianTheExecutive.hireDate = [NSDate dateWithTimeIntervalSince1970:674000.0f];
    ianTheExecutive.salary = @425000; // Plus stock and benefits
    ianTheExecutive.department = executiveDepartment;
    ianTheExecutive.tpsReportsFiled = @1000;
    
    Manager* martyTheManager = [NSEntityDescription insertNewObjectForEntityForName:@"Manager" inManagedObjectContext:context];
    martyTheManager.firstName = @"Marty";
    martyTheManager.lastName = @"Mr. Manager";
    martyTheManager.jobTitle = @"Sales Management Superstar";
    martyTheManager.hireDate = [NSDate date];
    martyTheManager.salary = @50000;
    martyTheManager.department = salesDepartment;
    martyTheManager.tpsReportsFiled = @4367;
    martyTheManager.managedBy = ianTheExecutive;
    
    Manager* johnTheManager = [NSEntityDescription insertNewObjectForEntityForName:@"Manager" inManagedObjectContext:context];
    johnTheManager.firstName = @"John";
    johnTheManager.lastName = @"Johnson";
    johnTheManager.jobTitle = @"Manufacturing Management";
    johnTheManager.hireDate = [NSDate date];
    johnTheManager.salary = @52300;
    johnTheManager.department = manufacturing;
    johnTheManager.tpsReportsFiled = @2;
    johnTheManager.managedBy = ianTheExecutive;
    
    manufacturing.manager = johnTheManager;
    
    BurgerFlipper* bobTheBurgerFlipper = [NSEntityDescription insertNewObjectForEntityForName:@"BurgerFlipper" inManagedObjectContext:context];
    bobTheBurgerFlipper.firstName = @"Bob";
    bobTheBurgerFlipper.lastName = @"Burgerfeld";
    bobTheBurgerFlipper.jobTitle = @"Line Cook";
    bobTheBurgerFlipper.hireDate = [NSDate dateWithTimeIntervalSinceNow:-1000000];
    bobTheBurgerFlipper.salary = @16000;
    bobTheBurgerFlipper.department = manufacturing;
    bobTheBurgerFlipper.burgersFlipped = @7650;
    bobTheBurgerFlipper.managedBy = martyTheManager;
    
    BurgerFlipper* marcoTheBurgerFlipper = [NSEntityDescription insertNewObjectForEntityForName:@"BurgerFlipper" inManagedObjectContext:context];
    marcoTheBurgerFlipper.firstName = @"Marco";
    marcoTheBurgerFlipper.lastName = @"Marcenberger";
    marcoTheBurgerFlipper.jobTitle = @"Line Cook";
    marcoTheBurgerFlipper.hireDate = [NSDate dateWithTimeIntervalSinceNow:-1500000];
    marcoTheBurgerFlipper.salary = @20000;
    marcoTheBurgerFlipper.department = manufacturing;
    marcoTheBurgerFlipper.burgersFlipped = @15432;
    marcoTheBurgerFlipper.managedBy = martyTheManager;
    
    BurgerFlipper* donnyTheBurgerFlipper = [NSEntityDescription insertNewObjectForEntityForName:@"BurgerFlipper" inManagedObjectContext:context];
    donnyTheBurgerFlipper.firstName = @"Donny";
    donnyTheBurgerFlipper.lastName = @"Mustard";
    donnyTheBurgerFlipper.jobTitle = @"Line Cook";
    donnyTheBurgerFlipper.hireDate = [NSDate dateWithTimeIntervalSinceNow:-2300000];
    donnyTheBurgerFlipper.salary = @22000;
    donnyTheBurgerFlipper.department = manufacturing;
    donnyTheBurgerFlipper.burgersFlipped = @34890;
    donnyTheBurgerFlipper.managedBy = martyTheManager;
    
    
    NSError* error;
    if (![context save:&error])
    {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }

    return YES;
}

- (void)printEmployee:(Employee*)employee
{
    NSLog(@"FirstName: %@", employee.firstName);
    NSLog(@"LastName: %@", employee.lastName);
    NSLog(@"Salary: %@", employee.salary);
    NSLog(@"Department: %@", employee.department);
    NSLog(@"Manager: %@", employee.managedBy);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.makeschool.CoreDataRelationships" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataRelationships" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataRelationships.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
