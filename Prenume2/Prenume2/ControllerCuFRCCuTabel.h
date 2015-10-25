//
//  ControllerCuFRCCuTabel.h
//  ProiectCuCoreData
//
//  Created by Horatiu on 26/09/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "StorageManager.h"

@interface ControllerCuFRCCuTabel : UIViewController<NSFetchedResultsControllerDelegate>
/*
 Controllerul asta o sa fie clasa de baza pentru toate controllerele cu tabel pe care le ai.
 Are scrise in el initializarea pt Core Data si functii de update pt FRC.
 Tre sa implementezi metodele de mai jos
 */

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContextMainQueue;
@property (nonatomic, strong) NSFetchedResultsController    *fetchedResultsController;
//metode care tre implementate in controllerul care extinde controllerul asta
- (NSString *)entityName;
- (NSPredicate *)fetchPredicate;
- (NSString *)sectionNameKeyPath;
- (NSArray *)arrayDeSortDescriptors;
@end
