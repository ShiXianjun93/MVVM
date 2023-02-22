//
//  GameHotspotCell.m
//  MVVM
//
//  Created by 石显军 on 2023/2/22.
//

#import "GameHotspotCell.h"
#import "GameHotspotCellModel.h"

@interface GameHotspotCell ()

@property (nonatomic, strong) GameHotspotCellModel *cellModel;

@property (weak, nonatomic) IBOutlet UILabel *lblNumber;
@property (weak, nonatomic) IBOutlet UIView *numberBGView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTag;
@property (weak, nonatomic) IBOutlet UILabel *lblCommentsCount;
@property (weak, nonatomic) IBOutlet UIImageView *imgThumbnail;

@end

@implementation GameHotspotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.numberBGView.layer.cornerRadius = 3;
    self.numberBGView.layer.masksToBounds = true;
    
    self.imgThumbnail.layer.cornerRadius = 6;
    self.imgThumbnail.layer.masksToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellModel:(GameHotspotCellModel *)cellModel
{
    _cellModel = cellModel;
    
    self.lblNumber.text = _cellModel.number.stringValue;
    self.lblTitle.text = _cellModel.title;
    self.lblTag.text = _cellModel.tagName;
    self.lblCommentsCount.text = _cellModel.commentsNumber.stringValue;
//    [self.imgThumbnail setimage]
    
}



@end
