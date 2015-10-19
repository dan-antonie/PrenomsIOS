//
//  SecondViewController.m
//  Prenume2
//
//  Created by Horatiu on 12/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "SecondViewController.h"
#import "Utils.h"

@interface SecondViewController ()
@property (nonatomic, strong) NSMutableDictionary *dictionarDePrenumeIndexat;
@property (nonatomic, strong) NSArray *toateCheileDictionarului;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dictionarDePrenumeIndexat = [Utils getAllPrenoms];
    self.toateCheileDictionarului = [[_dictionarDePrenumeIndexat allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DElegatul de tabel

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.toateCheileDictionarului count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *cheiaCurenta = [_toateCheileDictionarului objectAtIndex:section];
  
    NSArray *arrayDePrenumePtSectiune = [self.dictionarDePrenumeIndexat valueForKey:cheiaCurenta];
    
    return [arrayDePrenumePtSectiune count];
    
    
    //return self.unArrayDePrenume.count;
    // return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSString *cheiaCurenta = [_toateCheileDictionarului objectAtIndex:indexPath.section];
    
    NSArray *arrayDePrenumePtSectiune = [self.dictionarDePrenumeIndexat valueForKey:cheiaCurenta];

    
    cell.textLabel.text = [arrayDePrenumePtSectiune   objectAtIndex:indexPath.row];
    return cell;
}



@end
