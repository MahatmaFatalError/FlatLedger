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
#import "FLEPeriod.h"
#import "Datastore.h"


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

    [DataStore configureWithUser:user];
    
    
    @try {
        
        //[userAOM save];
        [user save]; //DIESES VERFICKTE USER SAVE MACHT MIR DAS LOGIN userAOM loadMe kaputt
        // sobald eine normaler FLEUSer da ist, kann ich den normalen user nicht mehr laden
        // negativtest umgekehrt steht noch aus
        
        FLELedger* ledger = [FLESingletonModells getLedger];
        [ledger setName:ledgerField.text];
		ledger.starttimestamp = [NSDate date];
        
		//[ledger.participants addObject:user];

        @try {
            [ledger save];
            [user postLedger:ledger];
            [ledger postParticipants:user];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedin"];
            FLEUserSession* session = [FLESingletonModells getSession];
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




@end
