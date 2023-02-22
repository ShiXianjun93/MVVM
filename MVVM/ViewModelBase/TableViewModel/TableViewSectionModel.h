//
//  TableViewSectionModel.h
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import <Foundation/Foundation.h>
#import "TableViewCellModel.h"
#import "TableViewHeaderFooterViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewSectionModel : NSObject

@property (nonatomic, strong, nullable) TableViewHeaderFooterViewModel *headerViewModel;

@property (nonatomic, strong) NSMutableArray<TableViewCellModel *> *arrCellModels;

@property (nonatomic, strong, nullable) TableViewHeaderFooterViewModel *fotterViewModel;

+ (instancetype)sectionModelWithCellModels:(NSArray<TableViewCellModel *> *)cellModels
                           headerViewModel:(TableViewHeaderFooterViewModel * _Nullable)headerViewModel
                           fotterViewModel:(TableViewHeaderFooterViewModel * _Nullable)fotterViewModel;

@end

NS_ASSUME_NONNULL_END
