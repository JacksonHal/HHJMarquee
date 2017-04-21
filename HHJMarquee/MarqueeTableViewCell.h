//
//  MarqueeTableViewCell.h
//  HHJMarquee
//
//  Created by meixiang02 on 2017/4/21.
//  Copyright © 2017年 好杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarqueeTableViewCell : UITableViewCell
+ (MarqueeTableViewCell *)initWithMarqueeTableViewCell:(UITableView *)tableView;
- (void)configDataWithArry:(NSArray *)arry;


- (void)addTimer;
- (void)removeTimer;

@end
