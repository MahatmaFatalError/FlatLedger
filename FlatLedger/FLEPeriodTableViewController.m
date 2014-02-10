//
//  FLEPeriodTableViewController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 02.02.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLEPeriodTableViewController.h"
#import "FLEExpense.h"
#import "FLEShowExpenseTableViewController.h"



@interface FLEPeriodTableViewController ()

@end

@implementation FLEPeriodTableViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.period = [FLESingletonModells getSelectedPeriod];
	@try {
		[self.period load];
		self.expenses = [self.period loadExpenses:@""];
	}
	@catch (NSException *exception) {
		NSLog(@"Error while loading period connection");
	}
	
	//async
//	[self.period loadAsyncWithBlock:^(NSError *error) {
//		if (error) {
//			NSLog(@"Error while loading Period");
//		} else{
//			self.expenses = [[FLESingletonModells getSelectedPeriod] loadExpenses:@""];
//			//TODO: Wenn die selectedPeriod.active = true den Plus button ein oder ausblenden
//		}
//		
//	}];
	
	
	
	
	// non-active periods are read only
    if ([self.period.status isEqualToString:@"active"]) {
        //self.navigationItem.rightBarButtonItem
        [self.navigationItem setRightBarButtonItem:self.addExpenceButton animated:YES];
    } else{
        [self.navigationItem setRightBarButtonItem:nil animated:YES];
    }
    
    //UIBarButtonItem *payOffButton = [[UIBarButtonItem alloc] initWithTitle:@"PayOff" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    [self setToolbarItems:@[self.payOffButton] animated:YES];
	[self.navigationController setToolbarHidden:NO animated:YES];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
	[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 40)];
    
	double balance = 0;
	
	for (FLEExpense *expense in self.expenses) {
		FLEUser *payingUser = [expense loadUser];
		if ([payingUser.userName isEqualToString:[FLESingletonModells getUser].userName ]) { //payingUser.u isEqual:[FLESingletonModells getUser]
			balance = balance + expense.price;
		} else{
			balance = balance - expense.price;
		}		
	}
	
	
	if (balance < 0) {
		label.text = [NSString stringWithFormat:@"Balance: -%.2lf €", balance];
	} else{
		label.text = [NSString stringWithFormat:@"Balance: %.2lf €", balance];
	}
	
    
    return label;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    FLEPeriod* period = [FLESingletonModells getSelectedPeriod];
	//[period loadExpenses:@""];
	@try {
		self.expenses = [period loadExpenses:@""];
	}
	@catch (NSException *exception) {
		NSLog(@"Error while loading expenses");
	}
	
    NSInteger count = [self.expenses count];
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ExpenseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
	FLEExpense *expense = self.expenses[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %1.2f",expense.item, expense.price];
//TODO: price noch konkartenieren
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	if ([segue.identifier isEqualToString:@"PushPeriodToShowExpense"]) {
        //cell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FLEExpense *expense = self.expenses[indexPath.row];
		[segue.destinationViewController setExpense: expense];
    }
}



@end
