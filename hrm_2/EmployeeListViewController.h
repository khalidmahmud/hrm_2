//
//  EmployeeListViewController.h
//  hrm_2
//
//  Created by Abu Khalid on 12/7/15.
//  Copyright © 2015 Kazi Sharmin Dina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *employeeTableView;

@end
