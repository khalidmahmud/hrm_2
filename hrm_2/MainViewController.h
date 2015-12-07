//
//  MainViewController.h
//  hrm_2
//
//  Created by Tahia Ata on 12/1/15.
//  Copyright © 2015 Kazi Sharmin Dina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (strong, nonatomic) NSArray *departmentArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (NSArray *)getDepartmentNames;

@end
