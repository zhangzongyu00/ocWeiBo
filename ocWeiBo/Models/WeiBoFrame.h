//
//  WeiBoFrame.h
//  ocWeiBo
//
//  Created by zzy on 2020/11/17.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class WeiBo;

NS_ASSUME_NONNULL_BEGIN

@interface WeiBoFrame : NSObject

@property (nonatomic, strong) WeiBo *weibo;

@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect pictureFrame;
@property (nonatomic, assign, readonly) CGRect nameFrame;
@property (nonatomic, assign, readonly) CGRect vipFrame;

@property (nonatomic, assign, readonly) CGFloat rowHeight;

@end

NS_ASSUME_NONNULL_END
