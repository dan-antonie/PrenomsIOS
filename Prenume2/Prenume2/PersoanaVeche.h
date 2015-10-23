//
//  Persoana.h
//  Prenume2
//
//  Created by Horatiu on 15/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersoanaVeche : NSObject<NSCoding>

@property(nonatomic, strong) NSString *prenume;
@property (nonatomic, strong) NSString *origine;
@property (nonatomic, strong) NSString *religie;
@property (nonatomic, strong) NSString *calitati;
@property (nonatomic, assign) int vechime;
@property(nonatomic, strong) NSString *sex;
+(NSMutableArray*) arrayCuPersoane;
@end
