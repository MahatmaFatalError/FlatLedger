//
//  FLELedgerTableViewController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLELedgerTableViewController.h"
#import "FLEUser.h"
#import "FLESingletonModells.h"
#import "FLEUserSession.h"
#import "FLEPeriod.h"

@interface FLELedgerTableViewController ()
//@property FLELedger *ledger; //ggf keine property und nur FLELedger* ledger = [FLESingletonModells getLedger];
@property FLEPeriod *activePeriod;

@end

@implementation FLELedgerTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
		//self.ledger = [FLESingletonModells getLedger];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//[[self tableView] reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    // initiale aktive periode anlegen mit jetzigem Timestamp als Startdatum und Enddatum ist offen
    //parallel zu ledger anlegen
    
    [self.tableView reloadData];
}
- (IBAction)performLogout:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLoggedin"];
    FLEUserSession *session = [FLESingletonModells getSession];
    session.user = nil;
    
    [FLESingletonModells releaseUser];
    [FLESingletonModells releaseLedger];
    [FLESingletonModells releaseActivePeriod];
    [FLESingletonModells releaseSession];
	
	
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"ModalLogout" sender:self];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source											
//TODOH prüfen ob ledger participant contains session.user

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1; //previously 0
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    FLELedger* ledger = [FLESingletonModells getLedger];
    //hier ggf ledger loadPeriods
    
    NSMutableArray *periods = [ledger loadPeriods:@""];
    
    NSInteger count = periods.count;
    
    if (count == 0) {
        //self.navigationItem.rightBarButtonItem
        [self.navigationItem setRightBarButtonItem:self.addPeriodNavigationBarButton animated:YES];
    } else{
        [self.navigationItem setRightBarButtonItem:nil animated:YES];
    }
    
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PeriodCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    FLELedger* ledger = [FLESingletonModells getLedger];
    
    // Configure the cell...
//    [self.ledger loadPeriodsAsync:@"" andWithBlock:^(NSError *error) {
//        self.activePeriod = self.ledger.periods[indexPath.row];
//        cell.textLabel.text = self.activePeriod.name;
//    }];
    NSMutableArray *perdiods = [ledger loadPeriods:@""];
	self.activePeriod = perdiods[indexPath.row];
    cell.textLabel.text = self.activePeriod.name;
    return cell;
}


//- (void)insertObject:(FLEPeriod *)period inLedgerAtIndex:(<#NSUInteger#>)index{
	
//}

- (IBAction)AddPeriodPressed:(id)sender {
	NSLog(@"AddPeriodPressed:");
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Create Period"
													message:@"Name the Period"
												   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
	
	alert.alertViewStyle = UIAlertViewStylePlainTextInput;
	
	[alert show];
	
	
}

- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alert buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"OK"])
    {
        FLELedger *ledger = [FLESingletonModells getLedger];
		self.activePeriod = [FLESingletonModells getActivePeriod];
		
		self.activePeriod.starttimestamp = [NSDate date];
		self.activePeriod.name = [alert textFieldAtIndex:0].text;
		NSLog(@"Periodname = %@", self.activePeriod.name);
        
		//[self.ledger.periods addObject:self.activePeriod];
        
        [self.activePeriod saveAsyncWithBlock:^(NSError *error) {
            if (error) {
                NSLog(@"Error while saving Period");
            } else{               
                [self.activePeriod postLedger:ledger];
                [ledger postPeriods:self.activePeriod];
                 NSLog(@"Period and Ledger Saved");
                [[self tableView] reloadData];
            }
        }];
			
    }
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
