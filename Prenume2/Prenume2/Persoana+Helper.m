//
//  Persoana+Helper.m
//  Prenume2
//
//  Created by Horatiu on 23/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "Persoana+Helper.h"

@implementation Persoana (Helper)

+ (void)insertOrUpdateCoreDataObject:(id<CoreDataObjectWriter>)coreDataObject forDictionary:(NSDictionary*)dictionarDeTransformatInObiect inContext:(NSManagedObjectContext *)managedObjectContext
{
    Persoana *coreDataPers = nil;
    
    if (coreDataObject) {
        
        //daca obiectul exista deja, il folosesc, adica ii updates proprietatile
        coreDataPers = (Persoana *)coreDataObject;
    } else {
        //daca nu exista, il creez (cazul de baza)
        coreDataPers = [NSEntityDescription insertNewObjectForEntityForName:@"Persoana" inManagedObjectContext:managedObjectContext];
    }
    
    //setez proprietatile obiectului
    coreDataPers.idPrenume = [dictionarDeTransformatInObiect valueForKey:@"idPrenume"];

}

@end
