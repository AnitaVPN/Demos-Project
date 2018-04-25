//
//  SearchTableDetailsVC.m
//  DemoTest
//
//  Created by Apple on 21/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "SearchTableDetailsVC.h"
#import "cell_tableview.h"
#import "SearchModel.h"

@interface SearchTableDetailsVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrValues;
    NSMutableArray *arrModels;

}
@end

@implementation SearchTableDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _tblSearchSelection.delegate = self;
    _tblSearchSelection.dataSource = self;
    self.title = _model.strKeyName;

}

-(void)viewWillAppear:(BOOL)animated
{
    //[self setModelArray];
    [_tblSearchSelection reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
     NSArray *filteredData = [_model.dictValues.allValues filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF == %d", 1]];
    
  

    
    
    if(filteredData.count <= 0)
    {
        _model.strSelectedValues =   @"";
        
    }
    else
    {
        NSSet *keys = [_model.dictValues keysOfEntriesPassingTest:^BOOL(id key, id obj, BOOL *stop) {
            return [filteredData containsObject:obj];
        }];
        NSLog(@"%@", keys.description);
        
        _model.strSelectedValues =   [[keys allObjects] componentsJoinedByString:@" , "];;
    }
    
    
    NSLog(@"_MODEL CLASS %@",_model.dictValues);
}

//-(void)setModelArray
//{
//
//  NSMutableArray*  arrDimondShape = [[NSMutableArray alloc]init];
//  NSMutableArray*  arrKeys  = [[NSMutableArray alloc] init];
//  NSMutableArray*  arrColor = [[NSMutableArray alloc] init];
//  NSMutableArray*  arrShades = [[NSMutableArray alloc] init];
//  NSMutableArray*  arrClarity = [[NSMutableArray alloc] init];
//
//    NSMutableArray *Polish = [[NSMutableArray alloc] init];
// NSMutableArray*   cut = [[NSMutableArray alloc] init];
// NSMutableArray*   Symmetry = [[NSMutableArray alloc] init];
// NSMutableArray*   FlourSense = [[NSMutableArray alloc] init];
// NSMutableArray*   Lab = [[NSMutableArray alloc] init];
//
//    for (char a = 'D'; a <= 'Z'; a++)
//    {
//        [arrColor addObject:[NSString stringWithFormat:@"%c", a]];
//    }
//
//    //CLARITY
//    [arrClarity addObject:@"LC"];[arrClarity addObject:@"FL"];[arrClarity addObject:@"IF"];[arrClarity addObject:@"VVS1"];[arrClarity addObject:@"VVS2"];[arrClarity addObject:@"VS1"] ;[arrClarity addObject:@"VS2"];[arrClarity addObject:@"SI1"];[arrClarity addObject:@"SI2"];[arrClarity addObject:@"SI1"];[arrClarity addObject:@"I1"];
//    [arrClarity addObject:@"I2"];[arrClarity addObject:@"I3"];
//
//    //COLOR SHADE
//    [arrShades addObject:@"WH"];[arrShades addObject:@"YL"];[arrShades addObject:@"NV"];[arrShades addObject:@"BRNO"];[arrShades addObject:@"BRN1"];[arrShades addObject:@"BRN2"] ;[arrShades addObject:@"BRN3"];[arrShades addObject:@"GRAY"];[arrShades addObject:@"GRN"];[arrShades addObject:@"PINK"];[arrShades addObject:@"FANCY"];
//    [arrShades addObject:@"GRE"];[arrShades addObject:@"N"];
//
//    //CUT
//    [cut addObject:@"EX"];[cut addObject:@"VG"];[cut addObject:@"GD"];[cut addObject:@"F"];
//
//    //Polish
//    [Polish addObject:@"EX"];[Polish addObject:@"VG"];[Polish addObject:@"GD"];
//
//    //Symmetry
//    [Symmetry addObject:@"EX"];[Symmetry addObject:@"VG"];[Symmetry addObject:@"GD"];[Symmetry addObject:@"F"];
//
//    //Flourance
//    [FlourSense addObject:@"N"];[FlourSense addObject:@"F"];[FlourSense addObject:@"VSL"];[FlourSense addObject:@"M"];
//
//
//  NSMutableDictionary*  dictSectionValues = [[NSMutableDictionary alloc]init];
//    [dictSectionValues setValue:arrColor forKey:@"COLOR"];
//    [dictSectionValues setValue:arrClarity forKey:@"CLARITY"];
//    [dictSectionValues setValue:arrShades forKey:@"COLOR SHADE"];
//    [dictSectionValues setValue:cut forKey:@"CUT"];
//    [dictSectionValues setValue:Polish forKey:@"POLISH"];
//    [dictSectionValues setValue:Symmetry forKey:@"SYMMETRY"];
//
//
//    for (int i = 0; i <  dictSectionValues.count ; i++)
//    {
//        SearchModel *model = [[SearchModel alloc]init];
//        model.strKeyName = dictSectionValues.allKeys[i];
//        NSMutableArray *arr = [[NSMutableArray alloc]init];
//        arr = [dictSectionValues valueForKey:dictSectionValues.allKeys[i]];
//        NSMutableDictionary *dict ;
//        for (int j=0 ; j < 1; j++) {
//            dict = [[NSMutableDictionary alloc]init];
//            [dict setValue:false forKey:[arr objectAtIndex:j]];
//        }
//        model.dictValues = dict;
//        [arrValues addObject:model];
//    }
//
//    NSLog(@"COUNT FOR MODEL ARRAY IS %lu",(unsigned long)arrValues.count);
//
//
//
//
//    //model.dictValues =
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark  - TableView delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _model.dictValues.allKeys.count;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:MyIdentifier];
    }
    
    
    
    cell.textLabel.text = _model.dictValues.allKeys[indexPath.section];
    
    if([_model.strKeyName isEqualToString:@"Shape"])
    {
        cell.imageView.image = [UIImage imageNamed:_model.dictValues.allKeys[indexPath.section]];
        cell.imageView.layer.cornerRadius = 5;
        cell.imageView.clipsToBounds = true;
        cell.imageView.backgroundColor = [UIColor lightGrayColor];
    
    }
    
//    c
    if([_model.dictValues.allValues[indexPath.section] intValue] != 0)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
   // NSMutableDictionary *dict = [_model.dict//];
    
    NSNumber * value =  [NSNumber numberWithInt:![_model.dictValues.allValues[indexPath.section] intValue]];
    
     [_model.dictValues setValue:value forKey:_model.dictValues.allKeys[indexPath.section]];
    
     [_tblSearchSelection reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
   


//    NSString * result = [[array valueForKey:@"description"] componentsJoinedByString:@""];

    
   
    
//    [[_model.dictValues.allValues
//setValue:value forKey:_model.dictValues.allKeys[indexPath.row]]];
    
   
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40;
    
}
@end


