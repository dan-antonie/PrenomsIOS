//
//  Persoana.h
//  Prenume2
//
//  Created by Horatiu on 23/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Persoana : NSManagedObject

@property (nonatomic, retain) NSString * caracter;
@property (nonatomic, retain) NSString * idPrenume;
@property (nonatomic) BOOL isCrestin;
@property (nonatomic) BOOL isMusulman;
@property (nonatomic, retain) NSString * istorie;
@property (nonatomic, retain) NSString * prenume;
@property (nonatomic, retain) NSString * provenienta;
@property (nonatomic, retain) NSString * primaLiteraPtSectiune;

@end
