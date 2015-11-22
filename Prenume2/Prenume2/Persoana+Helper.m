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
    coreDataPers.prenume = [dictionarDeTransformatInObiect valueForKey:@"PR_prenom"];
    coreDataPers.istorie = [dictionarDeTransformatInObiect valueForKey:@"PR_histoire"];
    coreDataPers.caracter = [dictionarDeTransformatInObiect valueForKey:@"PR_carractere"];
    coreDataPers.isCrestin = [[dictionarDeTransformatInObiect valueForKey:@"PR_Chretien"] boolValue];
    coreDataPers.isMusulman = [[dictionarDeTransformatInObiect valueForKey:@"PR_Musulman"] boolValue];
    coreDataPers.provenienta = [dictionarDeTransformatInObiect valueForKey:@"PR_provenance"];
    coreDataPers.primaLiteraPtSectiune = [coreDataPers.prenume substringToIndex:1];
}

@end
