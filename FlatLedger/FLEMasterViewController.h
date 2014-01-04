//
//  FLEMasterViewController.h
//  FlatLedger
//
//  Created by Julian Ruppel on 04.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface FLEMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
