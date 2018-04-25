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

@interface HomePageVC ()

@end

@implementation HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
self.title = @"Narola Groups Search Feature Demos";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ClickOnDemo1:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *myNewVC = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:myNewVC animated:YES];
}

- (IBAction)clickOnDemo2:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Demo3VC *myNewVC = (Demo3VC *)[storyboard instantiateViewControllerWithIdentifier:@"Demo3VC"];
    [self.navigationController pushViewController:myNewVC animated:YES];
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

@end
