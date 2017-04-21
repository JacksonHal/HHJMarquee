//
//  RootVC.m
//  HHJMarquee
//
//  Created by meixiang02 on 2017/4/21.
//  Copyright © 2017年 好杰. All rights reserved.
//

#import "RootVC.h"
#import "MarqueeTableViewCell.h"
@interface RootVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSArray            *dataArry;

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"跑马灯";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.dataArry = @[@"苹果",@"香蕉",@"橘子",@"西瓜",@"橙子",@"猕猴桃"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellID"];
//    [self.tableView registerClass:[MarqueeTableViewCell class] forCellReuseIdentifier:@"MarqueeTableViewCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    

    if (indexPath.row == 3) {
        MarqueeTableViewCell *cell = [MarqueeTableViewCell initWithMarqueeTableViewCell:tableView];
        [cell configDataWithArry:self.dataArry];
        return cell;
    }else {
        static NSString *cellID = @"CellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.textLabel.text = @"其他";
        return cell;
    }
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}



@end
