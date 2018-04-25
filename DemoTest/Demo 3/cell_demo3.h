//
//  cell_demo3.h
//  DemoTest
//
//  Created by Apple on 23/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell_demo3 : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>


@property int section;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) NSMutableArray *arrKeys;
@property (weak, nonatomic) NSMutableDictionary *dictSectionValues;
-(id)initWithName:(NSMutableDictionary *)dict :(cell_demo3 *)cell;

@end
