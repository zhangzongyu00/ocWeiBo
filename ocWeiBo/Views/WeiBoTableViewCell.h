//
//  WeiBoTableViewCell.h
//  ocWeiBo
//
//  Created by zzy on 2020/11/17.
//

#import <UIKit/UIKit.h>
@class WeiBoFrame;

NS_ASSUME_NONNULL_BEGIN

@interface WeiBoTableViewCell : UITableViewCell

@property (nonatomic, strong) WeiBoFrame *weiboFrame;

+ (instancetype)weiboCellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
