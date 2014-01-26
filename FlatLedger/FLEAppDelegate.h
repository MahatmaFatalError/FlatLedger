//
//  FLEAppDelegate.h
//  FlatLedger
//
//  Created by Julian Ruppel on 04.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface FLEAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
