//
//  WeiBo.m
//  ocWeiBo
//
//  Created by zzy on 2020/11/17.
//

#import "WeiBo.h"

@implementation WeiBo

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weiboWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
