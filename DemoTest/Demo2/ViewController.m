//

//  ViewController.m

//  DemoTest

//

//  Created by Apple on 19/04/18.

//  Copyright © 2018 VPN. All rights reserved.

//



#import "ViewController.h"

#import "CollectionViewCell.h"

#import "CollectionHeaderView.h"

#import "cell_price.h"

#import "cell_dimond.h"

#import "price_cell_2.h"

#import "TTRangeSlider.h"



@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,TTRangeSliderDelegate>

{
    
    NSMutableArray *arrDimondShape ;
    
    NSMutableDictionary *dictSelection;
    
    NSMutableArray *arrKeys;
    
    NSMutableDictionary *dictSectionValues;
    
    UIToolbar* keyboardToolbar;
    
    NSMutableArray *arrColor,*arrClarity,*arrShades,*cut,*Polish,*Symmetry,*FlourSense,*Lab;
    
}

@end



@implementation ViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
    [self setUpData];
    
    
    
    arrDimondShape = [[NSMutableArray alloc]initWithObjects:@"Round",@"Princess",@"Oval",@"Marquise",@"Pear",@"Cushion",@"Radient" ,nil];
    
    
    
    [dictSectionValues setValue:arrDimondShape forKey:@"DIAMONDS"];
    
    
    
    
    
    
    
    
    
    dictSelection = [[NSMutableDictionary alloc]init];
    
    
    
    self.collectionView.delegate  = self;
    
    self.collectionView.dataSource = self;
    
    
    
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
    
    //    [self.collectionView registerClass:[CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    
    
    
    
    
    
    [self.collectionView registerNib:  [UINib nibWithNibName:@"CollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    
    
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"cell_price" bundle:nil] forCellWithReuseIdentifier:@"cell_price"];
    
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
    
    //    _collectionDiamond.delegate = self;
    
    //    _collectionDiamond.dataSource = self;
    
    //    [_collectionDiamond reloadData];
    
    
    
}



-(void)viewWillAppear:(BOOL)animated

{
    
    //    UIView *view = [[UIView alloc]init];
    
    //    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    
    //    [view addSubview:_viewHeader];
    
    //
    
    [_collectionDiamond reloadData];
    
    //    _collectionView.collec
    
    self.title = @"Narola Groups Search Feature Demo - 1";
    
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
    
    
    
    
    
    dictSectionValues = [[NSMutableDictionary alloc]init];
    
    [dictSectionValues setValue:arrColor forKey:@"COLOR"];
    
    [dictSectionValues setValue:arrClarity forKey:@"CLARITY"];
    
    [dictSectionValues setValue:arrShades forKey:@"COLOR SHADE"];
    
    [dictSectionValues setValue:cut forKey:@"CUT"];
    
    [dictSectionValues setValue:Polish forKey:@"POLISH"];
    
    [dictSectionValues setValue:Symmetry forKey:@"SYMMETRY"];
    
    
    
    
    
    
    
    NSMutableArray *arrtest = [[NSMutableArray alloc]init];
    
    [dictSectionValues setValue:arrtest forKey:@"CARAT"];
    
    [dictSectionValues setValue:arrtest forKey:@"PRICE/CTS"];
    
    [dictSectionValues setValue:arrtest forKey:@"AMOUNT"];
    
    [dictSectionValues setValue:arrtest forKey:@"DISCOUNT"];
    
    [dictSectionValues setValue:arrtest forKey:@"NEW ARRIVAL DATE"];
    
    
    
    
    
    [arrKeys addObject:@"DIAMONDS"];
    
    [arrKeys addObject:@"COLOR"];
    
    [arrKeys addObject:@"CLARITY"];[arrKeys addObject:@"COLOR SHADE"];[arrKeys addObject:@"CUT"];[arrKeys addObject:@"POLISH"];[arrKeys addObject:@"SYMMETRY"];[arrKeys addObject:@"CARAT"];[arrKeys addObject:@"RICE/CTS"];[arrKeys addObject:@"AMOUNT"];[arrKeys addObject:@"DISCOUNT"];[arrKeys addObject:@"NEW ARRIVAL DATE"];
    
    
    
}





- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}





-(UIToolbar *)addToolBar :(NSIndexPath *)indexPath

{
    
    if(keyboardToolbar != nil) return keyboardToolbar;
    
    
    
    keyboardToolbar = [[UIToolbar alloc] init];
    
    [keyboardToolbar sizeToFit];
    
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      
                                      target:nil action:nil];
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      
                                      target:self action:@selector(yourTextViewDoneButtonPressed:)];
    
    doneBarButton.tag = indexPath.row;
    
    doneBarButton.accessibilityHint = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
    
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    
    
    
    return keyboardToolbar;
    
    //self.yourTextView.inputAccessoryView = keyboardToolbar;
    
}



