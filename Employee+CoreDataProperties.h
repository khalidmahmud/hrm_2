//
//  Employee+CoreDataProperties.h
//  
//
//  Created by Kazi Sharmin Dina on 12/1/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *employee_id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *departmant_id;
@property (nullable, nonatomic, retain) NSString *placeOfBirth;
@property (nullable, nonatomic, retain) NSDate *birthDate;
@property (nullable, nonatomic, retain) NSDecimalNumber *phone;
@property (nullable, nonatomic, retain) NSNumber *designation_id;
@property (nullable, nonatomic, retain) NSString *status;
@property (nullable, nonatomic, retain) NSNumber *active;

@end

NS_ASSUME_NONNULL_END
