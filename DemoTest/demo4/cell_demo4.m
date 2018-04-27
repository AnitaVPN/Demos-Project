//
//  cell_demo4.m
//  DemoTest
//
//  Created by Apple on 26/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "CollectionViewCell_demo4.h"
#import "cell_demo4.h"
#import "cell_demo3.h"
#import "CollectionHeaderView.h"
#import "cell_price.h"
#import "cell_dimond.h"
#import "cell_demo3_collectionViewCollectionViewCell.h"
#import "Demo4VC.h"

@implementation cell_demo4  {
    
    NSMutableArray *arrDimondShape ;
    UIToolbar* keyboardToolbar;
    NSMutableArray *arrColor,*arrClarity,*arrShades,*cut,*Polish,*Symmetry,*FlourSense,*Lab;
}
@synthesize dictSectionValues,dictSelection;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
   
    
    // Initialization code
}

//-(id)initWithName:(NSMutableDictionary *)dict :(cell_demo3 *)cell
//{
////    self = [super init];
////    self = [super initWithStyle:UITableViewCellStyleDefault
////                             reuseIdentifier:@"cell"];
//    if (self) {
//        self.arrValues = dict;
//
//    }
//
//    [cell.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
//
//    cell.collectionView.delegate = self;
//    cell.collectionView.dataSource = self;
//
//    return cell;
//}

- (void)reloadInputViews
{
    
    [self.collectionView reloadData];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.collectionView.layer.borderColor = [UIColor grayColor].CGColor;
    self.collectionView.layer.borderWidth = 1;
    self.section = 0;
    //    dictSelection= [[NSMutableDictionary alloc]init];
    if (self) {
        // Initialization code
        //        [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setNotificationObserver
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"post" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callingNotification:) name:@"post" object:nil];
    
}


#pragma mark :- Collection Delegate and Datasource Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    NSMutableArray *arr = [dictSectionValues objectForKey:[self.arrKeys objectAtIndex:_section]];
    //
    //    if(arr.count == 0 || arr == nil)
    //    {
    //        return 1;
    //
    //    };
    
    NSMutableArray *arr;
    
    {
        arr = [dictSectionValues valueForKey:[_arrKeys objectAtIndex:_section]];
        
        if(arr == nil || arr.count == 0)
        {
            return 1;
        }
    }
    
    if(_section == 0)
    {
        return 4;
    }
    
    
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    CollectionViewCell_demo4 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSMutableArray *arr = [dictSectionValues objectForKey:[self.arrKeys objectAtIndex:_section]];
    
    if([arr count] > 0)
    {
        cell.lblValues.text = [arr objectAtIndex:indexPath.row];
    }
    
//    NSLog(@"IndexPath :%@",indexPath);
//    NSLog(@"SEction %d",_section);
    
    
    
    
    
    cell.view_Sep.hidden = true;
    cell.lblValues.hidden = false;
    cell.img.hidden = true;
    cell.lblName.hidden = true;
    
    cell.lblName.textColor = _textColor;
    cell.lblValues.textColor = _textColor;
    //    cell.backgroundColor = _defaultBgColor;
    
    
    cell.backgroundColor =
    _defaultBgColor;
    
    
    
    
    if(_section == 0 )
    {
        cell.img.hidden = false;
        cell.lblName.text = [arr objectAtIndex:indexPath.row];
        cell.img.image = [UIImage imageNamed:[arr objectAtIndex:indexPath.row]];
        cell.lblValues.hidden = true;
        cell.lblName.hidden = false;
        // cell.backgroundColor = _defaultBgColor;
//        cell.lblValues.text = [arr objectAtIndex:indexPath.row +(arr.count/2)];

        
    }
    
    if (arr == nil || arr.count == 0) {
        
        cell_price *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_price" forIndexPath:indexPath];
        
        ccell.txtTo.tag = indexPath.row;
        ccell.accessibilityHint = [NSString stringWithFormat:@"%i",indexPath.section];
        ccell.txtTo.inputAccessoryView = [self addToolBar:indexPath];
        ccell.txtFrom.inputAccessoryView = [self addToolBar:indexPath];
        
        ccell.backgroundColor = _defaultBgColor;
        
        return ccell;
    }
    
    
    if([dictSelection.allKeys containsObject:[self.arrKeys objectAtIndex:_section]])

    {
        NSMutableArray *arrContains = [dictSelection objectForKey:[self.arrKeys objectAtIndex:_section]];
        if([arrContains containsObject:[arr objectAtIndex:indexPath.row]])
        {
            if(_section == 0)
            {
                cell.view_Sep.hidden = false;
                cell.backgroundColor =
                _defaultBgColor;
                
            }
            else
            {
                cell.backgroundColor =
                _selectionColor;
                cell.lblValues.textColor = _textSelectedColor;
                cell.layer.borderColor = _defaultBgColor.CGColor;
                cell.layer.borderWidth = 1;
            }
            
            
        }
        else
        {
            if(_section == 0)
            {
                cell.view_Sep.hidden = true;
                cell.backgroundColor = _defaultBgColor;
            }
            else
            {
                cell.backgroundColor = _defaultBgColor;
                cell.lblValues.textColor = _textColor;
                cell.layer.borderColor = _defaultBgColor.CGColor;
            }
            
            
        }
    }
    //
    //    [cell ]
    
    //    cell.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0];
    
    cell.contentView.layer.cornerRadius = 0.0f;
    cell.contentView.layer.borderWidth = 2.0f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    
    cell.layer.shadowColor = _selectionColor.CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 2.0f);
    cell.layer.shadowRadius = 2.0f;
    cell.layer.shadowOpacity = 0.5f;
    cell.layer.masksToBounds = NO;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    
    return cell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//           viewForSupplementaryElementOfKind:(NSString *)kind
