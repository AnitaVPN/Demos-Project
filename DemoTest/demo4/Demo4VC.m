//
//  Demo4VC.m
//  DemoTest
//
//  Created by Apple on 26/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "Demo4VC.h"
#import "CollectionViewCell.h"
#import "CollectionHeaderView.h"
#import "cell_price.h"
#import "cell_dimond.h"
#import "cell_demo4.h"
#import "SearchModel.h"
#import "cell_demo4_headerView.h"


//Protocol



@interface Demo4VC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrDimondShape ;
    NSMutableDictionary *dictSelection;
    NSMutableArray *arrKeys;
    NSMutableDictionary *dictSectionValues;
    UIToolbar* keyboardToolbar;
    NSMutableArray *arrColor,*arrClarity,*arrShades,*cut,*Polish,*Symmetry,*FlourSense,*Lab;
    
    BOOL isOverToneSelected,isFancyColorSelected,isColorIntencitySelected;
    NSMutableArray *arrIntencity,*arrFancyColor,*arrOverTone;
    NSMutableDictionary *dictFancyColor;
    NSMutableDictionary *dictSelectionColor;
    
}
@end

@implementation Demo4VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tblFancyColor.delegate = self;
    _tblFancyColor.dataSource = self;
    isColorIntencitySelected = true;
    dictSelectionColor = [[NSMutableDictionary alloc]init];
    
    _vwFancyClear.backgroundColor = _defaultBgColor;
    _btnClear.backgroundColor = _defaultBgColor;
    [_btnClear setTitleColor:_themeColor forState:UIControlStateNormal];
    
    _btnClose.backgroundColor = _themeColor;
    [_btnClose setTitleColor:_defaultBgColor forState:UIControlStateNormal];
    
    _vwColorContainer.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:.7];
    
    arrIntencity = [[NSMutableArray alloc]initWithObjects:@"Brownish",@"Greenish",@"Yelloish",@"Pinkish",@"Purplish",@"grayish",@"Orangeey",@"Reddish", nil];
    arrOverTone = [[NSMutableArray alloc]initWithObjects:@"Faint",@"Very Light",@"Light",@"Fancy Light",@"Fancy",@"Fancy Dark",@"Fancy Intense",@"Fancy Vivid", nil];
    arrFancyColor = [[NSMutableArray alloc]initWithObjects:@"Yellow",@"Pink",@"Blue",@"Red ",@"Fancy",@"Purple",@"Orange",@"Viaolet", nil];
    
    dictFancyColor = [[NSMutableDictionary alloc]init];
    [dictFancyColor setObject:arrIntencity forKey:@"Intencity"];
    [dictFancyColor setObject:arrOverTone forKey:@"Overtone"];
    [dictFancyColor setObject:arrFancyColor forKey:@"Color"];

    isColorIntencitySelected = true;
    [self btnIntencityClickEvent:_btnIntencity];
    
    
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
    self.title = @"Search Feature Demo - 4";
    _vwFancyColor.layer.cornerRadius = 5;
    _vwFancyColor.clipsToBounds = true;
    _vwFancyColor.backgroundColor = _themeColor;
    _vwButtonContainer.backgroundColor = _defaultBgColor;
    _btnColor.backgroundColor = _defaultBgColor;
    _btnOvertone.backgroundColor = _defaultBgColor;
    _btnIntencity.backgroundColor = _themeColor;;
    _tblFancyColor.backgroundColor = [UIColor whiteColor];

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
    if(tableView == _tblFancyColor)
    {
        return 1;
    }
    return arrKeys.count;    //count of section
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if(tableView == _tblFancyColor)
    {
        return 0;
    }
    
    if(section == 7 || section == 3)
        return 60;
    
    return 40;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(tableView == _tblFancyColor)
    {
        NSMutableArray *arr ;
        if(isOverToneSelected)
        {
            arr= [dictFancyColor valueForKey:@"Overtone"];

        }
        else if (isFancyColorSelected)
        {
            arr= [dictFancyColor valueForKey:@"Color"];

        }
        else
        {
            arr= [dictFancyColor valueForKey:@"Intencity"];

        }
        
        return arr.count;
    }
    
    
    if ([[arrKeys objectAtIndex:section] isEqualToString:@"OPTIONS"]) {
        return 0;
    }
    
   // if(section == 0) return 2;
    
    return 1;//[arrKeys count];    //count number of row from counting array hear cataGorry is An Array
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _tblFancyColor)
    {
        NSString *str ;
        
        if(isFancyColorSelected)
        {
            str = @"Color";
        }
        if(isColorIntencitySelected)
        {
            str = @"Intencity";
        }
        if(isOverToneSelected)
        {
            str = @"Overtone";
        }
        
        if([dictSelectionColor.allKeys containsObject:str])
        {
            NSMutableArray *arr = [dictSelectionColor valueForKey:str];
            NSMutableArray *arr1 = [dictFancyColor valueForKey:str];
            if(![arr containsObject: [arr1 objectAtIndex:indexPath.row]])
            {
                [arr addObject:[arr1 objectAtIndex:indexPath.row]];
            }
            else
            {
                [arr removeObject:[arr1 objectAtIndex:indexPath.row]];
            }
                
        }
        else
        {
            NSMutableArray *arr1 = [dictFancyColor valueForKey:str];
            
            NSMutableArray *arrToAdd = [[NSMutableArray alloc]init];
            [arrToAdd addObject:[arr1 objectAtIndex:indexPath.row]];
            [dictSelectionColor setValue:arrToAdd forKey:str];
        }
    }
    
    [_tblFancyColor reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    NSLog(@"------------%@",dictSelectionColor);
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    if(tableView == _tblFancyColor)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:MyIdentifier];
        }
        
        NSMutableArray *arr ;
        NSString *str;
        if(isOverToneSelected)
        {
            str = @"Overtone";
            arr= [dictFancyColor valueForKey:@"Overtone"];
            
        }
        else if (isFancyColorSelected)
        {
            str = @"Color";
            arr= [dictFancyColor valueForKey:@"Color"];
            
        }
        else
        {
            str = @"Intencity";
            arr= [dictFancyColor valueForKey:@"Intencity"];
        }
        
        NSMutableArray *arrSelection = [dictSelectionColor valueForKey:str];
        
        if(arrSelection.count > 0)
        {
            if([arrSelection containsObject:[arr objectAtIndex:indexPath.row]])
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
            
        
        
        
        //NSMutableArray *arr = []
        cell.textLabel.text = [arr objectAtIndex:indexPath.row];
        return cell;
    }
    
    
    cell_demo4 * cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    
    cell.dictSectionValues = dictSectionValues;
    [cell setNotificationObserver];
    [cell.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell_demo4" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [cell.collectionView registerNib:[UINib nibWithNibName:@"cell_price" bundle:nil] forCellWithReuseIdentifier:@"cell_price"];
    cell.section = (int)indexPath.section;
    cell.arrKeys = arrKeys;
//    cell.dele
    cell.textColor = _textColor;
//    [cell setde]
    cell.selectionColor = _selectionColor;
    cell.textSelectedColor = _textSelectedColor;
    cell.defaultBgColor = _defaultBgColor;
    cell.defaultBorderColor = _defaultBorderColor;
    cell.collectionView.delegate = cell;
    cell.collectionView.dataSource = cell;
    [cell.collectionView registerNib:  [UINib nibWithNibName:@"cell_demo4_headerView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cell_demo4_header"];
    
    cell.tag = indexPath.section;
    [self setDelegate:cell];

    if(indexPath.section != 7 )
    {
        cell.collectionView.layer.borderColor = _themeColor.CGColor;
        
        
        if(indexPath.section == 0 && indexPath.row == 1)
        {
            CALayer *border = [CALayer layer];
            CGFloat borderWidth = 1;
            border.borderColor = _themeColor.CGColor;
            border.frame = CGRectMake(0,  cell.collectionView.frame.size.height - borderWidth,  cell.collectionView.frame.size.width,  cell.collectionView.frame.size.height);
            border.borderWidth = borderWidth;
            [ cell.collectionView.layer addSublayer:border];
             cell.collectionView.layer.masksToBounds = YES;
        }
        else
        {
        
            NSLog(@"indexPATH :- %d,%d",indexPath.section,indexPath.row); cell.collectionView.layer.borderWidth = 1;
        }
        
        
    }
    [cell reloadInputViews];
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView == _tblFancyColor) return 40;
    
    if(indexPath.section == 0)
        return 100;
    else
        return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
         return CGFLOAT_MIN;
;
}




