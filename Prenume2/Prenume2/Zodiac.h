//
//  Zodiac.h
//  Prenume2
//
//  Created by Horatiu on 23/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Zodiac : NSManagedObject

@property (nonatomic, retain) NSString * caracter;
@property (nonatomic, retain) NSString * compatibilCu;
@property (nonatomic) NSTimeInterval idZodiac;
@property (nonatomic, retain) NSString * incompatibilCu;
@property (nonatomic, retain) NSString * numeZodiac;
@property (nonatomic, retain) NSString * ziuaInceput;
@property (nonatomic) NSTimeInterval ziuaSfarsit;

@end
