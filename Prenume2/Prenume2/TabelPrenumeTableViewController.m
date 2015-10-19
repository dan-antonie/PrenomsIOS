//
//  TabelPrenumeTableViewController.m
//  Prenume2
//
//  Created by Horatiu on 17/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//
#import "Persoana.h"
#import "TabelPrenumeTableViewController.h"

@interface TabelPrenumeTableViewController ()
@property NSMutableArray *arrayDePersoane;
@property (weak, nonatomic) IBOutlet UILabel *LabelPrenume;
@property Persoana *patraspersoana;
@end

@implementation TabelPrenumeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Persoana *primaPersoana = [[Persoana alloc]init];
    primaPersoana.prenume = @"Ion";
    primaPersoana.religie = @"Crestin";
    primaPersoana.vechime = 900;
    primaPersoana.calitati = @"Fire onesta.Principala calitate este cinstea";
    primaPersoana.origine = @"latina";
    
    Persoana *a2aPersoana = [[Persoana alloc]init];
    a2aPersoana.prenume = @"Gheorge";
    a2aPersoana.religie = @"Crestin";
    a2aPersoana.vechime = 800;
    a2aPersoana.calitati = @"Om vesel.Principala calitate este simtul umorului";
    a2aPersoana.origine = @"latina";
    
    Persoana *a3aPersoana = [[Persoana alloc]init];
    a3aPersoana.prenume = @"Marin";
    
    Persoana *a4aPersoana = [[Persoana alloc]init];
    a4aPersoana.prenume = @"Oleg";
    
    
    
    self.arrayDePersoane=[NSMutableArray arrayWithObjects:primaPersoana.prenume,a2aPersoana.prenume,a3aPersoana.prenume,a4aPersoana.prenume,nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.arrayDePersoane count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaPrenume" forIndexPath:indexPath];
    
    cell.textLabel.text= self.arrayDePersoane[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.patraspersoana = [self.arrayDePersoane objectAtIndex:indexPath.row];
    self.LabelPrenume = self.patraspersoana.prenume;
    [self performSegueWithIdentifier:@"Seguepatras" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vcToPushTo = segue.destinationViewController;
   // vcToPushTo.title = self.patraspersoana.prenume;

}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 //   [segue destinationViewController];
    // Pass the selected object to the new view controller.
// }


@end
