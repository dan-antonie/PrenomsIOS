//
//  Persoana.m
//  Prenume2
//
//  Created by Horatiu on 15/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "PersoanaVeche.h"

@implementation PersoanaVeche

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_origine forKey:@"cheieorigine"];
    [aCoder encodeObject:_prenume forKey:@"cheie_prenume"];
    [aCoder encodeInt:_vechime forKey:@"cheie_vechime"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self != nil ) {
        
        self.origine =  [aDecoder decodeObjectForKey:@"cheieorigine"];
        
    }
    return self;
}
+(NSMutableArray*) arrayCuPersoane{
    NSMutableArray *unArray =[[NSMutableArray alloc]init];
    PersoanaVeche *oPersona = [[PersoanaVeche alloc]init];
    oPersona.prenume = @"Ion";
    oPersona.sex = @ "M";
    oPersona.calitati = @ "Om bun. Calmul este principala calitate";
    oPersona.vechime = 800;
    oPersona.origine = @"Traca";
    oPersona.religie = @"Crestina";
    [unArray addObject:oPersona];
    PersoanaVeche *aPersoana = [[PersoanaVeche alloc]init];
    aPersoana.prenume = @"Marin";
    aPersoana.sex = @"M";
    aPersoana.vechime = 900;
    aPersoana.calitati = @"Caliatii diverse: cinste, rabdare, simtul raspunserii";
    aPersoana.origine = @"Turca";
    aPersoana.religie = @"Musulmana";
    [unArray addObject:aPersoana];
    
    return unArray;
    
    
    
}

@end
