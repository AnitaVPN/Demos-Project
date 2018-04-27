//
//  ViewController.m
//  DemoTest
//
//  Created by Apple on 19/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "Demo3VC.h"
#import "CollectionViewCell.h"
#import "CollectionHeaderView.h"
#import "cell_price.h"
#import "cell_dimond.h"
#import "cell_demo3.h"
#import "SearchModel.h"



@interface Demo3VC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrDimondShape ;
    NSMutableDictionary *dictSelection;
    NSMutableArray *arrKeys;
    NSMutableDictionary *dictSectionValues;
    UIToolbar* keyboardToolbar;
    NSMutableArray *arrColor,*arrClarity,*arrShades,*cut,*Polish,*Symmetry,*FlourSense,*Lab;
}
@end

@implementation Demo3VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpData];
    
//    [arrDimondShape addObject:@"one"];
//    [arrDimondShape addObject:@"two"];
//    [arrDimondShape addObject:@"three"];
//    [arrDimondShape addObject:@"four"];
//    [arrDimondShape addObject:@"five"];
//    [arrDimondShape addObject:@"six"];
//    [arrDimondShape addObject:@"seven"];
//    [arrDimondShape addObject:@"eight"];
    
     arrDimondShape = [[NSMutableArray alloc]initWithObjects:@"Round",@"Princess",@"Oval",@"Marquise",@"Pear",@"Cushion",@"Radient" ,nil];
    
    [dictSectionValues setValue:arrDimondShape forKey:@"SHAPE"];
    
    
    
    
    dictSelection = [[NSMutableDictionary alloc]init];
    
    self.tblListing.delegate  = self;
    self.tblListing.dataSource = self;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Search Feature Demo - 2";
}

