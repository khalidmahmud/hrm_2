//
//  EmployeeViewController.m
//  hrm_2
//
//  Created by Kazi Sharmin Dina on 12/3/15.
//  Copyright © 2015 Kazi Sharmin Dina. All rights reserved.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController (){
    NSArray *_pickerData;
}
@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    self.pvDepartmant.dataSource=self;
    self.pvDepartmant.delegate=self;
    
    self.pvDesignation.dataSource=self;
    self.pvDesignation.delegate=self;
    
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
    return _pickerData.count;
}
// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerData[row];
}
- (IBAction)btnSaveEmployee:(id)sender {
}

- (IBAction)btnReset:(id)sender {
}
@end
