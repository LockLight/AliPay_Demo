//
//  LLMomentCell.m
//  AliPay_Moment_Demo
//
//  Created by locklight on 17/1/6.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLMomentCell.h"
#import "LLMoment.h"
#import "Masonry.h"
#import "UILabel+Addition.h"
#import "UIColor+Addition.h"

//定义默认间距
static CGFloat margin = 8;

@interface LLMomentCell ()
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabl;
@property (nonatomic, weak) UILabel *contentLabel;
@property (nonatomic, weak) UIImageView *picView;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIButton *deleteBtn;


@end

@implementation LLMomentCell

//重写cell创建的初始化方法,创建自定义控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{   
    //局部变量,默认间距
    //头像
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:@"user01_icon"];
    [self.contentView addSubview:iconView];
#pragma mark 添加tableViewCell的子控件 需要将子控件添加到contentView上
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(margin);
        make.top.equalTo(self.contentView.mas_top).offset(margin);
        //装箱
        make.size.mas_offset(CGSizeMake(45, 45));
    }];
    
    //名称
    UILabel *nameLabel = [UILabel makeLabelWithText:@"艾泽拉斯" andTextColor:[UIColor colorWithHex:0x7686a8] andTextFont:14];
    [self.contentView addSubview:nameLabel];
    
    [nameLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(margin);
        make.top.equalTo(iconView.mas_top).offset(0);
    }];
    
    
    //内容
    UILabel *contentLabel = [UILabel makeLabelWithText:@"自泰坦神带给艾泽拉斯世界以秩序后很多年过去了，无数生灵在新的卡利姆多大陆上蓬勃生长着，永恒之井的无尽魔力充盈到艾泽拉斯世界的各个角落，这魔力为每一个地方都带去了无限的生机与活力，甚至，更久远的影响。。。" andTextColor:[UIColor blackColor] andTextFont:14];
    //设置自动换行
    contentLabel.numberOfLines = 0;
    [self.contentView addSubview:contentLabel];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left);
        make.top.equalTo(nameLabel.mas_bottom).offset(margin);
        make.right.equalTo(self.contentView.mas_right).offset(-margin);
    }];
    
    //图片
    UIImageView *picView = [[UIImageView alloc]init];
    picView.image = [UIImage imageNamed:@"pic1"];
    [picView sizeToFit];
    [self.contentView addSubview:picView];
    
    [picView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentLabel.mas_left);
        make.top.equalTo(contentLabel.mas_bottom).offset(margin);
        //图片不确定存在时,不能写死,设置预估行高
        make.height.mas_lessThanOrEqualTo(150);
    }];
    
    //时间
    UILabel *timeLabel = [UILabel makeLabelWithText:@"刚刚" andTextColor:[UIColor colorWithHex:0x949494] andTextFont:13];
    [self.contentView addSubview:timeLabel];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(picView.mas_left);
        make.top.equalTo(picView.mas_bottom).offset(margin);
    }];
    
    //删除按钮
    UIButton *deleteBtn = [[UIButton alloc]init];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor colorWithHex:0x6c7ea2] forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.contentView addSubview:deleteBtn];
    
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(timeLabel.mas_right).offset(margin);
        make.centerY.equalTo(timeLabel.mas_centerY);
    }];
    
    //comment按钮
    UIButton *commentBtn = [[UIButton alloc]init];
    [commentBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [self.contentView addSubview:commentBtn];
    
    [commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-margin);
        make.centerY.equalTo(timeLabel.mas_centerY);
    }];
    
    //创建分割线
    UIImageView *sepLine = [[UIImageView alloc]init];
    sepLine.image = [UIImage imageNamed:@"qi"];
    [self.contentView addSubview:sepLine];
    
    [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        //获取屏幕压缩比例, 1x  2x  3x
        make.height.offset(1 / [UIScreen mainScreen].scale);
        make.top.equalTo(commentBtn.mas_bottom).offset(margin);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    //给属性赋值
    _iconView = iconView;
    _nameLabl = nameLabel;
    _contentLabel = contentLabel;
    _picView = picView;
    _timeLabel  =  timeLabel;
    _deleteBtn = deleteBtn;
}

//重写模型属性的set方法,给模型内部的子控件传递数据
- (void)setMoment:(LLMoment *)moment{
    //给模型赋值传递数据
    _moment = moment;
    
    //头像
    _iconView.image = [UIImage imageNamed:moment.icon];
    //昵称
    _nameLabl.text = moment.name;
    //内容
    _contentLabel.text =  moment.content;
    //图片
    //判断是否模型里是否存在图片数据,并更新约束
    if (_picView) {
        _picView.image = [UIImage imageNamed:moment.picture];
        CGFloat imageRealH = _picView.image.size.width * 150 / _picView.image.size.height;
        [_picView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentLabel.mas_bottom).offset(margin);
            make.width.offset(imageRealH);
        }];
    }else{
        [_picView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentLabel.mas_bottom).offset(0);
        }];
    }
    //时间
    _timeLabel.text = moment.time;
    //是否隐藏删除按钮
    _deleteBtn.hidden = !moment.isMine;
}

@end
