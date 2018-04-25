//
//  SearchTableDetailsVC.h
//  DemoTest
//
//  Created by Apple on 21/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchModel.h"

@interface SearchTableDetailsVC : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblSearchSelection;
@property (strong,nonatomic)NSMutableDictionary* dictSelectedValues;
@property(strong,nonatomic) SearchModel *model;

@end
