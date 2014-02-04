//
//  ContainerCell.m
//  pixster
//
//  Created by Andy Rhee on 2/4/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ContainerCell.h"
#import "ContainerCellView.h"

@interface ContainerCell ()
@property (strong, nonatomic) ContainerCellView *collectionView;
@end

@implementation ContainerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _collectionView = [[NSBundle mainBundle] loadNibNamed:@"ContainerCellView" owner:self options:nil][0];
        _collectionView.frame = self.bounds;
        [self.contentView addSubview:_collectionView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setCollectionData:(NSArray *)collectionData {
    [_collectionView setCollectionData:collectionData];
}

@end
