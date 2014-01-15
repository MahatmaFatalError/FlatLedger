//
//  FLELedgerNavigationController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLELedgerNavigationController.h"
#import "Datastore.h"
#import "FLESingletonModells.h"
#import "FLEUserSession.h"

@interface FLELedgerNavigationController ()

@end

@implementation FLELedgerNavigationController

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

   }

- (void)viewDidAppear:(BOOL)animated{
    FLEUser* user = [FLESingletonModells getUser];
	FLEUserSession *session = [FLESingletonModells getSession];
	
	
	//TODO: Keychain auslesen um autologin zu machen
	if ([session.user isEqual:user] &  [[NSUserDefaults standardUserDefaults] boolForKey:@"isLoggedin"] ) {
		//[self performSegueWithIdentifier:@"PushDirectOnLogonToNewExpense" sender:self]; Sague kann man so nicht nehmen
	} else{
		[self performSegueWithIdentifier:@"ModalToLogin" sender:self];
	}

	
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
