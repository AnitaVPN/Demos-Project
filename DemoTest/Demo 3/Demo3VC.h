//
//  Demo3VC.h
//  DemoTest
//
//  Created by Apple on 23/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Demo3VC : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionDiamond;
@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UITableView *tblListing;
@property(strong,nonatomic) UIColor *themeColor;
@property(strong,nonatomic) UIColor *textColor;
@property(strong,nonatomic) UIColor *selectionColor;
@property(strong,nonatomic) UIColor *textSelectedColor;
@property(strong,nonatomic) UIColor *defaultBgColor;
@property(strong,nonatomic) UIColor *defaultBorderColor;

@end
