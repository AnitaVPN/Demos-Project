//
//  cell_demo4.h
//  DemoTest
//
//  Created by Apple on 26/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Demo4VC.h"

@interface cell_demo4 : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource,updateSelectedValuesDelegate>


@property int section;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) NSMutableArray *arrKeys;
@property (weak, nonatomic) UIColor *textColor;
-(void)setNotificationObserver;

@property (weak, nonatomic) UIColor *selectionColor;
@property(strong,nonatomic) UIColor *textSelectedColor;

@property(strong,nonatomic) NSMutableDictionary *dictSelection;

@property(strong,nonatomic) UIColor *defaultBgColor;
@property(strong,nonatomic) UIColor *defaultBorderColor;

@property (weak, nonatomic) NSMutableDictionary *dictSectionValues;
//-(id)initWithName:(NSMutableDictionary *)dict :(cell_demo3 *)cell;

@end

