//
//  FLECreateExpenseTableViewController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 08.02.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLECreateExpenseTableViewController.h"
#import "FLEExpense.h"
#import "FLEPeriod.h"
#import "FLESingletonModells.h"

@implementation FLECreateExpenseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setToolbarHidden:YES animated:YES];
}


- (IBAction)saveExpense:(id)sender {
	
	
	if ([price.text length] > 0 &&  [quantity.text length] > 0 && [item.text length] > 0 ) {
		FLEExpense *expense = [[FLEExpense alloc] init];
		
		expense.price		= [price.text doubleValue] ;
		expense.quantity	= [quantity.text intValue];
		expense.item		= item.text;
		expense.timestamp	= [NSDate date];
		FLEPeriod *period = [FLESingletonModells getSelectedPeriod];
		
		
			[expense saveAsyncWithBlock:^(NSError *error) {
				if (error) {
					NSLog(@"Error while saving Period");
				} else{
					@try {
						NSLog(@"Expense saved");
						[expense postUser:[FLESingletonModells getUser]];
						//[period load];
						[expense postPeriod:period];
						[period postExpenses:expense];
						[[self navigationController] popViewControllerAnimated:YES];
						//[[self navigationController] popToViewController:FLEPeriodTableViewController animated:YES];
						
					}
					@catch (NSException *exception) {
						NSLog(@"Error while saving expense-period connection");
					}
				}
				

			}];
				} else{
		NSLog(@"Fill in the mandatory fields");
	}
	
	
	
}

@end