//                                 atIndexPath:(NSIndexPath *)indexPath
//{
//
//    if(collectionView == _collectionView)
//    {
//
//        CollectionHeaderView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:
//                                            UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
//
//        //    headerView.lblSectionValues.text = dictSectionValues.allKeys[indexPath.section];
//
//        headerView.lblSectionValues.text = [arrKeys objectAtIndex:indexPath.section];
//        return headerView;
//    }
//    else
//        return  nil;
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//
//    if(collectionView == _collectionView)
//    {
//        return CGSizeMake(414.0f, 40.0f);
//
//    }
//
//    return CGSizeMake(0, 0.0f);
//}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *arr = [dictSectionValues objectForKey:[self.arrKeys objectAtIndex:_section]];
    
    if(arr == nil || arr.count == 0)
    {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 60);
    }
    
    
    if(_section == 0)
        return CGSizeMake([UIScreen mainScreen].bounds.size.width/4, 100);
    
    if(_section == 2)
        return CGSizeMake(100, 60);
    
    if(_section == 5)
        return CGSizeMake(80, 60);
    
    else if(arr.count <= 4)
        return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 5)/arr.count, 60);
    
    else
        return CGSizeMake(60, 60);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell_demo4 *cell = (CollectionViewCell_demo4 *)[_collectionView cellForItemAtIndexPath:indexPath];
    
    
    if([cell isKindOfClass:[cell_price class]])return;
    
    
    cell.view_Sep.hidden = true;
    if(_section == 0)
    {
        cell.view_Sep.hidden = false;
        cell.backgroundColor = _defaultBgColor;
    }
    
    NSMutableArray *arr = [dictSectionValues valueForKey:[_arrKeys objectAtIndex:_section]];
    
    if(dictSelection == nil)
        dictSelection = [[NSMutableDictionary alloc]init];
    
    
    if([dictSelection.allKeys containsObject:[_arrKeys objectAtIndex:_section]])
    {
        NSMutableArray *arrContains = [dictSelection objectForKey:[_arrKeys objectAtIndex:_section]];
        if(![arrContains containsObject:[arr objectAtIndex:indexPath.row]])
        {
            [arrContains addObject:[arr objectAtIndex:indexPath.row] ];
            
            if(_section != 0)
            {
                cell.backgroundColor = _selectionColor;
                cell.lblValues.textColor = _textSelectedColor;
            }
            
        }
        else
        {
            [arrContains removeObject:[arr objectAtIndex:indexPath.row]];
            cell.backgroundColor = [UIColor clearColor];
            cell.lblValues.textColor = _textColor;
        }
        
        [dictSelection setValue:arrContains forKey:[_arrKeys objectAtIndex:_section]];
    }
    else
    {
        NSMutableArray *NewArr = [[NSMutableArray alloc]init];
        [NewArr addObject:[arr objectAtIndex:indexPath.row]];
        
        [dictSelection setValue:NewArr forKey:[_arrKeys objectAtIndex:_section]];
        cell.backgroundColor = _selectionColor;;
        cell.lblValues.textColor = _textSelectedColor;
    }
    
    [_collectionView reloadItemsAtIndexPaths:@[indexPath]];
    NSLog(@"=---- %@",dictSelection);
    
    
}

/*- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath

{
    if(_section == 3)
    {
        CollectionHeaderView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:
            UICollectionElementKindSectionHeader withReuseIdentifier:@"cell_demo4_header" forIndexPath:indexPath];
    
            return headerView;
        
    }
    else
    return  nil;
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    

    if(_section == 3)
    {
        return CGSizeMake(100, 140.0f);
    }
    
    return CGSizeMake(0, 0.0f);
    
}

*/





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
   
    cell_price *cell = (cell_price *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];

    
