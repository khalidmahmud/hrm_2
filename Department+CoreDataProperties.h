//
//  Department+CoreDataProperties.h
//  
//
//  Created by Kazi Sharmin Dina on 12/1/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Department.h"

NS_ASSUME_NONNULL_BEGIN

@interface Department (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *departmant_id;
@property (nullable, nonatomic, retain) NSString *departmantName;

@end

NS_ASSUME_NONNULL_END
