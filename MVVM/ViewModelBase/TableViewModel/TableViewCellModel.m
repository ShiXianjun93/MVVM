//
//  TableViewCellModel.m
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "TableViewCellModel.h"

@implementation TableViewCellModel

+ (instancetype)cellModelWithInitMode:(ViewInitializationMode)initMode
                           identifier:(NSString *)identifier
                               height:(CGFloat)height
                 didSelectRowCallback:(TableViewDidSelectRowCallback _Nullable)didSelectRowCallback
{
    TableViewCellModel *cellModel = [[self alloc] init];
    
    cellModel.initMode              = initMode;
    cellModel.identifier            = identifier;
    cellModel.height                = height;
    cellModel.didSelectRowCallback  = didSelectRowCallback;
    
    return cellModel;
}

@end
