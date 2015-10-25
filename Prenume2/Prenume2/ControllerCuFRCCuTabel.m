//
//  ControllerCuFRCCuTabel.m
//  ProiectCuCoreData
//
//  Created by Horatiu on 26/09/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "ControllerCuFRCCuTabel.h"
#import "StorageManager.h"
@interface ControllerCuFRCCuTabel ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tabelulMeu; // Vezi ca tabelul tre legat ca outlet din controllerul care il extinde pe controllerul asta.

// @property (nonatomic, strong) NSFetchedResultsController    *fetchedResultsController;

@end

@implementation ControllerCuFRCCuTabel


- (void)viewDidLoad {
    [super viewDidLoad];
    self.managedObjectContextMainQueue = [kStorageManager getCoreDataMainContext];
    
    // Do any additional setup after loading the view.
    if (self.tabelulMeu) {
        [self initializareFRC];
        [self.tabelulMeu reloadData];
    }
    

    
}

- (NSString *)entityName
{
    [NSException raise:@"Implementeaza in subclase numele entitatii" format:@"Hai patras ca se poate"];
    //aici tre sa intorci numele entitatii pe care vrei s-o afisezi in tabel, de exemplu return @"Masina";
    return nil;
}

- (NSPredicate *)fetchPredicate
{
    [NSException raise:@"Implementeaza in subclase predicatul entitatii" format:@"Daca vrei fara predicat, adica sa iei toate obiectele din tabel, intoarce nil"];
    
    //aici tre sa intorci un predicat, daca vrei. De exemplu
    // return [NSPredicate predicateWithFormat:@"anNastere > 1985"];
    return nil;
}


- (NSString *)sectionNameKeyPath
{
    [NSException raise:@"Implementeaza in subclase pe ce cheie vrei sa fie grupate elementele din tabel pe sectiuni" format:@"Daca vrei sa nu fie grupate pe sectiuni, intoarce nil"];
    //aici tre sa intorci numele unei proprietati a entitatii, proprietate dupa care vrei sa se faca gruparea pe sectiuni. Exemplu return @"primaLiteraAPrenumelui"; Proprietatea aia tre sa fie continuta in entitatea respectiva. !!!
    
    return nil;
}

- (NSArray *)arrayDeSortDescriptors
{
    [NSException raise:@"Implementeaza in subclase ordinea de sortare" format:@"Vezi in functia arrayDeSortDescriptors exemplu mai jos"];
    /*exemplu de sort descriptors
    
     NSSortDescriptor *sortDupaIdPers =  [[NSSortDescriptor alloc] initWithKey:@"idPersoana" ascending:YES];
     NSSortDescriptor *sortDupaAnFabricare =  [[NSSortDescriptor alloc] initWithKey:@"anFabricare" ascending:YES];
     NSSortDescriptor *sortDupaNUmar =  [[NSSortDescriptor alloc] initWithKey:@"numar" ascending:YES];
     
     NSArray *sortDescriptorsArray = [NSArray arrayWithObjects: sortDupaIdPers, sortDupaAnFabricare, sortDupaNUmar, nil];
     
     return sortDescriptorsArray; */
     
    return nil;
}


- (void)initializareFRC
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    fetchRequest.predicate = [self fetchPredicate];
    fetchRequest.sortDescriptors = [self arrayDeSortDescriptors];
   
    self.fetchedResultsController  = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                          managedObjectContext:self.managedObjectContextMainQueue
                                                                            sectionNameKeyPath:[self sectionNameKeyPath]
                                                                                     cacheName:@"dsacee"];
    self.fetchedResultsController.delegate = self;
    
    NSError *error = nil;
    
    [self.fetchedResultsController performFetch:&error];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo name];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *sections = [self.fetchedResultsController sections];
    id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [NSException raise:@"Implementeaza metoda asta in subclasa" format:@"O celula de tabel si setezi proprietatile pe ea"];
    return nil;
}



#pragma mark -
#pragma mark FetchControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tabelulMeu beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tabelulMeu insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                     withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tabelulMeu deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                     withRowAnimation:UITableViewRowAnimationFade];
            break;
        default: break;
    }
}



- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tabelulMeu insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tabelulMeu deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:{
            
            NSLog(@"Please update cell");
        }
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tabelulMeu deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [self.tabelulMeu insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
    [self.tabelulMeu endUpdates];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
