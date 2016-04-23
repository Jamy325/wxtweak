//
//  CacheMemoryTestViewController.h
//  MyCustomTableViewForSelected
//
//  Created by Zhu Shouyu on 6/2/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSYPopoverListView.h"
@interface CacheMemoryTestViewController : NSObject<ZSYPopoverListDatasource, ZSYPopoverListDelegate>

- (id) initWithArray:(NSMutableArray*)arr controller:(id)ctrl;
@property NSMutableArray* _arrContactList;
@property id _controller;
@end
