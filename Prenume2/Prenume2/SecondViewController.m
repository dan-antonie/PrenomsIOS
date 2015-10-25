//
//  SecondViewController.m
//  Prenume2
//
//  Created by Horatiu on 12/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//
#import "DetailViewController.h"
#import "SecondViewController.h"
#import "Persoana+Helper.h"
@interface SecondViewController ()<UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabelulMeu;
@property NSFetchedResultsController *searchFetchedResultsController;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *mySearchDisplayController;
@end;

@implementation SecondViewController

- (NSFetchedResultsController *)fetchedResultsControllerForTableView:(UITableView *)tableView
{
    return tableView == self.tabelulMeu ? self.fetchedResultsController : self.searchFetchedResultsController;
}

- (NSString *)entityName
{
 //   [NSException raise:@"Implementeaza in subclase numele entitatii" format:@"Hai patras ca se poate"];
    //aici tre sa intorci numele entitatii pe care vrei s-o afisezi in tabel, de exemplu return @"Masina";
    return @"Persoana";
  //  return nil;
}

- (NSPredicate *)fetchPredicate
{
  //  [NSException raise:@"Implementeaza in subclase predicatul entitatii" format:@"Daca vrei fara predicat, adica sa iei toate obiectele din tabel, intoarce nil"];
    
    //aici tre sa intorci un predicat, daca vrei. De exemplu
    // return [NSPredicate predicateWithFormat:@"anNastere > 1985"];
    return nil;
}

- (NSPredicate *)searchFetchPredicate
{
    //  [NSException raise:@"Implementeaza in subclase predicatul entitatii" format:@"Daca vrei fara predicat, adica sa iei toate obiectele din tabel, intoarce nil"];
    
    //aici tre sa intorci un predicat, daca vrei. De exemplu
    // return [NSPredicate predicateWithFormat:@"anNastere > 1985"];
    return nil;
}







- (NSString *)sectionNameKeyPath
{
 //   [NSException raise:@"Implementeaza in subclase pe ce cheie vrei sa fie grupate elementele din tabel pe sectiuni" format:@"Daca vrei sa nu fie grupate pe sectiuni, intoarce nil"];
    //aici tre sa intorci numele unei proprietati a entitatii, proprietate dupa care vrei sa se faca gruparea pe sectiuni. Exemplu return @"primaLiteraAPrenumelui"; Proprietatea aia tre sa fie continuta in entitatea respectiva. !!!
    return @"isMusulman";
   // return nil;
}

