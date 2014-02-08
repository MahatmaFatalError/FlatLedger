//
//  FLECreateExpenseTableViewController.h
//  FlatLedger
//
//  Created by Julian Ruppel on 08.02.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLECreateExpenseTableViewController : UITableViewController{
	IBOutlet UITextField* item;
    IBOutlet UITextField* price;
	IBOutlet UITextField* quantity;

}

@end
