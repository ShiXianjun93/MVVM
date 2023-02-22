//
//  TableViewModel.m
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "TableViewModel.h"

@interface TableViewModel ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readwrite) NSArray<TableViewSectionModel *> *arrSectionModels;

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation TableViewModel

+ (instancetype)tableViewModelWithTableView:(UITableView *)tableView
{
    TableViewModel *tableViewModel = [[self alloc] init];
    tableViewModel.tableView = tableView;
    tableView.dataSource = tableViewModel;
    tableView.delegate = tableViewModel;
    return tableViewModel;
}

#pragma mark - Public
- (void)updateSectionModels:(NSArray<TableViewSectionModel *> *)arrSectionModels
{
    self.arrSectionModels = arrSectionModels;
    [self tableViewRegisterWithSectionModels:self.arrSectionModels];
    [self.tableView reloadData];
}

#pragma mark - Private
- (void)tableViewRegisterWithSectionModels:(NSArray<TableViewSectionModel *> *)arrSectionModels
{
    NSMutableSet<NSString *> *setHeaderFotterCodeIdentifier = [NSMutableSet set];
    NSMutableSet<NSString *> *setHeaderFotterXibIdentifier = [NSMutableSet set];
    
    NSMutableSet<NSString *> *setCellCodeIdentifier = [NSMutableSet set];
    NSMutableSet<NSString *> *setCellXibIdentifier = [NSMutableSet set];
    
    for (TableViewSectionModel *sectionModel in arrSectionModels) {
        if (sectionModel.headerViewModel != nil) {
            if (sectionModel.headerViewModel.initMode == ViewInitializationMode_Code) {
                [setHeaderFotterCodeIdentifier addObject:sectionModel.headerViewModel.identifier];
            } else {
                [setHeaderFotterXibIdentifier addObject:sectionModel.headerViewModel.identifier];
            }
        }
        
        if (sectionModel.fotterViewModel != nil) {
            if (sectionModel.fotterViewModel.initMode == ViewInitializationMode_Code) {
                [setHeaderFotterCodeIdentifier addObject:sectionModel.fotterViewModel.identifier];
            } else {
                [setHeaderFotterXibIdentifier addObject:sectionModel.fotterViewModel.identifier];
            }
        }
        
        for (TableViewCellModel *cellModel in sectionModel.arrCellModels) {
            if (cellModel.initMode == ViewInitializationMode_Code) {
                [setCellCodeIdentifier addObject:cellModel.identifier];
            } else {
                [setCellXibIdentifier addObject:cellModel.identifier];
            }
        }
    }
    
    [setHeaderFotterCodeIdentifier.allObjects enumerateObjectsUsingBlock:^(NSString * _Nonnull identifier, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.tableView registerClass:NSClassFromString(identifier) forHeaderFooterViewReuseIdentifier:identifier];
    }];
    
    [setHeaderFotterXibIdentifier.allObjects enumerateObjectsUsingBlock:^(NSString * _Nonnull identifier, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]] forHeaderFooterViewReuseIdentifier:identifier];
    }];
    
    [setCellCodeIdentifier.allObjects enumerateObjectsUsingBlock:^(NSString * _Nonnull identifier, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.tableView registerClass:NSClassFromString(identifier) forCellReuseIdentifier:identifier];
    }];
    
    [setCellXibIdentifier.allObjects enumerateObjectsUsingBlock:^(NSString * _Nonnull identifier, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    }];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrSectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TableViewSectionModel *sectionModel = self.arrSectionModels[section];
    return sectionModel.arrCellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewSectionModel *sectionModel = self.arrSectionModels[indexPath.section];
    TableViewCellModel *cellModel = sectionModel.arrCellModels[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.identifier forIndexPath:indexPath];
    
    SEL setCellModelSEL = NSSelectorFromString(@"setCellModel:");
    
    if ([cell respondsToSelector:setCellModelSEL]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        [cell performSelector:setCellModelSEL withObject:cellModel];
        
#pragma clang diagnostic pop
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewSectionModel *sectionModel = self.arrSectionModels[indexPath.section];
    TableViewCellModel *cellModel = sectionModel.arrCellModels[indexPath.row];
    
    if (cellModel.didSelectRowCallback) {
        cellModel.didSelectRowCallback(tableView, indexPath, cellModel);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewSectionModel *sectionModel = self.arrSectionModels[indexPath.section];
    TableViewCellModel *cellModel = sectionModel.arrCellModels[indexPath.row];
    return cellModel.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    TableViewSectionModel *sectionModel = self.arrSectionModels[section];
    if (sectionModel.headerViewModel == nil) return 0;
    return sectionModel.headerViewModel.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    TableViewSectionModel *sectionModel = self.arrSectionModels[section];
    if (sectionModel.fotterViewModel == nil) return 0;
    return sectionModel.fotterViewModel.height;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TableViewSectionModel *sectionModel = self.arrSectionModels[section];
    if (sectionModel.headerViewModel == nil) return nil;
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionModel.headerViewModel.identifier];
    
    SEL setCellModelSEL = NSSelectorFromString(@"setHeaderModel:");
    
    if ([headerView respondsToSelector:setCellModelSEL]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        [headerView performSelector:setCellModelSEL withObject:sectionModel.headerViewModel];
        
#pragma clang diagnostic pop
    }
    
    return headerView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    TableViewSectionModel *sectionModel = self.arrSectionModels[section];
    if (sectionModel.fotterViewModel == nil) return nil;
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionModel.fotterViewModel.identifier];
    
    SEL setCellModelSEL = NSSelectorFromString(@"setFotterModel:");
    
    if ([headerView respondsToSelector:setCellModelSEL]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        [headerView performSelector:setCellModelSEL withObject:sectionModel.fotterViewModel];
        
#pragma clang diagnostic pop
    }
    
    return headerView;
}

@end
