//
//  WeiBoTableViewCell.m
//  ocWeiBo
//
//  Created by zzy on 2020/11/17.
//

#import "WeiBoTableViewCell.h"
#import "WeiBo.h"
#import "WeiBoFrame.h"

@interface WeiBoTableViewCell ()

@property (nonatomic, weak) UIImageView *imgIcon;
@property (nonatomic, weak) UILabel *nickName;
@property (nonatomic, weak) UIImageView *imgVip;
@property (nonatomic, weak) UILabel *text;
@property (nonatomic, weak) UIImageView *pic;

@end

@implementation WeiBoTableViewCell

+ (instancetype)weiboCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"weibo_cell";
    WeiBoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WeiBoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 重写单元格的initWithStyle方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 创建5个子控件
        UIImageView *imgIcon = [[UIImageView alloc] init];  // 头像
        [self.contentView addSubview:imgIcon];
        self.imgIcon = imgIcon;
        
        UILabel *nickName = [[UILabel alloc] init]; // 昵称
        nickName.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:nickName];
        self.nickName = nickName;
        
        UIImageView *imgVip = [[UIImageView alloc] init];   // 会员
        imgVip.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:imgVip];
        self.imgVip = imgVip;
        
        UILabel *text = [[UILabel alloc] init]; // 正文
        text.font = [UIFont systemFontOfSize:14];
        text.numberOfLines = 0; // 自动换行
        [self.contentView addSubview:text];
        self.text = text;
        
        UIImageView *pic = [[UIImageView alloc] init];  // 配图
        [self.contentView addSubview:pic];
        self.pic = pic;
    }
    // 取消单元格的背景颜色，让其显示UITableView的背景色
    self.backgroundColor = [UIColor clearColor];
    return self;
}

#pragma mark - 重写WeiBoFrame属性的set方法
- (void)setWeiboFrame:(WeiBoFrame *)weiboFrame{
    _weiboFrame = weiboFrame;
    
    // 设置单元格子控件的数据
    [self settingData];
    // 设置单元格子控件的frame
    [self settingFrame];
}
// 设置数据方法
- (void)settingData{
    WeiBo *model = self.weiboFrame.weibo;
    
    self.imgIcon.image = [UIImage imageNamed:model.icon];   // 头像
    
    self.nickName.text = model.name;    // 昵称
    
    if (model.isVip) {  // 会员
        self.imgVip.hidden = NO;
        self.nickName.textColor = UIColor.redColor;
    }else{
        self.imgVip.hidden = YES;
    }
    
    self.text.text = model.text;    // 正文
    
    if (self.pic) { // 配图
        self.pic.image = [UIImage imageNamed:model.picture];
        self.pic.hidden = NO;
    }else{
        self.pic.hidden = YES;
    }
}
// 设置frame方法
- (void)settingFrame{
    self.imgIcon.frame = self.weiboFrame.iconFrame;
    self.nickName.frame = self.weiboFrame.nameFrame;
    self.imgVip.frame = self.weiboFrame.vipFrame;
    self.text.frame = self.weiboFrame.textFrame;
    self.pic.frame = self.weiboFrame.pictureFrame;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
