//
//  FLEShowExpenseTableViewController.h
//  FlatLedger
//
//  Created by Julian Ruppel on 09.02.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FLEExpense.h"
@class FLEExpense;

@interface FLEShowExpenseTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *showItemLabel;
@property (weak, nonatomic) IBOutlet UILabel *showQtyLabel;
@property (weak, nonatomic) IBOutlet UILabel *showPriceLabel;
@property (strong) FLEExpense *expense;

@end
