//
//  ArticleCollectionViewCell.h
//  pixster
//
//  Created by Andy Rhee on 2/4/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCollectionViewCell : UICollectionViewCell
@property (weak) IBOutlet UIImageView *articleImage;
@property (weak) IBOutlet UILabel *articleTitle;
@end
