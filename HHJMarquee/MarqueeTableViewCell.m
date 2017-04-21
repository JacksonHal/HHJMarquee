//
//  MarqueeTableViewCell.m
//  HHJMarquee
//
//  Created by meixiang02 on 2017/4/21.
//  Copyright © 2017年 好杰. All rights reserved.
//

#import "MarqueeTableViewCell.h"


@interface MarqueeTableViewCell ()
{
    NSTimer     *_timer;
    int         _num;
    NSArray     *_dataArry;
}

@property (nonatomic, strong)UILabel            *label;

@end

@implementation MarqueeTableViewCell

+ (MarqueeTableViewCell *)initWithMarqueeTableViewCell:(UITableView *)tableView{
    static NSString *marqueeTableViewCell = @"MarqueeTableViewCell";
    MarqueeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:marqueeTableViewCell];
    if (!cell){
        cell = [[MarqueeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:marqueeTableViewCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    
    return self;
}

- (void)createView {
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 17, [UIScreen mainScreen].bounds.size.width, 16)];
    _label.font = [UIFont systemFontOfSize:16];
    
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];
}

- (void)configDataWithArry:(NSArray *)arry{
    _dataArry = arry;
    _label.text = _dataArry[_num];
    [self addTimer];
}

- (void)addTimer {
    if (_dataArry.count>1) {
        [self removeTimer];
        _timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(updateData) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)updateData {
    _num++;
    if (_num >= _dataArry.count) {
        _num = 0;
    }
    self.label.text = _dataArry[_num];
    CATransition *transition = [[CATransition alloc] init];
    transition.type = @"push";
    transition.subtype = kCATransitionFromTop;
    transition.duration = 1.0;
    transition.removedOnCompletion = YES;
    [self.label.layer addAnimation:transition forKey:@"transition"];
}

- (void)removeTimer{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