-(void)setUpData
{
    
    arrDimondShape = [[NSMutableArray alloc]init];
    arrKeys  = [[NSMutableArray alloc] init];
    arrColor = [[NSMutableArray alloc] init];
    arrShades = [[NSMutableArray alloc] init];
    arrClarity = [[NSMutableArray alloc] init];
    arrDimondShape = [[NSMutableArray alloc] init];
    Polish = [[NSMutableArray alloc] init];
    cut = [[NSMutableArray alloc] init];
    Symmetry = [[NSMutableArray alloc] init];
    FlourSense = [[NSMutableArray alloc] init];
    Lab = [[NSMutableArray alloc] init];
    
    NSMutableArray *sizeGroup = [[NSMutableArray alloc] initWithObjects:@"30s",@"40s",@"50s-60s",@"70s-80s",@"90s",@"1ct",@"1.5ct",@"2ct",@"3ct-4ct",@"5ct+", nil];
    
    
    for (char a = 'D'; a <= 'Z'; a++)
    {
        if(a == 'O')
        {
            [arrColor addObject:[NSString stringWithFormat:@"%@", @"O-P"]];
            [arrColor addObject:[NSString stringWithFormat:@"%@", @"Q-R"]];
            [arrColor addObject:[NSString stringWithFormat:@"%@", @"S-T"]];
            
            [arrColor addObject:[NSString stringWithFormat:@"%@", @"U-V"]];
            [arrColor addObject:[NSString stringWithFormat:@"%@", @"W-X"]];
            [arrColor addObject:[NSString stringWithFormat:@"%@", @"Y-Z"]];
            [arrColor addObject:[NSString stringWithFormat:@"%@", @"FANCY"]];
            

            break;
        }
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
    [FlourSense addObject:@"ALL"];
    [FlourSense addObject:@"NONE"];
    [FlourSense addObject:@"FNT"];
    [FlourSense addObject:@"MED"];
    [FlourSense addObject:@"SIG"];
    [FlourSense addObject:@"USIG"];

    
    NSMutableArray *arrLAB = [[NSMutableArray alloc]initWithObjects:@"GIA",@"IGI",@"HRD",@"NONE", nil];
    
    dictSectionValues = [[NSMutableDictionary alloc]init];
    [dictSectionValues setValue:sizeGroup forKey:@"SIZE GROUP"];
    [dictSectionValues setValue:arrColor forKey:@"COLOR"];
    [dictSectionValues setValue:arrClarity forKey:@"CLARITY"];
     [dictSectionValues setValue:FlourSense forKey:@"FLOURESENCE"];
//    [dictSectionValues setValue:arrShades forKey:@"COLOR SHADE"];
    [dictSectionValues setValue:cut forKey:@"CUT"];
    [dictSectionValues setValue:Polish forKey:@"POLISH"];
      [dictSectionValues setValue:arrLAB forKey:@"LAB"];
    [dictSectionValues setValue:Symmetry forKey:@"SYMMETRY"];
    
    
    
    NSMutableArray *arrtest = [[NSMutableArray alloc]init];
    [dictSectionValues setValue:arrtest forKey:@"CARAT"];
//    [dictSectionValues setValue:arrtest forKey:@"PRICE/CTS"];
//    [dictSectionValues setValue:arrtest forKey:@"AMOUNT"];
//    [dictSectionValues setValue:arrtest forKey:@"DISCOUNT"];
//    [dictSectionValues setValue:arrtest forKey:@"NEW ARRIVAL DATE"];
    
    
    [arrKeys addObject:@"SHAPE"];
    [arrKeys addObject:@"CARAT"];
    [arrKeys addObject:@"SIZE GROUP"];
    [arrKeys addObject:@"COLOR"];
    [arrKeys addObject:@"CLARITY"];
    [arrKeys addObject:@"FLOURESENCE"];
    [arrKeys addObject:@"LAB"];
    [arrKeys addObject:@"OPTIONS"];
    [arrKeys addObject:@"CUT"];[arrKeys addObject:@"POLISH"];[arrKeys addObject:@"SYMMETRY"];
    
//    [arrKeys addObject:@"RICE/CTS"];[arrKeys addObject:@"AMOUNT"];[arrKeys addObject:@"DISCOUNT"];[arrKeys addObject:@"NEW ARRIVAL DATE"];
    
}


#pragma mark  - TableView delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return arrKeys.count;    //count of section
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if ([[arrKeys objectAtIndex:section] isEqualToString:@"OPTIONS"]) {
        return 0;
    }
    
    return 1;//[arrKeys count];    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    cell_demo3 * cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    
    cell.dictSectionValues = dictSectionValues;
    
    [cell.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [cell.collectionView registerNib:[UINib nibWithNibName:@"cell_price" bundle:nil] forCellWithReuseIdentifier:@"cell_price"];
    cell.section = (int)indexPath.section;
    cell.arrKeys = arrKeys;
    cell.textColor = _textColor;
    cell.selectionColor = _selectionColor;
    cell.textSelectedColor = _textSelectedColor;
    cell.defaultBgColor = _defaultBgColor;
    cell.defaultBorderColor = _defaultBorderColor;
    cell.collectionView.delegate = cell;
    cell.collectionView.dataSource = cell;
    cell.tag = indexPath.section;
    [cell reloadInputViews];
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0)
    return 120;
    else
        return 60;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:view.frame];
    
    lbl.text = [arrKeys objectAtIndex:section];
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12.0];
    
    if(section ==9  || section == 10 || section == 8 )
    {
        
        [view setAlpha:0.85];
        
//       UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 40)];
//
//        view1.backgroundColor = [UIColor darkGrayColor];
//        [view1 addSubview:lbl];

//        [view addSubview:view1];
//
//        return view;
//
    }
    
    
   
    
    if([[arrKeys objectAtIndex:section] isEqualToString:@"OPTIONS"])
    {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"3EX",@"3VG+",@"NO BGM", nil];
        UIView *viewLAB = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        
        for (int i = 0; i < arr.count; i++) {
            UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(i * ([UIScreen mainScreen].bounds.size.width / arr.count), 0, [UIScreen mainScreen].bounds.size.width / arr.count + 2, 40)];
            [btn setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
            [btn setBackgroundColor:_themeColor];
            [btn setAlpha:0.85];
            btn.tag = 100 + section++;
            [btn addTarget:self action:@selector(SelectedVALUEs:) forControlEvents:UIControlEventTouchUpInside];
//            [btn setbac]
            if(section == 8)
            {
                [btn setAlpha:1.0];

            }
            
            [btn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:12.0]];
            [viewLAB addSubview:btn];
            viewLAB.backgroundColor = [UIColor lightGrayColor];
        }
        [view addSubview:viewLAB];

    }
    else
    {
        [view addSubview:lbl];
    }
    
    
    
    
    
    
    
    view.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0];;
    
    view.layer.cornerRadius = 0.0f;
    view.layer.borderWidth = 1.0f;
    view.layer.borderColor = [UIColor clearColor].CGColor;
    view.layer.masksToBounds = YES;
    
    view.layer.shadowColor = _themeColor.CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 2.0f);
    view.layer.shadowRadius = 2.0f;
    view.layer.shadowOpacity = 0.5f;
    view.layer.masksToBounds = NO;
    view.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:view.layer.cornerRadius].CGPath;
    
    view.backgroundColor = _themeColor;
    return view;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SelectedVALUEs:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    [btn setBackgroundColor:_themeColor];
    [btn setAlpha:1.0];
    
    if(btn.tag == 107)
    {
        UIButton *btn = [self.view viewWithTag:100 + 8];
        [btn setBackgroundColor:_themeColor];
        [btn setAlpha:0.65];
        
        UIButton *btn1 = [self.view viewWithTag:100 + 9];
        [btn1 setBackgroundColor:_themeColor];
        [btn1 setAlpha:0.65];
    }
    if(btn.tag == 108)
    {
        UIButton *btn = [self.view viewWithTag:100 + 9];
        [btn setBackgroundColor:_themeColor];
        [btn setAlpha:0.65];
        
        UIButton *btn1 = [self.view viewWithTag:100 +7];
        [btn1 setBackgroundColor:_themeColor];
        [btn1 setAlpha:0.65];
    }
    if(btn.tag == 109)
    {
        UIButton *btn = [self.view viewWithTag:100 + 7];
        [btn setBackgroundColor:_themeColor];
        [btn setAlpha:0.65];
        
        UIButton *btn1 = [self.view viewWithTag:100 + 8];
        [btn1 setBackgroundColor:_themeColor];
        [btn1 setAlpha:0.65];
    }
    
    
    
}


@end

