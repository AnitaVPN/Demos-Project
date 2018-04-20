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
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
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
    
    [arrDimondShape addObject:@"one"];
    [arrDimondShape addObject:@"two"];
    [arrDimondShape addObject:@"three"];
    [arrDimondShape addObject:@"four"];
    [arrDimondShape addObject:@"five"];
    [arrDimondShape addObject:@"six"];
    [arrDimondShape addObject:@"seven"];
    [arrDimondShape addObject:@"eight"];
    
    [dictSectionValues setValue:arrDimondShape forKey:@"DIMONDS"];
    

    
    
    dictSelection = [[NSMutableDictionary alloc]init];
    
    self.collectionView.delegate  = self;
    self.collectionView.dataSource = self;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
//    [self.collectionView registerClass:[CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];

    
   
    [self.collectionView registerNib:  [UINib nibWithNibName:@"CollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    

      [self.collectionView registerNib:[UINib nibWithNibName:@"cell_price" bundle:nil] forCellWithReuseIdentifier:@"cell_price"];
    
    
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
    [dictSectionValues setValue:Polish forKey:@"PLOISH"];
    [dictSectionValues setValue:Symmetry forKey:@"SYMMETRY"];
    
    
    
    NSMutableArray *arrtest = [[NSMutableArray alloc]init];
    [dictSectionValues setValue:arrtest forKey:@"CARAT"];
    [dictSectionValues setValue:arrtest forKey:@"PRICE/CTS"];
    [dictSectionValues setValue:arrtest forKey:@"AMOUNT"];
    [dictSectionValues setValue:arrtest forKey:@"DISCOUNT"];
    [dictSectionValues setValue:arrtest forKey:@"NEW ARRIVAL DATE"];
    
    
    [arrKeys addObject:@"DIMONDS"];
    [arrKeys addObject:@"COLOR"];
    [arrKeys addObject:@"CLARITY"];[arrKeys addObject:@"COLOR SHADE"];[arrKeys addObject:@"CUT"];[arrKeys addObject:@"PLOISH"];[arrKeys addObject:@"SYMMETRY"];[arrKeys addObject:@"CARAT"];[arrKeys addObject:@"RICE/CTS"];[arrKeys addObject:@"AMOUNT"];[arrKeys addObject:@"DISCOUNT"];[arrKeys addObject:@"NEW ARRIVAL DATE"];
    
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
    
    if(collectionView == _collectionDiamond)
    {
        cell_dimond *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_dimond" forIndexPath:indexPath];
        ccell.imgDimond.image = [UIImage imageNamed:[arrDimondShape objectAtIndex:indexPath.row]];
        return ccell;
    }
    
    NSMutableArray *arr = [dictSectionValues valueForKey:[arrKeys objectAtIndex:indexPath.section]];
    if (arr == nil || arr.count == 0) {
        
        cell_price *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_price" forIndexPath:indexPath];
        
        ccell.txtTo.tag = indexPath.row;
        ccell.accessibilityHint = [NSString stringWithFormat:@"%i",indexPath.section];
        ccell.txtTo.inputAccessoryView = [self addToolBar:indexPath];
        ccell.txtFrom.inputAccessoryView = [self addToolBar:indexPath];

        return ccell;
    }
    
    CollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    ccell.lblValues.text = [arr objectAtIndex:indexPath.row];
    ccell.lblValues.hidden = false;
    ccell.img.hidden = true;
    if(indexPath.section == 0)
    {
        ccell.img.hidden = false;
        ccell.img.image = [UIImage imageNamed:[arr objectAtIndex:indexPath.row]];
        ccell.lblValues.hidden = true;
    }
    
    ccell.backgroundColor = [UIColor clearColor];

    if([dictSelection.allKeys containsObject:[dictSectionValues.allKeys objectAtIndex:indexPath.section]])
    {
        NSMutableArray *arrContains = [dictSelection objectForKey:dictSectionValues.allKeys[indexPath.section]];
        if([arrContains containsObject:[arr objectAtIndex:indexPath.row]])
        {
            ccell.backgroundColor = [UIColor blueColor];
        }
        else
        {
            ccell.backgroundColor = [UIColor clearColor];
        }
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
    return headerView;
    }
    else
        return  nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
   
    if(collectionView == _collectionView)
    {
        return CGSizeMake(414.0f, 40.0f);

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
            return CGSizeMake(414, 40);
        }
        
        if(indexPath.section == 0)
        {
            return CGSizeMake(80, 80);
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
            cell.backgroundColor = [UIColor blueColor];
        }
        else
        {
            [arrContains removeObject:[arr objectAtIndex:indexPath.row]];
            cell.backgroundColor = [UIColor clearColor];
        }
        
         [dictSelection setValue:arrContains forKey:dictSectionValues.allKeys[indexPath.section]];
    }
    else
    {
        NSMutableArray *NewArr = [[NSMutableArray alloc]init];
        [NewArr addObject:[arr objectAtIndex:indexPath.row]];
        
         [dictSelection setValue:NewArr forKey:dictSectionValues.allKeys[indexPath.section]];
        cell.backgroundColor = [UIColor blueColor];
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


@end
