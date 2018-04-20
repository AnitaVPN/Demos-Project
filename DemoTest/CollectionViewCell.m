//
//  CollectionViewCell.m
//  DemoTest
//
//  Created by Apple on 20/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
@synthesize lblValues;

- (void)awakeFromNib {
    [super awakeFromNib];

    lblValues.layer.cornerRadius = 3;
    lblValues.layer.borderColor = [UIColor blueColor].CGColor;
    lblValues.layer.borderWidth = 1;
    lblValues.clipsToBounds = true;

}

@end