- (NSArray *)arrayDeSortDescriptors
{
 //   [NSException raise:@"Implementeaza in subclase ordinea de sortare" format:@"Vezi in functia arrayDeSortDescriptors exemplu mai jos"];
    /*exemplu de sort descriptors
     
     NSSortDescriptor *sortDupaIdPers =  [[NSSortDescriptor alloc] initWithKey:@"idPersoana" ascending:YES];
     NSSortDescriptor *sortDupaAnFabricare =  [[NSSortDescriptor alloc] initWithKey:@"anFabricare" ascending:YES];
     NSSortDescriptor *sortDupaNUmar =  [[NSSortDescriptor alloc] initWithKey:@"numar" ascending:YES];
     
     NSArray *sortDescriptorsArray = [NSArray arrayWithObjects: sortDupaIdPers, sortDupaAnFabricare, sortDupaNUmar, nil];
     
     return sortDescriptorsArray; */
   
    NSSortDescriptor *sortDupaIdPers =  [[NSSortDescriptor alloc] initWithKey:@"idPrenume" ascending:YES];
    NSSortDescriptor *sortDupaPrenume = [[NSSortDescriptor alloc] initWithKey:@"prenume" ascending:YES];
    NSArray *sortDescriptorsArray = [NSArray arrayWithObjects:sortDupaIdPers,sortDupaPrenume, nil];
    return sortDescriptorsArray;
    //return nil;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [self.tabelulMeu dequeueReusableCellWithIdentifier:@"PrenumeCell" forIndexPath:indexPath];
    
    Persoana *persoanaCurenta = [[self fetchedResultsControllerForTableView:theTableView] objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",persoanaCurenta.prenume ];
    if (persoanaCurenta.isMusulman) {
        cell.detailTextLabel.text = @ "Musulman";
    }
    else{
        cell.detailTextLabel.text = @"Crestin";
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger count = [[[self fetchedResultsControllerForTableView:tableView] sections] count];
    
    return count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    NSFetchedResultsController *fetchController = [self fetchedResultsControllerForTableView:tableView];
    NSArray *sections = fetchController.sections;
    if(sections.count > 0)
    {
        id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
        numberOfRows = [sectionInfo numberOfObjects];
    }
    
    return numberOfRows;
    
}



/*

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 //   [NSException raise:@"Implementeaza metoda asta in subclasa" format:@"O celula de tabel si setezi proprietatile pe ea"];
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrenumeCell" forIndexPath:indexPath];
    
    Persoana *persoanaCurenta = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",persoanaCurenta.prenume ];
    if (persoanaCurenta.isMusulman) {
        cell.detailTextLabel.text = @ "Musulman";
    }
    else{
        cell.detailTextLabel.text = @"Crestin";
    }
    
    return cell;

}
*/

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    Persoana *persoanaCurenta = [self.fetchedResultsController objectAtIndexPath:indexPath];
   
//}


-(void)initializareSFRCPtSearchString:(NSString *)searchString
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    NSPredicate *predSearch = [NSPredicate predicateWithFormat:@"prenume CONTAINS[cd]  %@", searchString];
    
    fetchRequest.predicate = predSearch;
    fetchRequest.sortDescriptors = [self arrayDeSortDescriptors];
    
    self.searchFetchedResultsController  = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                         managedObjectContext:self.managedObjectContextMainQueue
                                                                           sectionNameKeyPath:[self sectionNameKeyPath]
                                                                                    cacheName:@"dsfdskfkdkfds"];
    self.searchFetchedResultsController.delegate = self;
    
    NSError *error = nil;
    
    [self.searchFetchedResultsController performFetch:&error];
    
}








- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self initializareSFRC ];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSInteger)scope
{
    // update the filter, in this case just blow away the FRC and let lazy evaluation create another with the relevant search info
    self.searchFetchedResultsController.delegate = nil;
    self.searchFetchedResultsController = nil;
    
    [self initializareSFRCPtSearchString:searchText];
    
    
    // if you care about the scope save off the index to be used by the serchFetchedResultsController
    //self.savedScopeButtonIndex = scope;
}


#pragma mark -
#pragma mark Search Bar
- (void)searchDisplayController:(UISearchDisplayController *)controller willUnloadSearchResultsTableView:(UITableView *)tableView;
{
    // search is done so get rid of the search FRC and reclaim memory
    self.searchFetchedResultsController.delegate = nil;
    self.searchFetchedResultsController = nil;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[self.searchDisplayController.searchBar selectedScopeButtonIndex]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text]
                               scope:[self.searchDisplayController.searchBar selectedScopeButtonIndex]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    UITableView *tableView = controller == self.fetchedResultsController ? self.tabelulMeu : self.searchDisplayController.searchResultsTableView;
    [tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type
{
    UITableView *tableView = controller == self.fetchedResultsController ? self.tabelulMeu : self.searchDisplayController.searchResultsTableView;
    
    switch(type)
    {
        case NSFetchedResultsChangeInsert:
            [tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)theIndexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = controller == self.fetchedResultsController ? self.tabelulMeu : self.searchDisplayController.searchResultsTableView;
    
    switch(type)
    {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:theIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
        //    [self fetchedResultsController:controller configureCell:[tableView cellForRowAtIndexPath:theIndexPath] atIndexPath:theIndexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:theIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    UITableView *tableView = controller == self.fetchedResultsController ? self.tabelulMeu : self.searchDisplayController.searchResultsTableView;
    [tableView endUpdates];
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    DetailViewController *vc = [[DetailViewController alloc]init];
    vc = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tabelulMeu indexPathForSelectedRow];
    Persoana *persoanaCurenta = [self.fetchedResultsController objectAtIndexPath:indexPath];
    vc.titlu = persoanaCurenta.prenume;
    vc.istorie = persoanaCurenta.istorie;
    vc.caracter = persoanaCurenta.caracter;
    vc.provenienta = persoanaCurenta.provenienta;
}

@end
