//
//  GameHotspotCellModel.m
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "GameHotspotCellModel.h"


@implementation GameHotspotCellModel

+ (instancetype)cellModelWithTitle:(NSString *)title
                            number:(NSNumber *)number
                         coverMime:(NSString *)coverMime
                           tagName:(NSString *)tagName
                    commentsNumber:(NSNumber *)commentsNumber
{
    GameHotspotCellModel *cellModel = [GameHotspotCellModel cellModelWithInitMode:ViewInitializationMode_Xib identifier:@"GameHotspotCell" height:90 didSelectRowCallback:nil];
    
    cellModel.title             = title;
    cellModel.number            = number;
    cellModel.coverMime         = coverMime;
    cellModel.tagName           = tagName;
    cellModel.commentsNumber    = commentsNumber;
    
    return cellModel;
}

+ (instancetype)cellModelWithGameHotspotModel:(GameHotspotModel *)model
{
    GameHotspotCellModel *cellModel = [GameHotspotCellModel cellModelWithTitle:model.title
                                                                        number:model.number
                                                                     coverMime:model.coverMime
                                                                       tagName:model.tagName
                                                                commentsNumber:model.commentsNumber];
    
    return cellModel;
}

@end
