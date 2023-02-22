//
//  HomeListServer.h
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import <Foundation/Foundation.h>
#import "GameHotspotModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeListServer : NSObject

+ (void)getListDataWithComplete:(void (^)(NSError * _Nullable error, NSArray<GameHotspotModel *> * _Nullable models))complete;

@end

NS_ASSUME_NONNULL_END
