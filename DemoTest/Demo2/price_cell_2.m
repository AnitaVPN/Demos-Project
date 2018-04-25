//
//  price_cell_2.m
//  DemoTest
//
//  Created by Apple on 24/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "price_cell_2.h"

@implementation price_cell_2
@synthesize rangeSliderCurrency;


-(void)setupSlider
{
    self.rangeSliderCurrency.delegate = self;
    self.rangeSliderCurrency.minValue = 50;
    self.rangeSliderCurrency.maxValue = 150;
    self.rangeSliderCurrency.selectedMinimum = 50;
    self.rangeSliderCurrency.selectedMaximum = 150;
   // self.rangeSliderCurrency.handleColor = [UIColor greenColor];
    self.rangeSliderCurrency.handleDiameter = 30;
    self.rangeSliderCurrency.selectedHandleDiameterMultiplier = 2;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    self.rangeSliderCurrency.numberFormatterOverride = formatter;
}

#pragma mark : Delegate method

- (IBAction)currencySlider:(id)sender {
}
@end
