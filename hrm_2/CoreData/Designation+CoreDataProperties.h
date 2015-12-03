//
//  Designation+CoreDataProperties.h
//  
//
//  Created by Kazi Sharmin Dina on 12/1/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Designation.h"

NS_ASSUME_NONNULL_BEGIN

@interface Designation (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *designation_id;
@property (nullable, nonatomic, retain) NSString *designationName;

@end

NS_ASSUME_NONNULL_END