-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 0, [UIScreen mainScreen].bounds.size.width, 2)];
    [view setBackgroundColor:[UIColor whiteColor]];
    
   
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:view.frame];
    
    lbl.text = [arrKeys objectAtIndex:section];
    lbl.textColor = _themeColor;
    lbl.textAlignment = NSTextAlignmentCenter;
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
       
        UIView *viewLAB = [[UIView alloc]initWithFrame:CGRectMake((([UIScreen mainScreen].bounds.size.width/2) - 100), 20, 200, 40)];
        
        for (int i = 0; i < arr.count; i++) {
//            UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(i * ([UIScreen mainScreen].bounds.size.width / arr.count), 0, [UIScreen mainScreen].bounds.size.width / arr.count + 2, 40)];
//            [btn setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
//            [btn setBackgroundColor:_themeColor];
//            [btn setAlpha:0.85];
//            btn.tag = 100 + section++;
//            [btn addTarget:self action:@selector(SelectedVALUEs:) forControlEvents:UIControlEventTouchUpInside];
//            //            [btn setbac]
//            if(section == 8)
//            {
//                [btn setAlpha:1.0];
//
//            }
//
//            [btn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:12.0]];
//            [viewLAB addSubview:btn];
            
            
            
            UISegmentedControl *segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"3EX",@"3VG+",@"NO BGM"]];
            //[segmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
            
            segmentControl.tag = 1;
            segmentControl.frame = CGRectMake(0, 0, viewLAB.frame.size.width, 40);
            [segmentControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
            [segmentControl setSelectedSegmentIndex:0];
            [viewLAB addSubview:segmentControl];
            segmentControl.tintColor = [UIColor whiteColor];
            segmentControl.backgroundColor = _themeColor;
            segmentControl.layer.borderWidth = 1;
            viewLAB.layer.borderColor = _themeColor.CGColor;
            
            viewLAB.layer.cornerRadius = 3;
            viewLAB.layer.borderWidth = 1;
            viewLAB.layer.backgroundColor = _themeColor.CGColor;

            viewLAB.clipsToBounds = YES;
            viewLAB.backgroundColor = [UIColor clearColor];
        }
        [view addSubview:viewLAB];
        
    }
    else
    {
        if(section == 3)
        {
            UISegmentedControl *segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"White Color",@"Fancy Color"]];
            segmentControl.tag = 0;
            //[segmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
            segmentControl.frame = CGRectMake((([UIScreen mainScreen].bounds.size.width/2) - 100), 10, 200, 40);
            [segmentControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
            [segmentControl setSelectedSegmentIndex:0];
            [view addSubview:segmentControl];
            segmentControl.tintColor = _themeColor;
            
            view.backgroundColor = [UIColor clearColor];
        }
        else
         [view addSubview:lbl];
    }
    
    
    
    
    
    
    
