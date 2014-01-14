//
//  FLELedgerTableViewController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLELedgerTableViewController.h"
#import "User.h"
#import "FLESingletonModells.h"
#import "FLEUserSession.h"
#import "Periods.h"

@interface FLELedgerTableViewController ()

@end

@implementation FLELedgerTableViewController

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
    
    
    // initiale aktive periode anlegen mit jetzigem Timestamp als Startdatum und Enddatum ist offen
    //parallel zu ledger anlegen
    
    
    [self.tableView reloadData];
}
- (IBAction)performLogout:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLoggedin"];
    FLEUserSession *session = [FLESingletonModells getSession];
    
    session.user = nil;
    
    User *user = [FLESingletonModells getUser];
    [FLESingletonModells releaseUser];
	
	
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PeriodCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

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
		Periods *period = [FLESingletonModells getActivePeriod];
		
		period.starttimestamp = [NSDate date];
		period.ledger = ledger;
		
		period.name = [alert textFieldAtIndex:0].text;
		NSLog(@"Periodname = %@", period.name);
		[ledger.periods addObject:period];
		
		[ledger saveAsyncWithBlock:^(NSError *errorL) {
			if (errorL) {
				NSLog(@"Error while saving Ledger");
			} else{
				[period saveAsyncWithBlock:^(NSError *error) {
					if (errorL) {
						NSLog(@"Error while saving Period");
					} else{
						NSLog(@"Period and Ledger Saved");
					}
				}];
				
			}
			
		}];
    }
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
