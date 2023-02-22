//
//  HomeListServer.m
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "HomeListServer.h"

@implementation HomeListServer

+ (void)getListDataWithComplete:(void (^)(NSError * _Nullable error, NSArray<GameHotspotModel *> * _Nullable models))complete
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"list.json" ofType:nil];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dicJson = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if ([dicJson isKindOfClass:[NSDictionary class]]) {
        NSArray *list = [dicJson objectForKey:@"list"];
        NSMutableArray<GameHotspotModel *> *array = [NSMutableArray array];
        for (NSDictionary *dict in list) {
            [array addObject:[GameHotspotModel modelWithDict:dict]];
        }
        
        if (complete) {
            complete(nil, array);
        }
    }
}

@end
