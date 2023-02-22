//
//  GameHotspotModel.h
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameHotspotModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSNumber *number;

@property (nonatomic, copy) NSString *coverMime;

@property (nonatomic, copy) NSString *tagName;

@property (nonatomic, copy) NSNumber *commentsNumber;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
