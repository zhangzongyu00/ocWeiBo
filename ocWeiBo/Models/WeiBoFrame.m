//
//  WeiBoFrame.m
//  ocWeiBo
//
//  Created by zzy on 2020/11/17.
//

#import "WeiBoFrame.h"
#import "WeiBo.h"
#import <UIKit/UIKit.h>

#define nickNameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]

@implementation WeiBoFrame

- (void)setWeibo:(WeiBo *)weibo{
    _weibo = weibo;
    
    // 计算每个控件的frame和行高
    // 提取统一的间距
    CGFloat margin = 10;
    // 头像
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    // 昵称，自动调整大小
    NSString *nickName = weibo.name;
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + margin;
    CGSize nameSize = [self sizeWithText:nickName andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nickNameFont];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    CGFloat nameY = iconY + (iconH - nameH) / 2 ;
    _nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    // VIP
    CGFloat vipW = 10;
    CGFloat vipH = 10;
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + margin;
    CGFloat vipY = nameY;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    // 正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + margin;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGSize textSize = [self sizeWithText:weibo.text andMaxSize:CGSizeMake(screenW - margin, MAXFLOAT) andFont:textFont];
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    _textFrame = CGRectMake(textX, textY, textW, textH);
    // 图片
    CGFloat picX = iconX;
    CGFloat picY = CGRectGetMaxY(_textFrame) + margin;
    CGFloat picW = 100;
    CGFloat picH = 100;
    _pictureFrame = CGRectMake(picX, picY, picW, picH);
    
    // 计算每行的高度
    CGFloat rowHeight = 0;
    if (self.weibo.picture) {
        rowHeight = CGRectGetMaxY(_pictureFrame) + margin;
    } else {
        rowHeight = CGRectGetMaxY(_textFrame) + margin;
    }
    _rowHeight = rowHeight;
}
- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

@end
