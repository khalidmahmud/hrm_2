//
//  InsertViewController.h
//  hrm_2
//
//  Created by Tahia Ata on 12/10/15.
//  Copyright © 2015 Kazi Sharmin Dina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsertViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *departmentNameField;
@property (weak, nonatomic) IBOutlet UITextField *designationNameField;

- (void) insertDepartments:(NSString *)theDepartmentName;
- (void) insertDesignation:(NSString *)theDesignationName;
- (BOOL) checkNameExist:(NSString *)theName entityName:(NSString *)theEntity;

- (IBAction)addDepartmentButton:(id)sender;
- (IBAction)addDesignationButton:(id)sender;
- (IBAction)dissmissViewButton:(id)sender;

@end
