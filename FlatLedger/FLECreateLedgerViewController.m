//
//  FLECreateLedgerViewController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLECreateLedgerViewController.h"
#import "FLELedger.h"
#import "User.h"
#import "AOMDatastore.h"


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
    User* user = [[User alloc] init];
    [user setUserName:self.email];
    [user setPassword:self.password];
    
    /* configure AOMDatastore with user credentials */
    [AOMDatastore configureWithUrl:baseUrl andApiKey:apiKey andUsername:[user userName] andPassword:[user password]];
    [user save];
    
}


@end
