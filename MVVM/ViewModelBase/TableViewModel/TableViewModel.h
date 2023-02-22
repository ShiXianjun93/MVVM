//
//  TableViewModel.h
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import <UIKit/UIKit.h>
#import "TableViewSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewModel : NSObject

+ (instancetype)tableViewModelWithTableView:(UITableView *)tableView;


- (void)updateSectionModels:(NSArray<TableViewSectionModel *> *)arrSectionModels;




@end

NS_ASSUME_NONNULL_END
