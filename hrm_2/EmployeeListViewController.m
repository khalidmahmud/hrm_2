//
//  EmployeeListViewController.m
//  hrm_2
//
//  Created by Abu Khalid on 12/7/15.
//  Copyright © 2015 Kazi Sharmin Dina. All rights reserved.
//

#import "EmployeeListViewController.h"
#import "AppDelegate.h"
#import "Employee.h"
#import "Department.h"

@interface EmployeeListViewController ()

@end

@implementation EmployeeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.employeeNameArray = [self getEmployeeNames];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)employeeTableView numberOfRowsInSection:(NSInteger)section {
    return [self.employeeNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)employeeTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [employeeTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Employee *employeeObject = [self.employeeNameArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",(employeeObject.name) ? employeeObject.name: @""];
    return cell;
}

#pragma mark - fetch Employee

- (NSArray *)getEmployeeNames {
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    fetchRequest.fetchBatchSize = 30;
    fetchRequest.fetchLimit = 3000;
    NSString *departmentName = @"";
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"departmentOfEmployee.departmantName == %@",departmentName];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                     ascending:YES
                                                                      selector:@selector(localizedStandardCompare:)];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    NSError *error;
    NSArray *employeeName = [context executeFetchRequest:fetchRequest error:&error];
    if (!employeeName) {
        NSLog(@"%@",[error localizedDescription]);
        NSMutableArray *emptyArray = [NSMutableArray array];
        return emptyArray;
    } else {
        self.employeeNameArray = [employeeName valueForKey: @"name"];
    }
    return employeeName;
}

@end
