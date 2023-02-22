//
//  ViewController.m
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "ViewController.h"
#import "TableViewModel.h"
#import "GameHotspotCellModel.h"
#import "HomeListServer.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewModel *tableViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    
    [HomeListServer getListDataWithComplete:^(NSError * _Nullable error, NSArray<GameHotspotModel *> * _Nullable models) {
        [self updateListDataWithModels:models];
    }];
}

- (void)updateListDataWithModels:(NSArray<GameHotspotModel *> *)models
{
    NSMutableArray *arrCellModels = [NSMutableArray array];
    
    for (GameHotspotModel *model in models) {
        [arrCellModels addObject:[GameHotspotCellModel cellModelWithGameHotspotModel:model]];
    }
    
    TableViewSectionModel *sectionModel = [TableViewSectionModel sectionModelWithCellModels:arrCellModels headerViewModel:nil fotterViewModel:nil];
    [self.tableViewModel updateSectionModels:@[sectionModel]];
}

#pragma mark - Getter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (TableViewModel *)tableViewModel
{
    if (_tableViewModel == nil) {
        _tableViewModel = [TableViewModel tableViewModelWithTableView:self.tableView];
    }
    return _tableViewModel;
}


@end
