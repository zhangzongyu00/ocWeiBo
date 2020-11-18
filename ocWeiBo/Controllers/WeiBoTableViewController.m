//
//  WeiBoTableViewController.m
//  ocWeiBo
//
//  Created by zzy on 2020/11/17.
//

#import "WeiBoTableViewController.h"
#import "WeiBo.h"
#import "WeiBoFrame.h"
#import "WeiBoTableViewCell.h"

@interface WeiBoTableViewController ()

//@property (nonatomic, strong) NSArray *weibos;
@property (nonatomic, strong) NSArray *weiboFrames;

@end

@implementation WeiBoTableViewController

#pragma mark - 懒加载数据
- (NSArray *)weiboFrames{
    if (_weiboFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            WeiBo *model = [WeiBo weiboWithDict:dict];
            WeiBoFrame *modelFrame = [[WeiBoFrame alloc] init];
            modelFrame.weibo = model;
            [arrayModels addObject:modelFrame];
        }
        _weiboFrames = arrayModels;
    }
    return _weiboFrames;
}
//- (NSArray *)weibos{
//    if (_weibos == nil) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
//        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
//        NSMutableArray *arrayModels = [NSMutableArray array];
//        for (NSDictionary *dict in arrayDict) {
//            WeiBo *model = [WeiBo weiboWithDict:dict];
//            [arrayModels addObject:model];
//        }
//        _weibos = arrayModels;
//    }
//    return _weibos;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 设置UITableView背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weiboFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 获取模型数据
    WeiBoFrame *model = self.weiboFrames[indexPath.row];
    // 创建单元格
    WeiBoTableViewCell *cell = [WeiBoTableViewCell weiboCellWithTableView:tableView];
    // 设置单元格数据
    cell.weiboFrame = model;
    // 返回单元格
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeiBoFrame *weiboFrames = self.weiboFrames[indexPath.row];
    return weiboFrames.rowHeight;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
