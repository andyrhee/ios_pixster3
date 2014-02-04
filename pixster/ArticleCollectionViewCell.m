//
//  ArticleCollectionViewCell.m
//  pixster
//
//  Created by Andy Rhee on 2/4/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ArticleCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ArticleCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    self.layer.borderColor = [[UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1.0] CGColor];
    self.layer.borderWidth = 1.0;
}


@end
