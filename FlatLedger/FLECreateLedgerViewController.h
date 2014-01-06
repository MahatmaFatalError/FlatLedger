//
//  FLECreateLedgerViewController.h
//  FlatLedger
//
//  Created by Julian Ruppel on 06.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLECreateLedgerViewController : UIViewController{
    IBOutlet UITextField* ledgerField;
}

@property NSString* email;
@property NSString* password;

@end
