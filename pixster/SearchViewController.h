//
//  SearchViewController.h
//  pixster
//
//  Created by Timothy Lee on 7/30/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface SearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