//    view.backgroundColor = [UIColor whiteColor]; //[UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0];;
//
//    view.layer.cornerRadius = 0.0f;
//    view.layer.borderWidth = 1.0f;
//    view.layer.borderColor = [UIColor clearColor].CGColor;
//    view.layer.masksToBounds = YES;
//
//    view.layer.shadowColor = _themeColor.CGColor;
//    view.layer.shadowOffset = CGSizeMake(0, 2.0f);
//    view.layer.shadowRadius = 2.0f;
//    view.layer.shadowOpacity = 0.5f;
//    view.layer.masksToBounds = NO;
//    view.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:view.layer.cornerRadius].CGPath;
    
    view.backgroundColor = [UIColor whiteColor];
    return view;
    
    
    
    
}

-(void)segmentedControlValueDidChange:(UISegmentedControl *)segment
{
    switch (segment.selectedSegmentIndex) {
        case 0:{
            
            NSString *title = [segment titleForSegmentAtIndex:segment.selectedSegmentIndex];
            
            if(segment.tag == 0)
            {
                _vwColorContainer.hidden = true;

            }
            else
            {
                [self updateValues:segment.selectedSegmentIndex withString:title];
            }
            break;
            
        }
        case 1:{
            
            NSString *title = [segment titleForSegmentAtIndex:segment.selectedSegmentIndex];
            
            
            if(segment.tag == 0)
            {
                _vwColorContainer.hidden = false;
                _vwFancyColor.hidden = false;
                [_tblFancyColor reloadData];
                [_vwColorContainer setHidden:false];
            }
            else
            {
                 [self updateValues:segment.selectedSegmentIndex withString:title];
            }
            
            
           
            
            
            break;
        }
        case 2:{
            NSString *title = [segment titleForSegmentAtIndex:segment.selectedSegmentIndex];
            [self updateValues:segment.selectedSegmentIndex withString:title];
            break;
        }
    }
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

- (void)updateValues : (int)section withString:(NSString *)str
{
//  /  [delegate updateValues:section withString:str];
    
    
    
//    cell.sele
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:str forKey:@"str"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"post" object:dict];
}
- (void) setDelegate:(id)newDelegate{
    delegate = newDelegate;
}

