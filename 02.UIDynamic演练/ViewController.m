//
//  ViewController.m
//  02.UIDynamic演练
//
//  Created by apple on 13-12-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"

@interface ViewController ()
{
    // 功能名称的数组
    NSArray *_functions;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _functions = @[@"吸附行为", @"刚性附着行为"];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _functions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 使用Storyboard建立的UITabeViewController，其中的Cell是已经注册过的
    static NSString *ID = @"Cell";
    // 永远都会找到一个单元格，如果缓冲池中没有，会自动新建
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
//    if (cell == nil) {
//        <#statements#>
//    }
    
    cell.textLabel.text = _functions[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoViewController *controller = [[DemoViewController alloc] init];
    
    // 指定标题
    controller.title = _functions[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}

@end
