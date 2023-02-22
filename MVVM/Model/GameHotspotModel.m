//
//  GameHotspotModel.m
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "GameHotspotModel.h"

@implementation GameHotspotModel

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    GameHotspotModel *model = [[self alloc] init];
    
    model.title             = [dict objectForKey:@"title"];
    model.coverMime         = [dict objectForKey:@"coverMime"];
    model.number            = [dict objectForKey:@"number"];
    model.tagName           = [dict objectForKey:@"tagName"];
    model.commentsNumber    = [dict objectForKey:@"commentsNumber"];
    
    return model;
}

@end
