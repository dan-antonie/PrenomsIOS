//
//  StorageManager.h
//  Prenume2
//
//  Created by Horatiu on 23/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define kStorageManager [StorageManager sharedStorageManager]


@interface StorageManager : NSObject
+ (instancetype)sharedStorageManager;

- (NSManagedObjectContext *)getCoreDataMainContext;
- (void) initCoreData;

- (void)adaugToatePersoaneleInBazaDeDate;



@end
