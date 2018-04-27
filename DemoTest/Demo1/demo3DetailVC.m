//
//  demo3DetailVC.m
//  DemoTest
//
//  Created by Apple on 24/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import "demo3DetailVC.h"
#import "cell_demo3_collectionViewCollectionViewCell.h"

@interface demo3DetailVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray *arrValues;
    NSMutableArray *arrModels;
}
@end

@implementation demo3DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = _model.strKeyName;
    _clsView.delegate = self;
    _clsView.dataSource = self;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark :- Collection Delegate and Datasource Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _model.dictValues.allKeys.count;  //count of section

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell_demo3_collectionViewCollectionViewCell *cell = [_clsView dequeueReusableCellWithReuseIdentifier:@"cell_demo3_cols" forIndexPath:indexPath];
   
    cell.vw_image.hidden = true;
    if(![_model.strKeyName isEqualToString:@"Shape"])
    {
        cell.lblValues.hidden = false;
        cell.lblValues.text = _model.dictValues.allKeys[indexPath.row];
        cell.vw_image.hidden = true;

    }
    else
    {
        cell.lblValue.hidden = false;
        cell.vw_image.hidden = false;
        cell.lblValue.text = _model.dictValues.allKeys[indexPath.row];
        cell.imgDimond.image = [UIImage imageNamed:cell.lblValue.text];
        cell.lblValues.hidden = true;
    }
    
    
    if([_model.strKeyName isEqualToString:@"Clarity"])
    {
        cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.layer.borderWidth = 2;
        cell.layer.cornerRadius = 40;
        cell.clipsToBounds = true;
    }
    else if([_model.strKeyName isEqualToString:@"Symmetry"])
    {
        cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.layer.borderWidth = 2;
        cell.layer.cornerRadius = 20;
        cell.clipsToBounds = true;

    }
    else if([_model.strKeyName isEqualToString:@"Color"])
    {
        cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.layer.cornerRadius = 10;
        cell.clipsToBounds = true;
        cell.layer.borderWidth = 2;
    }
     else if([_model.strKeyName isEqualToString:@"Shape"])
     {
          cell.layer.borderWidth = 0;
     }
    else
    {
        cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.layer.cornerRadius = 3;
        cell.clipsToBounds = true;
        cell.layer.borderWidth = 2;
    }
   
    
    
   
    
    
 if(_model.dictValues.allValues[indexPath.row] != [NSNumber numberWithInt:0])
    {
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.lblValues.textColor = [UIColor whiteColor];
    }
    else
    {
        cell.backgroundColor = [UIColor clearColor];
        cell.lblValues.textColor = [UIColor blackColor];

    }
    
    
    
    
        return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if([_model.strKeyName isEqualToString:@"Shape"])
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 64)/3, 135);
    else
        return CGSizeMake(80, 80);
}

// NSMutableDictionary *dict = [_model.dict//];
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
NSNumber * value =  [NSNumber numberWithInt:![_model.dictValues.allValues[indexPath.row] intValue]];

[_model.dictValues setValue:value forKey:_model.dictValues.allKeys[indexPath.row]];

//[_clsView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [_clsView reloadItemsAtIndexPaths:@[indexPath]];
    
}



//    NSString * result = [[array valueForKey:@"description"] componentsJoinedByString:@""];




//    [[_model.dictValues.allValues
//setValue:value forKey:_model.dictValues.allKeys[indexPath.row]]];


@end
