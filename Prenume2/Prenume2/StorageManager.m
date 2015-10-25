//
//  StorageManager.m
//  Prenume2
//
//  Created by Horatiu on 23/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "StorageManager.h"
#import "SQLHelper.h"
#import "Persoana+Helper.h"
#import "Zodiac+Helper.h"


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

- (NSString *)generateUniqueStringForFetchedResultControllerCache
{
    NSString *UUID = [[NSUUID UUID] UUIDString];
    return UUID;
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


- (void)salvareBazaDeDate
{
    NSManagedObjectContext *mocMain = _managedObjectContextMainQueue;
    NSManagedObjectContext *private = _managedObjectContextBackgroundQueue;

    
    if (!mocMain) return;
    if ([mocMain hasChanges]) {
        [mocMain performBlockAndWait:^{
            NSError *error = nil;
            [mocMain save:&error];
        }];
    }
    
    void (^savePrivate) (void) = ^{
        NSError *error2 = nil;
        [private save:&error2];
    };
    if ([private hasChanges]) {
        [private performBlockAndWait:savePrivate];
    }
 
}


- (void)adaugToatePersoaneleInBazaDeDate
{
    //o sa scriu eu functia asta mai incolo
    
   // NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"prenom" ofType:@"sqlite"];

    NSString *databasePath = @"/Users/horatiu/prenom.sqlite";
    
    SQLHelper *db = [[SQLHelper alloc] initWithContentsOfFile:databasePath]; // specify full file path
    
    // repeat these 3 steps for every table
    NSArray *allContents = [db executeQuery:@"SELECT * FROM Prenom"];
    
    
    for (int i = 0; i < [allContents count]; i++) {
        NSDictionary *aDic = [allContents objectAtIndex:i];
        [Persoana insertOrUpdateCoreDataObject:nil forDictionary:aDic inContext:_managedObjectContextMainQueue];
        
    }
    
    [self salvareBazaDeDate];
}


@end
