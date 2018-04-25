//
//  TableViewDemoVC.m
//  DemoTest
//
//  Created by Apple on 20/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "TableViewDemoVC.h"
#import "cell_tableview.h"
#import "SearchModel.h"
#import "SearchTableDetailsVC.h"
#import "demo3DetailVC.h"

@interface TableViewDemoVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrKeys;
    NSMutableDictionary *dictSelection;
    NSMutableArray *arrValues;
}
@end

@implementation TableViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrValues = [[NSMutableArray alloc]init];
//    [arrKeys addObject:@"DIAMONDS"];
//    [arrKeys addObject:@"COLOR"];
//    [arrKeys addObject:@"CLARITY"];[arrKeys addObject:@"COLOR SHADE"];[arrKeys addObject:@"CUT"];[arrKeys addObject:@"POLISH"];[arrKeys addObject:@"SYMMETRY"];[arrKeys addObject:@"CARAT"];[arrKeys addObject:@"RICE/CTS"];[arrKeys addObject:@"AMOUNT"];[arrKeys addObject:@"DISCOUNT"];[arrKeys addObject:@"NEW ARRIVAL DATE"];
//
    
  
//
    
    // Do any additional setup after loading the view.
    
    [self SetupModelClass];
    _tblSearch.delegate = self;
    _tblSearch.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [_tblSearch reloadData];

}

-(void)SetupModelClass
{
    
    
        NSMutableArray*  arrDimondShape = [[NSMutableArray alloc]init];
        NSMutableArray*  arrKeys  = [[NSMutableArray alloc] init];
        NSMutableArray*  arrColor = [[NSMutableArray alloc] init];
        NSMutableArray*  arrShades = [[NSMutableArray alloc] init];
        NSMutableArray*  arrClarity = [[NSMutableArray alloc] init];
        
        NSMutableArray *Polish = [[NSMutableArray alloc] init];
        NSMutableArray*   cut = [[NSMutableArray alloc] init];
        NSMutableArray*   Symmetry = [[NSMutableArray alloc] init];
        NSMutableArray*   FlourSense = [[NSMutableArray alloc] init];
        NSMutableArray*   Lab = [[NSMutableArray alloc] init];
        
        for (char a = 'D'; a <= 'Z'; a++)
        {
            [arrColor addObject:[NSString stringWithFormat:@"%c", a]];
        }
        
        //CLARITY
        [arrClarity addObject:@"LC"];[arrClarity addObject:@"FL"];[arrClarity addObject:@"IF"];[arrClarity addObject:@"VVS1"];[arrClarity addObject:@"VVS2"];[arrClarity addObject:@"VS1"] ;[arrClarity addObject:@"VS2"];[arrClarity addObject:@"SI1"];[arrClarity addObject:@"SI2"];[arrClarity addObject:@"SI1"];[arrClarity addObject:@"I1"];
        [arrClarity addObject:@"I2"];[arrClarity addObject:@"I3"];
        
        //COLOR SHADE
        [arrShades addObject:@"WH"];[arrShades addObject:@"YL"];[arrShades addObject:@"NV"];[arrShades addObject:@"BRNO"];[arrShades addObject:@"BRN1"];[arrShades addObject:@"BRN2"] ;[arrShades addObject:@"BRN3"];[arrShades addObject:@"GRAY"];[arrShades addObject:@"GRN"];[arrShades addObject:@"PINK"];[arrShades addObject:@"FANCY"];
        [arrShades addObject:@"GRE"];[arrShades addObject:@"N"];
        
        //CUT
        [cut addObject:@"EX"];[cut addObject:@"VG"];[cut addObject:@"GD"];[cut addObject:@"F"];
        
        //Polish
        [Polish addObject:@"EX"];[Polish addObject:@"VG"];[Polish addObject:@"GD"];
        
        //Symmetry
        [Symmetry addObject:@"EX"];[Symmetry addObject:@"VG"];[Symmetry addObject:@"GD"];[Symmetry addObject:@"F"];
        
        //Flourance
        [FlourSense addObject:@"N"];[FlourSense addObject:@"F"];[FlourSense addObject:@"VSL"];[FlourSense addObject:@"M"];
    
  
        arrDimondShape = [[NSMutableArray alloc]initWithObjects:@"Round",@"Heart",@"Princess",@"Oval",@"Marquise",@"Pear",@"Cushion",@"Radient" ,nil];
        
        
        NSMutableDictionary*  dictSectionValues = [[NSMutableDictionary alloc]init];
    
    [dictSectionValues setValue:arrDimondShape forKey:@"Shape"];
    [dictSectionValues setValue:arrColor forKey:@"Color"];
    [dictSectionValues setValue:arrClarity forKey:@"Clarity"];
    [dictSectionValues setValue:[[NSMutableArray alloc]initWithObjects:@"India",@"Pakistan",@"USA",@"UAE", nil] forKey:@"Country"];
    [dictSectionValues setValue:cut forKey:@"Gradding Lab"];
    [dictSectionValues setValue:[[NSMutableArray alloc]initWithObjects:@"Good",@"Medium",@"Very Good",@"Excellent", nil] forKey:@"Make"];
    [dictSectionValues setValue:FlourSense forKey:@"Flourance Intencity"];
    [dictSectionValues setValue:arrShades forKey:@"Color Shade"];
        [dictSectionValues setValue:Polish forKey:@"Polish"];
        [dictSectionValues setValue:Symmetry forKey:@"Symmetry"];
        
        
        for (int i = 0; i <  dictSectionValues.count ; i++)
        {
            SearchModel *model = [[SearchModel alloc]init];
            model.strKeyName = dictSectionValues.allKeys[i];
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            arr = [dictSectionValues valueForKey:dictSectionValues.allKeys[i]];
            NSMutableDictionary *dict ;
            dict = [[NSMutableDictionary alloc]init];

            for (int j=0 ; j < arr.count; j++) {
//                [dict setValue:@"f" forKey:[arr objectAtIndex:j]];
                
                [dict  setValue:[NSNumber numberWithInt:0] forKey:[arr objectAtIndex:j]];
                
            }
            model.dictValues = dict;
            [arrValues addObject:model];
        }
    
        
        NSLog(@"COUNT FOR MODEL ARRAY IS %lu",(unsigned long)arrValues.count);
        
        
        
        
        //model.dictValues =
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark  - TableView delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [arrValues count];    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    cell_tableview *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[cell_tableview alloc] initWithStyle:UITableViewCellStyleDefault
            reuseIdentifier:MyIdentifier];
    }
    
    SearchModel *model = [arrValues objectAtIndex:indexPath.row];
    cell.lblKey.text = model.strKeyName;
    
    if(model.strSelectedValues.length != 0)
    {
        cell.lblselectedValue.hidden  = false;
        cell.lblselectedValue.text = model.strSelectedValues;
    }
    else
    {
        cell.lblselectedValue.hidden  = true;
        cell.lblselectedValue.text = model.strSelectedValues;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
//    SearchTableDetailsVC *vc = [[SearchTableDetailsVC alloc]initWithNibName:@"SearchTableDetailsVC" bundle:nil];
//    vc.model = [arrValues objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:vc animated:true];
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    demo3DetailVC *myNewVC = (demo3DetailVC *)[storyboard instantiateViewControllerWithIdentifier:@"demo3DetailVC"];
    myNewVC.model = [arrValues objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:myNewVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
    
}
@end
