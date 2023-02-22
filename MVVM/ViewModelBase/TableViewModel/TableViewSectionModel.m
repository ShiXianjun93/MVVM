//
//  TableViewSectionModel.m
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "TableViewSectionModel.h"

@implementation TableViewSectionModel

+ (instancetype)sectionModelWithCellModels:(NSArray<TableViewCellModel *> *)cellModels
                           headerViewModel:(TableViewHeaderFooterViewModel * _Nullable)headerViewModel
                           fotterViewModel:(TableViewHeaderFooterViewModel * _Nullable)fotterViewModel
{
    TableViewSectionModel *sectionModel = [[self alloc] init];
    
    sectionModel.headerViewModel    = headerViewModel;
    sectionModel.arrCellModels      = cellModels.mutableCopy;
    sectionModel.fotterViewModel    = fotterViewModel;
    
    return sectionModel;
}

@end
