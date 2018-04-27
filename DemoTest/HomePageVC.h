//
//  HomePageVC.h
//  DemoTest
//
//  Created by Apple on 23/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageVC : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *demo2;
@property (weak, nonatomic) IBOutlet UIButton *demo1;
@property (weak, nonatomic) IBOutlet UIButton *demo3;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segCntrl;
- (IBAction)segementSelectionEvent:(id)sender;

@end
