//
//  HomePageVC.m
//  DemoTest
//
//  Created by Apple on 23/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "HomePageVC.h"
#import "ViewController.h"
#import "TableViewDemoVC.h"
#import "Demo3VC.h"
#import "Demo4VC.h"

@interface HomePageVC ()
{
    BOOL isThemeBased;
    UIColor *defaultbg,*defaultSelected,*defaultTextColor,*selectedTextColor,*defaultBorderColor,*SelectedBorderColor,*themeColor;
}
@end

@implementation HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    defaultbg = [UIColor whiteColor];
//    defaultSelected = [UIColor blackColor];
//    selectedTextColor = [UIColor whiteColor];
//    defaultTextColor = [UIColor blackColor];
//    defaultBorderColor = [UIColor blackColor];
//    SelectedBorderColor = [UIColor whiteColor];
//    themeColor = [UIColor blackColor];
    
    
   defaultbg = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0];
    
    defaultBorderColor = [UIColor darkGrayColor];//[UIColor colorWithRed:72.0/255.0 green:71.0/255.0 blue:115.0/255.0 alpha:1.0];
    
   SelectedBorderColor = [UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0];
    
    defaultTextColor = [UIColor darkGrayColor];//[UIColor colorWithRed:72.0/255.0 green:71.0/255.0 blue:115.0/255.0 alpha:1.0];
   selectedTextColor = [UIColor whiteColor];
    
   themeColor = [UIColor lightGrayColor]; //[UIColor colorWithRed:72.0/255.0 green:71.0/255.0 blue:115.0/255.0 alpha:1.0];
    
    
    
self.title = @"Narola Groups Search Feature Demos";
}

-(void)viewWillAppear:(BOOL)animated
{
    _demo1.layer.cornerRadius = 5;
    _demo1.clipsToBounds = true;
    _demo2.layer.cornerRadius = 5;
    _demo2.clipsToBounds = true;
    _demo3.layer.cornerRadius = 5;
    _demo3.clipsToBounds = true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ClickOnDemo1:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    if(isThemeBased)
    {
        vc.defaultBgColor = defaultbg;
        vc.selectionColor = themeColor;
        vc.defaultBorderColor = defaultBorderColor;
        vc.textColor = defaultTextColor;
        vc.textSelectedColor = selectedTextColor;
        vc.themeColor = themeColor;
    }
    else
    {
        
        vc.defaultBgColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0];
        
        vc.selectionColor = [UIColor darkGrayColor];//[UIColor colorWithRed:72.0/255.0 green:71.0/255.0 blue:115.0/255.0 alpha:1.0];
        
        vc.defaultBorderColor = [UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0];
        
        vc.textColor = [UIColor darkGrayColor];//[UIColor colorWithRed:72.0/255.0 green:71.0/255.0 blue:115.0/255.0 alpha:1.0];
        vc.textSelectedColor = [UIColor whiteColor];
        
        vc.themeColor = [UIColor lightGrayColor]; //[UIColor colorWithRed:72.0/255.0 green:71.0/255.0 blue:115.0/255.0 alpha:1.0];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)clickOnDemo2:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    Demo4VC *vc = (Demo4VC *)[storyboard instantiateViewControllerWithIdentifier:@"Demo4VC"];
    
    if(isThemeBased)
    {
        vc.defaultBgColor = defaultbg;
        vc.selectionColor = themeColor;
        vc.defaultBorderColor = defaultBorderColor;
        vc.textColor = defaultTextColor;
        vc.textSelectedColor = selectedTextColor;
        vc.themeColor = themeColor;
    }
    else
    {
        
        vc.defaultBgColor = [UIColor colorWithRed:230.0/255 green:247.0/255 blue:255.0/255 alpha:1.0];
        
        
       
        vc.selectionColor = [UIColor colorWithRed:179.0/255.0 green:230.0/255.0 blue:255.0/255.0 alpha:1.0];
        
        vc.themeColor =  [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:179.0/255.0 alpha:1.0];
        
        
        vc.defaultBorderColor = [UIColor colorWithRed:0.0/255.0 green:139.0/255.0 blue:204.0/255.0 alpha:1.0];
        
        vc.textColor = [UIColor blackColor];
        vc.textSelectedColor = [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:179.0/255.0 alpha:1.0];
        
//        vc.themeColor =  [UIColor colorWithRed:72.0/255.0 green:71.0/255.0 blue:115.0/255.0 alpha:1.0];
    }
    
    
    
    

    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)clickOnDemo3:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TableViewDemoVC *myNewVC = (TableViewDemoVC *)[storyboard instantiateViewControllerWithIdentifier:@"TableViewDemoVC"];
    [self.navigationController pushViewController:myNewVC animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segementSelectionEvent:(id)sender {

    isThemeBased = !isThemeBased;
    NSLog(@"Clicked");

}
@end
