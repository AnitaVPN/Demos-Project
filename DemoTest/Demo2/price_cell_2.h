//
//  price_cell_2.h
//  DemoTest
//
//  Created by Apple on 24/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRangeSlider.h"

@interface price_cell_2 : UICollectionViewCell<TTRangeSliderDelegate>
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCurrency;
@property (weak, nonatomic) IBOutlet UIView *vw_cell_2;
@property (weak, nonatomic) IBOutlet UIView *vw_cell_3;
@property (weak, nonatomic) IBOutlet UITextField *txt3_from;
@property (weak, nonatomic) IBOutlet UITextField *txt3_to;

@property (weak, nonatomic) IBOutlet UITextField *txt2_from;
@property (weak, nonatomic) IBOutlet UITextField *txt2_to;

@property (weak, nonatomic) IBOutlet UISlider *slider_from;

@property (weak, nonatomic) IBOutlet UISlider *slider_to;

@property (weak, nonatomic) IBOutlet UITextField *txt4_from;
@property (weak, nonatomic) IBOutlet UITextField *txt4_to;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_from;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_to;
-(void)setupSlider;
@property(strong,nonatomic)UIColor *themeColor;
@end
