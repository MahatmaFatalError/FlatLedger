//
//  FLECreateLedgerViewController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLECreateLedgerViewController.h"
#import "FLELedger.h"
#import "FLEUser.h"
#import "AOMDatastore.h"
#import "FLESingletonModells.h"
#import "FLEUserSession.h"
#import "FLEPeriod.h";


@interface FLECreateLedgerViewController ()

@end

@implementation FLECreateLedgerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createLedgerPressed:(id)sender {
    /* Create a new user of your app */
    FLEUser* user = [FLESingletonModells getUser];
    [user setUserName:self.email];
    [user setPassword:self.password];
    
    FLEUserSession* session = [FLESingletonModells getSession];
    
    /* configure AOMDatastore with user credentials */
    [AOMDatastore configureWithUrl:baseUrl andApiKey:apiKey andUsername:[user userName] andPassword:[user password]];
//    [user saveAsyncWithBlock:^(NSError *error) {
//        if (error) {
//			//TODO: Error handling
//		} else{
//			FLELedger* ledger = [FLESingletonModells getSeLedger];
//			[ledger setName:ledgerField.text];
//			[ledger.participants addObject:user];
//			[ledger saveAsyncWithBlock:^(NSError *errorL) {
//				if (errorL) {
//					NSLog(@"Error while saving Ledger");
//				} else{
//					[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedin"];
//                    session.user = user;
//					//[self dismissViewControllerAnimated:YES completion:nil];
//					[self performSegueWithIdentifier:@"ModalCreateLedgerToLedger" sender:self];
//				}
//
//				
//			}];
//		}
//		
//    }];
    
    
    @try {
        [user save];
        
        FLELedger* ledger = [FLESingletonModells getLedger];
        [ledger setName:ledgerField.text];
        [ledger.participants addObject:user];
		ledger.starttimestamp = [NSDate date];
		
		
        
        @try {
            [ledger save];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedin"];
            session.user = user;
            //[self dismissViewControllerAnimated:YES completion:nil];
			[self performSegueWithIdentifier:@"ModalCreateLedgerToLedger" sender:self];
			            
        }
        @catch (NSException *exception) {
            NSLog(@"Error while saving Ledger");
        }
      
    }
    @catch (NSException *exception) {
        NSLog(@"createLedgerPressed: ERROR while saving User");
    }
 
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if ([segue.identifier isEqualToString:@"ModalLoginToLedger"]) {
		//TODO: nach login bevor ich auf neuen View wechsel perioden des Ledgers laden
		
		//[segue.destinationViewController setDetailItem:period];
	}
}


@end
