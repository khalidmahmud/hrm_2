//
//  EmployeeViewController.m
//  hrm_2
//
//  Created by Kazi Sharmin Dina on 12/3/15.
//  Copyright © 2015 Kazi Sharmin Dina. All rights reserved.
//

#import "EmployeeViewController.h"
#import "AppDelegate.h"
#import "Department.h"
#import "Designation.h"
#import "Employee.h"

@interface EmployeeViewController (){
    NSArray *_pickerDatafordepartment;
    NSArray *_pickerDatafordesignation;
}
@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pickerDatafordepartment= [self getDepartmentNames];
    _pickerDatafordesignation=[self getDesignations];
    self.pvDepartmant.dataSource=self;
    self.pvDepartmant.delegate=self;
    self.pvDesignation.dataSource=self;
    self.pvDesignation.delegate=self;
  }

- (NSArray *)getDepartmentNames {
    
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Department" inManagedObjectContext:context];
    fetchRequest.entity = entity;
    NSError *error;
    NSArray *departmentName = [context executeFetchRequest:fetchRequest error:&error];
    if (!departmentName) {
        NSLog(@"%@",[error localizedDescription]);
        NSMutableArray *emptyArray = [NSMutableArray array];
        return emptyArray;
    }
    NSLog(@"getdepartment\n");
    return departmentName;
}

- (NSArray *)getDesignations {
    
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Designation" inManagedObjectContext:context];
    fetchRequest.entity = entity;
    NSError *error;
    NSArray *departmentName = [context executeFetchRequest:fetchRequest error:&error];
    if (!departmentName) {
        NSLog(@"%@",[error localizedDescription]);
        NSMutableArray *emptyArray = [NSMutableArray array];
        return emptyArray;
    }
    NSLog(@"getdesignation\n");
    return departmentName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// The number of rows of data
- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if([pickerView isEqual:self.pvDesignation]) {
        return _pickerDatafordesignation.count;
    }
    else {
        return _pickerDatafordepartment.count;
    }
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if([pickerView isEqual:self.pvDesignation]) {
        Designation *depInfo = _pickerDatafordesignation[row];
        return depInfo.designationName;
    }
    else {
        Department *depInfo = _pickerDatafordepartment[row];
        return depInfo.departmantName;
    }
  }

- (IBAction)btnSaveEmployee:(id)sender {
}

- (IBAction)btnReset:(id)sender {
    
    self.txtName.text=@"";
    self.txtBirthPlace.text=@"";
    self.txtStatus.text=@"";
    self.txtPhone.text=@"";
    
}
@end
