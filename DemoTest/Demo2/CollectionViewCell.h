//
//  CollectionViewCell.h
//  DemoTest
//
//  Created by Apple on 20/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblValues;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UIView *view_Sep;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@end
