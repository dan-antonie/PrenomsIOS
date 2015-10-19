//
//  Utils.m
//  Prenume2
//
//  Created by Horatiu on 19/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "Utils.h"

@implementation Utils


#pragma mark -
#pragma mark DATABASE_MANAGEMENT
sqlite3 *database;
+(void) openDatabase
{
    //	NSFileManager *fileManager = [NSFileManager defaultManager];
    //	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //	NSString *databasePath = [[paths objectAtIndex:0] stringByAppendingFormat:@"output.sqlite"];
    //
    //	if(![fileManager fileExistsAtPath:databasePath])
    //	{
    //		NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"output" ofType:@"sqlite"];
    //		[fileManager copyItemAtPath:dbPath toPath:databasePath error:nil];
    //	}
    
    NSString *databasePath = [[NSBundle mainBundle] pathForResource:DATABASE_NAME ofType:@"sqlite"];
    //open database
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK)
        NSLog(@"database opened");
    else
        NSLog(@"database open error");
    
}
+(void) closeDatabase
{
    sqlite3_close(database);
}
+(sqlite3*) getDatabase
{
    return database;
}


+(void)loadEverything
{
    //open database
    [Utils openDatabase];
    
    NSString *sqlStatementString = @"pragma case_sensitive_like = ON;";
    const char *sqlStatement = [sqlStatementString UTF8String];
    sqlite3_stmt *compiledStatement;
    int err = sqlite3_prepare_v2([Utils getDatabase], sqlStatement, -1, &compiledStatement, NULL);
    if(err == SQLITE_OK)
    {
        //get the row - there is only one result
        if(sqlite3_step(compiledStatement) == SQLITE_DONE)
        {
            NSLog(@"pragma ok");
        }
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
    }	
    
    NSDictionary *aDic = [Utils getAllPrenoms];
    
    
    
    //load all prenoms into a dictionary 
    

}


+(NSMutableDictionary *) getAllPrenoms //when nothing is entered in the prenoms searchfield
{
    
    NSString *sqlStatementString = [NSString stringWithFormat:@"select * from Chinois"];
    const char *sqlStatement = [sqlStatementString UTF8String];
    
    NSMutableDictionary *allPrenoms = [[NSMutableDictionary alloc] init];
    
    sqlite3_stmt *compiledStatement;
    int err = sqlite3_prepare_v2([Utils getDatabase], sqlStatement, -1, &compiledStatement, NULL);
    if(err == SQLITE_OK)
    {
        while(sqlite3_step(compiledStatement) == SQLITE_ROW)
        {
            NSString *prenom = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
            //NSString *affi = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
            NSString *firstLetter = [prenom substringToIndex:1];
            NSMutableArray *values = [allPrenoms objectForKey:firstLetter];
            if(values == nil)
                values = [[NSMutableArray alloc] init];
            [values addObject:prenom];
            [allPrenoms setObject:values forKey:firstLetter];
        }
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
    }			
    
    return allPrenoms;
    
}


@end
