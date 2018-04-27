//
//  Demo4VC.h
//  DemoTest
//
//  Created by Apple on 26/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol updateSelectedValuesDelegate
- (void)updateValues : (int)section withString:(NSString *)str;

@end
@interface Demo4VC : UIViewController
{
    id delegate;

}

- (void) setDelegate:(id)newDelegate;

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


@property (weak, nonatomic) IBOutlet UIView *viewColor;
//@property (weak, nonatomic) IBOutlet UIView *viewHeader;
//@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblHeaderValueName;
@property (weak, nonatomic) IBOutlet UIView *vwLeft;
@property (weak, nonatomic) IBOutlet UIView *vwRight;

@property (weak, nonatomic) IBOutlet UIView *vwFancyColor;
@property (weak, nonatomic) IBOutlet UIView *vwButtonContainer;
@property (weak, nonatomic) IBOutlet UIButton *btnIntencity;
@property (weak, nonatomic) IBOutlet UIButton *btnOvertone;
@property (weak, nonatomic) IBOutlet UIButton *btnColor;

@property (weak, nonatomic) IBOutlet UITableView *tblFancyColor;

-(IBAction)btnIntencityClickEvent:(id)sender;
- (IBAction)btnOverToneClickEvent:(id)sender;
- (IBAction)btnColorEvent:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *vwColorContainer;
@property (weak, nonatomic) IBOutlet UIView *vwFancyClear;
@property (weak, nonatomic) IBOutlet UIButton *btnClear;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;

@property (weak, nonatomic) IBOutlet UIButton *btnClose;
- (IBAction)btnDoneClickEvent:(id)sender;

@end

