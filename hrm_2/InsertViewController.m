//
//  InsertViewController.m
//  hrm_2
//
//  Created by Tahia Ata on 12/10/15.
//  Copyright © 2015 Kazi Sharmin Dina. All rights reserved.
//

#import "InsertViewController.h"
#import "Department.h"
#import "Designation.h"
#import "Appdelegate.h"

@interface InsertViewController ()

@end

@implementation InsertViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma mark - IBActions

- (IBAction)addDepartmentButton:(id)sender {
    if ([self.departmentNameField.text length] > 0) {
        BOOL check = [self checkNameExist:self.departmentNameField.text entityName: @"Department"];

        if(!check) {
            [self insertDepartments:self.departmentNameField.text];
            self.departmentNameField.text = @"";
        } else {
            NSLog(@"can not add");
        }
    } else {
      NSLog(@"Department TextField Empty");
    }
}

- (IBAction)addDesignationButton:(id)sender {
    if ([self.designationNameField.text length] > 0) {
        BOOL check = [self checkNameExist:self.designationNameField.text entityName:@"Designation"];
        if (!check) {
            [self insertDesignation:self.designationNameField.text];
            self.designationNameField.text = @"";
        } else {
            NSLog(@"can not add");
        }
    } else {
        NSLog(@"Designation TextField Empty");
    }
}

- (IBAction)dissmissViewButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIEvent

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Public

- (void) insertDepartments:(NSString *) theDepartmentName {
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    Department *departmentObject = [NSEntityDescription insertNewObjectForEntityForName: @"Department" inManagedObjectContext:context];
    departmentObject.departmantName = theDepartmentName;
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    NSLog(@"done");
}

- (void) insertDesignation:(NSString *)theDesignationName {
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    Designation *designationObject = [NSEntityDescription insertNewObjectForEntityForName: @"Designation" inManagedObjectContext:context];
    designationObject.designationName = self.designationNameField.text;
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    NSLog(@"done");
}

- (BOOL) checkNameExist:(NSString *)theName entityName:(NSString *)theEntity {
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:theEntity];
    if ([theEntity isEqualToString:@"Department"]) {
        [request setPredicate:[NSPredicate predicateWithFormat:@"departmantName = %@", theName]];
    } else {
        [request setPredicate:[NSPredicate predicateWithFormat:@"designationName = %@", theName]];
    }
    [request setFetchLimit:1];
    NSError *error;
    NSUInteger count = [context countForFetchRequest:request error:&error];
    if (count == NSNotFound || count > 0) {
        return YES;
    }
    return NO;
}


@end
