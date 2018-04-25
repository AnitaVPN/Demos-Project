//
//  SearchModel.h
//  DemoTest
//
//  Created by Apple on 21/04/18.
//  Copyright © 2018 VPN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchModel : NSObject
@property(strong,nonatomic) NSString *strKeyName;
@property(strong,nonatomic) NSMutableDictionary *dictValues;
@property (strong,nonatomic)NSString *strSelectedValues;
@end
