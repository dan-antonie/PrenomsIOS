//
//  StorageManager.m
//  Prenume2
//
//  Created by Horatiu on 23/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "StorageManager.h"



@interface StorageManager ()
@property (nonatomic, strong) NSManagedObjectModel   *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContextBackgroundQueue;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContextMainQueue;

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator ;
@end

@implementation StorageManager





+ (instancetype)sharedStorageManager
{
    static StorageManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedManager = [[StorageManager alloc] init];
    });
    
    return _sharedManager;
}


-(void) initCoreData
{
    //initializare url catre baza de date (catre fisierul fizic)
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSURL *storeURL = [NSURL fileURLWithPath:[documentsDirectory stringByAppendingPathComponent:@"bazamea.sqlite"]];
    NSError *error = nil;
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    
    //initializare model
    self.managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    
    //initializare persistent store coordinator
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    
    //initializare persistent store
    NSPersistentStore *store  = [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    if (!store) {
        
    }
    
    
    //background context
    _managedObjectContextBackgroundQueue = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [_managedObjectContextBackgroundQueue setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    
    //main context
    _managedObjectContextMainQueue = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _managedObjectContextMainQueue.parentContext = _managedObjectContextBackgroundQueue;
    
}

- (NSManagedObjectContext *)getCoreDataMainContext
{
    return _managedObjectContextMainQueue;
}


- (void)adaugToatePersoaneleInBazaDeDate
{
    //o sa scriu eu functia asta mai incolo
}


@end
