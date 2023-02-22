//
//  TableViewHeaderFooterViewModel.h
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import <Foundation/Foundation.h>
#import "ViewModelEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewHeaderFooterViewModel : NSObject

@property (nonatomic, assign) ViewInitializationMode initMode;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, assign) CGFloat height;

@end

NS_ASSUME_NONNULL_END
