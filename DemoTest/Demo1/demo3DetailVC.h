//
//  demo3DetailVC.h
//  DemoTest
//
//  Created by Apple on 24/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "ViewController.h"
#import "SearchModel.h"

@interface demo3DetailVC : ViewController
@property (strong,nonatomic)NSMutableDictionary* dictSelectedValues;
@property(strong,nonatomic) SearchModel *model;
@property (weak, nonatomic) IBOutlet UICollectionView *clsView;
@property (readonly) int section;




@end
