//
//  FLEPeriodTableViewController.h
//  FlatLedger
//
//  Created by Julian Ruppel on 02.02.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLESingletonModells.h"

@interface FLEPeriodTableViewController : UITableViewController
@property NSMutableArray *expenses;
@property FLEPeriod *period;
@end
