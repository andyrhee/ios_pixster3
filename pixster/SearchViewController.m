//
//  SearchViewController.m
//  pixster
//
//  Created by Timothy Lee on 7/30/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "SearchViewController.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"

#import "ContainerCell.h"
#import "ContainerCellView.h"

@interface SearchViewController ()

@property (nonatomic, strong) NSMutableArray *imageResults;
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *sampleData;

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Pixster";
        self.imageResults = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sampleData = @[ @{ @"description": @"Section A",
                            @"articles": @[ @{ @"title": @"Article A1" },
                                            @{ @"title": @"Article A2" },
                                            @{ @"title": @"Article A3" },
                                            @{ @"title": @"Article A4" },
                                            @{ @"title": @"Article A5" }
                                            ]
                            },
                         @{ @"description": @"Section B",
                            @"articles": @[ @{ @"title": @"Article B1" },
                                            @{ @"title": @"Article B2" },
                                            @{ @"title": @"Article B3" },
                                            @{ @"title": @"Article B4" },
                                            @{ @"title": @"Article B5" }
                                            ]
                            },
                         @{ @"description": @"Section C",
                            @"articles": @[ @{ @"title": @"Article C1" },
                                            @{ @"title": @"Article C2" },
                                            @{ @"title": @"Article C3" },
                                            @{ @"title": @"Article C4" },
                                            @{ @"title": @"Article C5" }
                                            ]
                            },
                         @{ @"description": @"Section D",
                            @"articles": @[ @{ @"title": @"Article D1" },
                                            @{ @"title": @"Article D2" },
                                            @{ @"title": @"Article D3" },
                                            @{ @"title": @"Article D4" },
                                            @{ @"title": @"Article D5" }
                                            ]
                            },
                         @{ @"description": @"Section E",
                            @"articles": @[ @{ @"title": @"Article E1" },
                                            @{ @"title": @"Article E2" },
                                            @{ @"title": @"Article E3" },
                                            @{ @"title": @"Article E4" },
                                            @{ @"title": @"Article E5" }
                                            ]
                            },
                         @{ @"description": @"Section F",
                            @"articles": @[ @{ @"title": @"Article F1" },
                                            @{ @"title": @"Article F2" },
                                            @{ @"title": @"Article F3" },
                                            @{ @"title": @"Article F4" },
                                            @{ @"title": @"Article F5" }
                                            ]
                            },
                         ];
    
    // Register the table cell
    [self.tableView registerClass:[ContainerCell class] forCellReuseIdentifier:@"ContainerCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return 1;
    //return [self.sampleData count];
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [self.imageResults count];
    //return 1;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UIImageView *imageView = nil;
    const int IMAGE_TAG = 1;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.tag = IMAGE_TAG;
        [cell.contentView addSubview:imageView];
    } else {
        imageView = (UIImageView *)[cell.contentView viewWithTag:IMAGE_TAG];
    }
    
    // Clear the previous image
    imageView.image = nil;
    [imageView setImageWithURL:[NSURL URLWithString:[self.imageResults[indexPath.row] valueForKeyPath:@"url"]]];
    
    return cell;
}
 */

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContainerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContainerCell" ];
    
    if (cell == nil) {
        cell = [[ContainerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContainerCell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    //NSDictionary *cellData = [self.sampleData objectAtIndex:[indexPath section]];
    NSArray *cellData = self.imageResults;

    [cell setCollectionData:cellData];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This code is commented out in order to allow users to click on the collection view cells.
    //    if (!self.detailViewController) {
    //        self.detailViewController = [[ORGDetailViewController alloc] initWithNibName:@"ORGDetailViewController" bundle:nil];
    //    }
    //    NSDate *object = _objects[indexPath.row];
    //    self.detailViewController.detailItem = object;
    //    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

#pragma mark UITableViewDelegate methods

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *sectionData = [self.sampleData objectAtIndex:section];
    NSString *header = [sectionData objectForKey:@"description"];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //return 300;
    return 100.0;
}

#pragma mark - UISearchDisplay delegate

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller {
    [self.imageResults removeAllObjects];
    [self.searchDisplayController.searchResultsTableView reloadData];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return NO;
}

#pragma mark - UISearchBar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=%@&start=8&rsz=8", [searchBar.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        id results = [JSON valueForKeyPath:@"responseData.results"];
        if ([results isKindOfClass:[NSArray class]]) {
            [self.imageResults removeAllObjects];
            [self.imageResults addObjectsFromArray:results];
            [self.searchDisplayController.searchResultsTableView reloadData];
            NSLog(@"imageResults: %@", self.imageResults);
        }
    } failure:nil];
    
    [operation start];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    return YES;
}

@end