- (IBAction)btnIntencityClickEvent:(id)sender {
    
    isColorIntencitySelected = true;
    isFancyColorSelected = false;
    isOverToneSelected = false;
    
    [_btnIntencity setTitleColor:_defaultBgColor forState:UIControlStateNormal];
     [_btnIntencity setBackgroundColor:_themeColor];
    
    [_btnOvertone setTitleColor:_themeColor forState:UIControlStateNormal];
    [_btnOvertone setBackgroundColor:_defaultBgColor];
    
    
    [_btnColor setTitleColor:_themeColor forState:UIControlStateNormal];
    [_btnColor setBackgroundColor:_defaultBgColor];

    
    
    
    
    _vwFancyColor.frame = CGRectMake(_vwFancyColor.frame.origin.x, _vwFancyColor.frame.origin.y, _vwFancyColor.frame.size.width, (arrIntencity.count * 40) + 60 );
    
    [_tblFancyColor reloadData];
}

- (IBAction)btnOverToneClickEvent:(id)sender {
    isColorIntencitySelected = false;
    isFancyColorSelected = false;
    isOverToneSelected = true;
    
     _vwFancyColor.frame = CGRectMake(_vwFancyColor.frame.origin.x, _vwFancyColor.frame.origin.y, _vwFancyColor.frame.size.width, (arrOverTone.count * 40) + 60);
    
    
    [_btnOvertone setTitleColor:_defaultBgColor forState:UIControlStateNormal];
    [_btnOvertone setBackgroundColor:_themeColor];
    
    [_btnIntencity setTitleColor:_themeColor forState:UIControlStateNormal];
    [_btnIntencity setBackgroundColor:_defaultBgColor];
    
    
    [_btnColor setTitleColor:_themeColor forState:UIControlStateNormal];
    [_btnColor setBackgroundColor:_defaultBgColor];
    
    [_tblFancyColor reloadData];
}

- (IBAction)btnColorEvent:(id)sender {
    isColorIntencitySelected = false;
    isFancyColorSelected = true;
    isOverToneSelected = false;
     _vwFancyColor.frame = CGRectMake(_vwFancyColor.frame.origin.x, _vwFancyColor.frame.origin.y, _vwFancyColor.frame.size.width, (arrFancyColor.count * 40) + 60);
    
    
    [_btnColor setTitleColor:_defaultBgColor forState:UIControlStateNormal];
    [_btnColor setBackgroundColor:_themeColor];
    
    [_btnIntencity setTitleColor:_themeColor forState:UIControlStateNormal];
    [_btnIntencity setBackgroundColor:_defaultBgColor];
    
    
    [_btnOvertone setTitleColor:_themeColor forState:UIControlStateNormal];
    [_btnOvertone setBackgroundColor:_defaultBgColor];
    
    
    
    [_tblFancyColor reloadData];
    
}
- (IBAction)btnDoneClickEvent:(id)sender {
    [_vwColorContainer setHidden:true];
}
@end


