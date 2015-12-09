//
//  MainViewController.h
//  hrm_2
//
//  Created by Tahia Ata on 12/1/15.
//  Copyright © 2015 Kazi Sharmin Dina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (strong, nonatomic) NSArray *departmentArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *filteredSearchResults;
@property (strong, nonatomic) UIView *disableViewOverlay;
@property (assign, nonatomic) BOOL isFiltered;

- (void)addingDisableOverlay;
- (NSArray *)getDepartmentNames;

@end
