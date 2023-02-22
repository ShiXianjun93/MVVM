//
//  GameHotspotCellModel.h
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "TableViewCellModel.h"
#import "GameHotspotModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameHotspotCellModel : TableViewCellModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSNumber *number;

@property (nonatomic, copy) NSString *coverMime;

@property (nonatomic, copy) NSString *tagName;

@property (nonatomic, copy) NSNumber *commentsNumber;

+ (instancetype)cellModelWithTitle:(NSString *)title
                            number:(NSNumber *)number
                         coverMime:(NSString *)coverMime
                           tagName:(NSString *)tagName
                    commentsNumber:(NSNumber *)commentsNumber;

+ (instancetype)cellModelWithGameHotspotModel:(GameHotspotModel *)model;


@end

NS_ASSUME_NONNULL_END
