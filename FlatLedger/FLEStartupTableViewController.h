//
//  FLEStartupTableViewController.h
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "FLEUser.h"

@interface FLEStartupTableViewController : UITableViewController {
    IBOutlet UITextField* emailField;
    IBOutlet UITextField* passwordField;
}

@end
