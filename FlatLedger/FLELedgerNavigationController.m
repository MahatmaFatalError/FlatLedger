//
//  FLELedgerNavigationController.m
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import "FLELedgerNavigationController.h"

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
    //[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLoggedin"];
	// Do any additional setup after loading the view.
    
}
- (void)viewDidAppear:(BOOL)animated{
    
    //TODO: weiche einbauen: Keychain abfrage, wenn eintrag gefunden, dann direkt new expense, sonst login
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLoggedin"]) {
        //[self performSegueWithIdentifier:@"PushLedgerToPeriod" sender:self];
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