-(void)yourTextViewDoneButtonPressed :(UITextField *)sender

{
    
    UIBarButtonItem *txt = (UIBarButtonItem *)sender;
    
    
    
    int section =  [txt.accessibilityHint intValue];
    
    int row = txt.tag;
    
    cell_price *cell = [_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
    
    
    
    
    
    
    
    NSLog(@"Entered Value is : %@",cell.txtFrom.text);
    
    NSLog(@"Entered Value is : %@",cell.txtTo.text);
    
    
    
    [cell.txtFrom resignFirstResponder];
    
    [cell.txtTo resignFirstResponder];
    
    
    
}



#pragma mark :- Collection Delegate and Datasource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView

{
    
    if(collectionView == _collectionDiamond) return 1;
    
    return arrKeys.count;
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{
    
    NSMutableArray *arr;
    
    if(collectionView == _collectionDiamond)
        
        return arrDimondShape.count;
    
    else
        
    {
        
        arr = [dictSectionValues valueForKey:[arrKeys objectAtIndex:section]];
        
        
        
        if(arr == nil || arr.count == 0)
            
        {
            
            return 1;
            
        }
        
    }
    
    return arr.count;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSMutableArray *arr = [dictSectionValues valueForKey:[arrKeys objectAtIndex:indexPath.section]];
    
    if (arr == nil || arr.count == 0) {
        
        
        
        if(indexPath.section == 8)
            
        {
            
            price_cell_2 *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"price_cell_2" forIndexPath:indexPath];
            
            ccell.txt2_to.tag = 0;
            
            ccell.slider_to.tag = indexPath.row;
            
            ccell.slider_to.accessibilityHint = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
            
            ccell.slider_to.tintColor = [UIColor darkGrayColor];
            
            ccell.slider_from.tintColor = [UIColor darkGrayColor];
            
            
            
            ccell.slider_from.tag = 1;
            
            ccell.slider_from.accessibilityHint = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
            
            
            
            [ccell.slider_to addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
            
            [ccell.slider_from addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
            
            
            
            return ccell;
            
            
            
        }
        
        if(indexPath.section == 9)
            
        {
            
            price_cell_2 *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"price_cell_3" forIndexPath:indexPath];
            
            [ccell setupSlider];
            
            ccell.rangeSliderCurrency.delegate = self;
            
            return ccell;
            
        }
        
        if(indexPath.section == 10)
            
        {
            
            price_cell_2 *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"price_cell_4" forIndexPath:indexPath];
            
            
            
            ccell.stepper_to.tag = 0;
            
            ccell.stepper_from.tag = 1;
            
            
            
            [ccell.stepper_to addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
            
            
            
            [ccell.stepper_from addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
            
            
            
            
            
            return ccell;
            
        }
        
        
        
        
        
        cell_price *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_price" forIndexPath:indexPath];
        
        
        
        ccell.txtTo.tag = indexPath.row;
        
        ccell.accessibilityHint = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
        
        ccell.txtTo.inputAccessoryView = [self addToolBar:indexPath];
        
        ccell.txtFrom.inputAccessoryView = [self addToolBar:indexPath];
        
        
        
        return ccell;
        
    }
    
    
    
    CollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    
    
    ccell.lblValues.text = [arr objectAtIndex:indexPath.row];
    
    ccell.lblValues.hidden = false;
    
    ccell.img.hidden = true;
    
    ccell.lblName.hidden = true;
    
    
    
    
    
    
    
    
    
    
    
    if(indexPath.section == 0)
        
    {
        
        ccell.img.hidden = false;
        
        ccell.img.image = [UIImage imageNamed:[arr objectAtIndex:indexPath.row]];
        
        ccell.lblValues.hidden = true;
        
        ccell.lblName.text = [arr objectAtIndex:indexPath.row];
        
        ccell.lblName.hidden = false;
        
    }
    
    
    
    ccell.backgroundColor = [UIColor clearColor];
    
    //    ccell.lblValues.layer.cornerRadius = 3;
    
    ccell.lblValues.layer.borderColor = [UIColor blackColor].CGColor;
    
    ccell.lblValues.layer.borderWidth = 1;
    
    // ccell.lblValues.clipsToBounds = true;
    
    
    
    
    
    
    
    if([dictSelection.allKeys containsObject:[dictSectionValues.allKeys objectAtIndex:indexPath.section]])
        
    {
        
        NSMutableArray *arrContains = [dictSelection objectForKey:dictSectionValues.allKeys[indexPath.section]];
        
        if([arrContains containsObject:[arr objectAtIndex:indexPath.row]])
            
        {
            
            ccell.backgroundColor = [UIColor blackColor];
            
            ccell.lblValues.textColor = [UIColor whiteColor];
            
        }
        
        else
            
        {
            
            ccell.backgroundColor = [UIColor clearColor];
            
            ccell.lblValues.textColor = [UIColor blackColor];
            
        }
        
    }
    
    
    
    if(indexPath.section == 1)
        
    {
        
        ccell.lblValues.layer.cornerRadius = 25;
        
        ccell.lblValues.clipsToBounds = true;
        
        ccell.lblValues.layer.masksToBounds = true;
        
        return ccell;
        
    }
    
    if(indexPath.section == 2)
        
    {
        
        ccell.lblValues.layer.cornerRadius = 16;
        
        ccell.lblValues.clipsToBounds = true;
        
        ccell.lblValues.layer.masksToBounds = true;
        
        return ccell;
        
    }
    
    if(indexPath.section == 3  )
        
    {
        
        ccell.lblValues.layer.cornerRadius = 8;
        
        ccell.lblValues.clipsToBounds = true;
        
        ccell.lblValues.layer.masksToBounds = true;
        
        return ccell;
        
    }
    
    if(indexPath.section == 4)
        
    {
        
        ccell.lblValues.layer.cornerRadius = 2;
        
        ccell.lblValues.clipsToBounds = true;
        
        ccell.lblValues.layer.masksToBounds = true;
        
        return ccell;
        
    }
    
    if(indexPath.section == 5)
        
    {
        
        ccell.lblValues.layer.cornerRadius = 2;
        
        ccell.lblValues.clipsToBounds = true;
        
        ccell.lblValues.layer.masksToBounds = true;
        
        return ccell;
        
    }
    
    if( indexPath.section == 6 )
        
    {
        
        ccell.lblValues.layer.cornerRadius = 20;
        
        ccell.lblValues.clipsToBounds = true;
        
        ccell.lblValues.layer.masksToBounds = true;
        
        return ccell;
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    return ccell;
    
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView

           viewForSupplementaryElementOfKind:(NSString *)kind

                                 atIndexPath:(NSIndexPath *)indexPath

{
    
    
    
    if(collectionView == _collectionView)
        
    {
        
        
        
        CollectionHeaderView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:
                                            
                                            UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        
        
        //    headerView.lblSectionValues.text = dictSectionValues.allKeys[indexPath.section];
        
        
        
        headerView.lblSectionValues.text = [arrKeys objectAtIndex:indexPath.section];
        
        
        
        headerView.backgroundColor = [UIColor darkGrayColor];
        
        
        
        return headerView;
        
    }
    
    else
        
        return  nil;
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    
    
    if(collectionView == _collectionView)
        
    {
        
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 40.0f);
        
        
        
    }
    
    
    
    return CGSizeMake(0, 0.0f);
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView

                  layout:(UICollectionViewLayout *)collectionViewLayout

  sizeForItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    
    
    if(collectionView == _collectionView)
        
    {
        
        NSMutableArray *arr = [dictSectionValues valueForKey:[arrKeys objectAtIndex:indexPath.section]];
        
        
        
        if(arr == nil || arr.count == 0)
            
        {
            
            if(indexPath.section == 8 || indexPath.section == 10)
                
            {
                
                return CGSizeMake([UIScreen mainScreen].bounds.size.width, 80);
                
                
                
            }
            
            if(indexPath.section == 9)
                
            {
                
                return CGSizeMake([UIScreen mainScreen].bounds.size.width, 120);
                
                
                
            }
            
            return CGSizeMake([UIScreen mainScreen].bounds.size.width, 40);
            
        }
        
        
        
        if(indexPath.section == 0)
            
        {
            
            return CGSizeMake(80, 120);
            
        }
        
        if(indexPath.section == 1 || indexPath.section == 2)
            
        {
            
            return CGSizeMake(50, 50);
            
        }
        
        if(indexPath.section == 3 || indexPath.section == 4 )
            
        {
            
            return CGSizeMake(60, 40);
            
        }
        
        
        
        if(indexPath.section == 5)
            
        {
            
            return CGSizeMake(60, 60);
            
        }
        
        if( indexPath.section == 6 )
            
        {
            
            return CGSizeMake((([UIScreen mainScreen].bounds.size.width - 60)/4), 40);
            
            
            
        }
        
        return CGSizeMake(60, 40);
        
    }
    
    
    
    return CGSizeMake(80, 80);
    
    
    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    CollectionViewCell *cell = (CollectionViewCell *)[_collectionView cellForItemAtIndexPath:indexPath];
    
    
    
    
    
    
    
    
    
    NSMutableArray *arr = [dictSectionValues valueForKey:[arrKeys objectAtIndex:indexPath.section]];
    
    
    
    
    
    if([dictSelection.allKeys containsObject:[dictSectionValues.allKeys objectAtIndex:indexPath.section]])
        
    {
        
        NSMutableArray *arrContains = [dictSelection objectForKey:dictSectionValues.allKeys[indexPath.section]];
        
        if(![arrContains containsObject:[arr objectAtIndex:indexPath.row]])
            
        {
            
            [arrContains addObject:[arr objectAtIndex:indexPath.row] ];
            
            cell.backgroundColor = [UIColor blackColor];
            
            cell.lblValues.textColor = [UIColor whiteColor];
            
            cell.lblValues.clipsToBounds = true;
            
        }
        
        else
            
        {
            
            [arrContains removeObject:[arr objectAtIndex:indexPath.row]];
            
            cell.backgroundColor = [UIColor clearColor];
            
            cell.lblValues.textColor = [UIColor blackColor];
            
        }
        
        
        
        [dictSelection setValue:arrContains forKey:dictSectionValues.allKeys[indexPath.section]];
        
    }
    
    else
        
    {
        
        
        
        if(arr.count == 0) return;
        
        NSMutableArray *NewArr = [[NSMutableArray alloc]init];
        
        [NewArr addObject:[arr objectAtIndex:indexPath.row]];
        
        
        
        [dictSelection setValue:NewArr forKey:dictSectionValues.allKeys[indexPath.section]];
        
        cell.backgroundColor = [UIColor blackColor];
        
        cell.lblValues.textColor = [UIColor whiteColor];
        
    }
    
    
    
    
    
    
    
    NSLog(@"=---- %@",dictSelection);
    
    
    
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    CollectionViewCell *cell = (CollectionViewCell *)[_collectionView cellForItemAtIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor clearColor];
    
}



- (IBAction)showResult:(id)sender {
    
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection"
                          
                                                    message:[NSString stringWithFormat:@"%@",dictSelection]
                          
                                                   delegate:nil
                          
                                          cancelButtonTitle:@"OK"
                          
                                          otherButtonTitles:nil];
    
    [alert show];
    
    
    
}



#pragma mark - cell methods





- (IBAction)stepperValueChanged:(id)sender{
    
    UIStepper *stepper = (UIStepper *)sender;
    
    
    
    price_cell_2 *cell =  (price_cell_2 *)[[stepper superview] superview];
    
    
    
    if(stepper.tag == 0)
        
    {
        
        cell.txt4_to.text = [NSString stringWithFormat:@"%.02f",round(stepper.value)];
        
    }
    
    else
        
    {
        
        cell.txt4_from.text = [NSString stringWithFormat:@"%.02f", round(stepper.value)];
        
        
        
    }
    
    
    
    
    
}



- (IBAction)sliderValueChanged:(id)sender

{
    
    UISlider *slider = (UISlider *)sender;
    
    price_cell_2 *cell =  (price_cell_2 *)[[[slider superview] superview] superview];
    
    
    
    if(slider.tag == 0)
        
    {
        
        cell.txt2_to.text = [NSString stringWithFormat:@"%.02f",round(slider.value *100)];
        
    }
    
    else
        
    {
        
        cell.txt2_from.text = [NSString stringWithFormat:@"%.02f", round(slider.value * 100)];
        
        
        
    }
    
    
    
    
    
    // Set the label text to the value of the slider as it changes
    
    //    self.label.text = [NSString stringWithFormat:@"%f", self.slider.value];
    
}



-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
    
    
    
    TTRangeSlider *slider =(TTRangeSlider *)sender;
    
    price_cell_2 *cell =  (price_cell_2 *)[[[slider superview] superview] superview];
    
    
    
    NSLog(@"Currency slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    
    
    
    
    
    cell.txt3_from.text = [NSString stringWithFormat:@"%.02f",selectedMinimum];
    
    cell.txt3_to.text = [NSString stringWithFormat:@"%.02f",selectedMaximum];
    
    
    
    
    
}







@end


