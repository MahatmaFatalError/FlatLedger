//
//  FLEDetailViewController.h
//  FlatLedger
//
//  Created by Julian Ruppel on 04.01.14.
//  Copyright (c) 2014 Julian Ruppel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLEDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