//    NSLog(@"Entered Value is : %@",cell.txtFrom.text);
//    NSLog(@"Entered Value is : %@",cell.txtTo.text);
    
    [cell.txtFrom resignFirstResponder];
    [cell.txtTo resignFirstResponder];
    
}
- (void)updateValues : (int)section withString:(NSString *)str
{
    NSLog(@"Delegate methods calling");
    [self callingNotification:nil];
//    if(dictSelection == nil)
//        dictSelection = [[NSMutableDictionary alloc]init];
//
//    //_section = 7;
//
//    NSMutableArray *NewArr = [[NSMutableArray alloc]init];
//    [NewArr addObject:@"EX"];
//
////    [dictSelection setValue:NewArr forKey:[_arrKeys objectAtIndex:_section]];
//
//    [dictSelection setValue:NewArr forKey:@"CUT"];
//    [dictSelection setValue:NewArr forKey:@"POLISH"];
//    [dictSelection setValue:NewArr forKey:@"SYMMETRY"];
//
//    [_collectionView reloadData]
    ;
    
//    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:7]];
//    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:8]];
//    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:9]];

    
}

-(void)callingNotification:(NSNotification*)notification
{
    NSDictionary *dict = [notification object];
    NSString *str = [dict valueForKey:@"str"];
    
    NSMutableArray *NewArr1 = [[NSMutableArray alloc]init];
    NSMutableArray *NewArr2 = [[NSMutableArray alloc]init];
    NSMutableArray *NewArr3 = [[NSMutableArray alloc]init];
    
    if(dictSelection == nil)
    {
        dictSelection = [[NSMutableDictionary alloc]init];
        
        if([str isEqualToString:@"3VG+"])
        {
            [NewArr1 addObject:@"EX"];
            [NewArr2 addObject:@"EX"];
            [NewArr3 addObject:@"EX"];
            
            [NewArr1 addObject:@"VG"];
            [NewArr2 addObject:@"VG"];
            [NewArr3 addObject:@"VG"];
        }
        else if([str isEqualToString:@"NO BGM"])
        {
            [NewArr1 removeAllObjects];
            [NewArr2 removeAllObjects];
            [NewArr3 removeAllObjects];
            
        }
        else
        {
            [NewArr1 addObject:@"EX"];
            [NewArr2 addObject:@"EX"];
            [NewArr3 addObject:@"EX"];
        }
    }
    else
    {
        NewArr1 = [dictSelection valueForKey:@"CUT"];
        NewArr2 = [dictSelection valueForKey:@"POLISH"];
        NewArr3 = [dictSelection valueForKey:@"SYMMETRY"];

        
        if([str isEqualToString:@"3VG+"])
        {
            
            if(![NewArr1 containsObject:@"EX"])
                [NewArr1 addObject:@"EX"];
            
            if(![NewArr2 containsObject:@"EX"])
                [NewArr2 addObject:@"EX"];
            
            if(![NewArr3 containsObject:@"EX"])
                [NewArr3 addObject:@"EX"];
            
            if(![NewArr1 containsObject:@"VG"])
                [NewArr1 addObject:@"VG"];
            
            if(![NewArr2 containsObject:@"VG"])
                [NewArr2 addObject:@"VG"];
            
            if(![NewArr3 containsObject:@"VG"])
                [NewArr3 addObject:@"VG"];

        
        }
        else if([str isEqualToString:@"NO BGM"])
        {
            [NewArr1 removeAllObjects];
            [NewArr2 removeAllObjects];
            [NewArr3 removeAllObjects];
            
        }
        else
        {
            
            
            if(![NewArr1 containsObject:@"EX"])
                [NewArr1 addObject:@"EX"];
            
            if(![NewArr2 containsObject:@"EX"])
                [NewArr2 addObject:@"EX"];
            
            if(![NewArr3 containsObject:@"EX"])
                [NewArr3 addObject:@"EX"];
            
            //Remove
            if([NewArr1 containsObject:@"VG"])
                [NewArr1 removeObject:@"VG"];
            
            if([NewArr2 containsObject:@"VG"])
                [NewArr2 removeObject:@"VG"];
            
            if([NewArr3 containsObject:@"VG"])
                [NewArr3 removeObject:@"VG"];
            
            
        }

        
        
    }
    
    NSLog(@"Calling notification");
   
    

    
    [dictSelection setValue:NewArr1 forKey:@"CUT"];
    [dictSelection setValue:NewArr2 forKey:@"POLISH"];
    [dictSelection setValue:NewArr3 forKey:@"SYMMETRY"];
    NSLog(@"=---- %@",dictSelection);

   

//[_collectionView reloadSections:@[@7,@8,@9]];
    
    [self reloadInputViews];
}

@end




