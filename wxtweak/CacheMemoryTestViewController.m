//
//  CacheMemoryTestViewController.m
//  MyCustomTableViewForSelected
//
//  Created by Zhu Shouyu on 6/2/13.
//  Copyright (c) 2013 zhu shouyu. All rights reserved.
//

#import "CacheMemoryTestViewController.h"


@interface CacheMemoryTestViewController ()
@property (nonatomic, retain) NSIndexPath *selectedIndexPath;
@property NSInteger _maxEachTime;
@end

@implementation CacheMemoryTestViewController
@synthesize selectedIndexPath = _selectedIndexPath;


#pragma mark - 
- (id) initWithArray:(NSMutableArray *)arr controller:(id)ctrl maxCountEachTime:(int)maxCntEachTime
{
    self._maxEachTime = maxCntEachTime;
    self._arrContactList = arr;
    [arr retain];
    self._controller = ctrl;
    [ctrl retain];
    return self;
}

- (NSInteger)popoverListView:(ZSYPopoverListView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int cnt = [self._arrContactList count];
    int n = cnt % self._maxEachTime;
    if (n != 0) return cnt / self._maxEachTime + 1;
    return cnt / 200;
}

- (UITableViewCell *)popoverListView:(ZSYPopoverListView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusablePopoverCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    if ( self.selectedIndexPath && NSOrderedSame == [self.selectedIndexPath compare:indexPath])
    {
       // cell.imageView.image = [UIImage imageNamed:@"fs_main_login_selected.png"];
    }
    else
    {
        //cell.imageView.image = [UIImage imageNamed:@"fs_main_login_normal.png"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %d 批", indexPath.row + 1];
    return cell;
}

- (void)popoverListView:(ZSYPopoverListView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView popoverCellForRowAtIndexPath:indexPath];
   // cell.imageView.image = [UIImage imageNamed:@"fs_main_login_normal.png"];
    NSLog(@"deselect:%d", indexPath.row);

}

- (void)popoverListView:(ZSYPopoverListView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    UITableViewCell *cell = [tableView popoverCellForRowAtIndexPath:indexPath];
   // cell.imageView.image = [UIImage imageNamed:@"fs_main_login_selected.png"];
    NSLog(@"select:%d", indexPath.row);
    
    int index = indexPath.row;
    int count = [self._arrContactList count];
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    
    NSString* tmpdir = NSTemporaryDirectory();
    NSString* str = [[NSString alloc] initWithContentsOfFile:[tmpdir stringByAppendingString:@"bt"] encoding:NSUTF8StringEncoding error:nil];
    
    int maxEachTime = self._maxEachTime;

    
    for (int i = 0; i < maxEachTime; ++i) {
        int c = index * maxEachTime + i;
        if (c >= count) break;
        id item = [self._arrContactList objectAtIndex: c];
        [arr addObject:item];
    }
    
    id ctr = self._controller;
    [ctr retain];
    [tableView dismiss];
    
    if ([arr count] > 0)
    {
        
      //  objc_msgSend(ctr, @selector(onDone), arr);
        
       Class cls = objc_getClass("MMMassSendWriteMessageViewController");
        id pWriteMessage = objc_msgSend(cls, @selector(alloc));
        [pWriteMessage init];
        [pWriteMessage autorelease];
        objc_msgSend(pWriteMessage, @selector(setArrContacts:), arr);
        
        UINavigationController* navigationController = objc_msgSend(ctr, @selector(navigationController));
        [navigationController autorelease];
        objc_msgSend(navigationController, @selector(pushViewController:animated:), pWriteMessage, 1);
    }
     [ctr release];
    
}
@end
