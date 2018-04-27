//
//  cell_demo3.m
//  DemoTest
//
//  Created by Apple on 23/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "cell_demo3.h"
#import "CollectionViewCell.h"
#import "CollectionHeaderView.h"
#import "cell_price.h"
#import "cell_dimond.h"
#import "cell_demo3_collectionViewCollectionViewCell.h"

@implementation cell_demo3
{
    
    NSMutableArray *arrDimondShape ;
    NSMutableDictionary *dictSelection;
    UIToolbar* keyboardToolbar;
    NSMutableArray *arrColor,*arrClarity,*arrShades,*cut,*Polish,*Symmetry,*FlourSense,*Lab;
}
@synthesize dictSectionValues;

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
    
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSMutableArray *arr = [dictSectionValues objectForKey:[self.arrKeys objectAtIndex:_section]];
    
    if([arr count] > 0)
    {
         cell.lblValues.text = [arr objectAtIndex:indexPath.row];
    }
  
    cell.view_Sep.hidden = true;
    cell.lblValues.hidden = false;
    cell.img.hidden = true;
    cell.lblName.hidden = true;
    
    cell.lblName.textColor = _textColor;
    cell.lblValues.textColor = _textColor;
//    cell.backgroundColor = _defaultBgColor;

    
    cell.backgroundColor =
    _defaultBgColor;
    if(_section == 0)
    {
        cell.img.hidden = false;
        cell.lblName.text = [arr objectAtIndex:indexPath.row];
        cell.img.image = [UIImage imageNamed:[arr objectAtIndex:indexPath.row]];
        cell.lblValues.hidden = true;
        cell.lblName.hidden = false;
       // cell.backgroundColor = _defaultBgColor;
        
    
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
    cell.contentView.layer.borderWidth = 1.0f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    
    cell.layer.shadowColor = [UIColor grayColor].CGColor;
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
        return CGSizeMake(120, 120);
    
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
    CollectionViewCell *cell = (CollectionViewCell *)[_collectionView cellForItemAtIndexPath:indexPath];

    
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


@end



