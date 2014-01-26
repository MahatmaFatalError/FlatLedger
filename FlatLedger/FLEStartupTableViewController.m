    //
//  FLEStartupTableViewController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLEStartupTableViewController.h"
#import "FLECreateLedgerViewController.h"
#import "FLEUser.h"
#import "Datastore.h"
#import "FLEUserSession.h"
#import "FLESingletonModells.h"

@interface FLEStartupTableViewController ()

@end

@implementation FLEStartupTableViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginPressed:(id)sender {
    //WIRD NICHT GEZOGEN WEGEN SEGUE
	
	
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedin"];
	
	   
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}



- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
	__block BOOL returnValue = YES;
	
	if ([identifier isEqualToString:@"ModalLoginToLedger"]) {
        
		FLEUser* user = [FLESingletonModells getUser];

		[user setUserName:emailField.text];
		[user setPassword:passwordField.text];
		
		
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		@try {
            [user loadMe];
			//[user load];

			[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedin"];
			FLEUserSession *session = [FLESingletonModells getSession];
			session.user = user;
			//session.isLoggedIn = YES;
		}
		@catch (NSException *exception) {
			NSLog(@"User failed to log in");
			returnValue = NO;
			[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLoggedin"];
		}
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		
    } else {
		returnValue = YES;
	}
	return returnValue;
	
}


# pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	
	if ([segue.identifier isEqualToString:@"ModalSignupToCreateLedger"] ) {
        [((FLECreateLedgerViewController*)segue.destinationViewController) setEmail:emailField.text];
        [((FLECreateLedgerViewController*)segue.destinationViewController) setPassword:passwordField.text];
    }
    
	if ([segue.identifier isEqualToString:@"ModalLoginToLedger"]) {
		//TODO: nach login bevor ich auf neuen View wechsel perioden des Ledgers laden und in ViewDidLoad Methode vom LedgerTableViewController behandeln
        
//        FLEUser* user = [FLESingletonModells getUser];
//        FLELedger* ledger = [FLESingletonModells getLedger];
        
//        @try {
//            ledger = [user loadLedger];
//        }
//        @catch (NSException *exception) {
//            NSLog(@"Loading Ledger by User failed");
//        }
        
        NSLog(@"Try to login");

		
		//[segue.destinationViewController setDetailItem:period];
	}
}

    
#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 2;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"EmailCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

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






@end
