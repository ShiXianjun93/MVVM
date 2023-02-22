//
//  TableViewCellModel.h
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import <UIKit/UIKit.h>
#import "ViewModelEnum.h"

@class TableViewCellModel;

NS_ASSUME_NONNULL_BEGIN

typedef void (^ TableViewDidSelectRowCallback)(UITableView *tableView, NSIndexPath *indexPath, TableViewCellModel *cellModel);

@interface TableViewCellModel : NSObject

@property (nonatomic, assign) ViewInitializationMode initMode;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, copy, nullable) TableViewDidSelectRowCallback didSelectRowCallback;

+ (instancetype)cellModelWithInitMode:(ViewInitializationMode)initMode
identifier:(NSString *)identifier
height:(CGFloat)height didSelectRowCallback:(TableViewDidSelectRowCallback _Nullable)didSelectRowCallback;

@end

NS_ASSUME_NONNULL_END
