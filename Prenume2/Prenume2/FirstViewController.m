//
//  FirstViewController.m
//  Prenume2
//
//  Created by Horatiu on 12/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Label1;
@property (weak, nonatomic) IBOutlet UITextField *myTextUiView;
- (IBAction)finishEditing:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;


@property (nonatomic, strong) NSMutableArray *arrayDeSearch;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Utils loadEverything];
    
    self.unArrayDePrenume = [NSMutableArray array];
//    [_unArrayDePrenume addObject:@"ion"];
//    [_unArrayDePrenume addObject:@"marin"];
//    [_unArrayDePrenume addObject:@"marin2"];
    
    self.unArrayDePrenume= [NSMutableArray arrayWithObjects:@"Ion", @"Maria", @"Marin", @"George", nil];
    
    //  UIDatePicker *datePicker = [[UIDatePicker alloc]init];
  //  [datePicker setDate:[NSDate date]];
  //  [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
 //   [self.myTextUiView setInputView:datePicker];
    NSString *oPersoane =[[NSString alloc ]init];
    oPersoane= [[NSUserDefaults standardUserDefaults] objectForKey:@"persoana"];
    NSLog(@"sdadsa %@", oPersoane);
    Persoana *oPersoana = [[Persoana alloc]init];
    oPersoana.prenume = @"persoana";
    [[NSUserDefaults standardUserDefaults] setObject:oPersoana.prenume forKey:@"persoana"];
    [[NSUserDefaults standardUserDefaults] synchronize ] ;
    
    // Do any additional setup after loading the view, typically from a nib.

}

// -(void)updateTextField:(id)sender
// {
//    UIDatePicker *picker = (UIDatePicker*)self.myTextUiView.inputView;
//    self.myTextUiView.text = [NSString stringWithFormat:@"%@",picker.date];
//  }

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    self.myTextUiView  = textField;
    
    // Create a date picker for the date field.
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;
 //   datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:-91136000];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
    
    // If the date field has focus, display a date picker instead of keyboard.
    // Set the text to the date currently displayed by the picker.
    if (textField.tag == 1)
    {
        self.myTextUiView.inputView = datePicker;
        self.myTextUiView.text = [self formatDate:datePicker.date];
    }
}


// Called when the date picker changes.
- (void)updateDateField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.myTextUiView.inputView;
    self.myTextUiView.text = [self formatDate:picker.date];
}


// Formats the date chosen with the date picker.
- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"MM'/'dd'/'yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *) textField{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 1) {
        [self.myTextUiView resignFirstResponder];
     }
}
- (IBAction)finishEditing:(id)sender{
    [self.myTextUiView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.arrayDeSearch count];
    }
    return 0;
    
    
    return self.unArrayDePrenume.count;
   // return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.arrayDeSearch objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Search delegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
   
}



- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSLog(@"Called");
    [self cautaPtText:controller.searchBar.text];
    return YES;
}


- (void) cautaPtText:(NSString *)theText
{
    NSString *stringDeCautat = theText;
    if (self.arrayDeSearch) {
        [self.arrayDeSearch removeAllObjects];
        
    }else
    {
        self.arrayDeSearch = [[NSMutableArray alloc] init];
    }
    
    for (int i = 0; i < [self.unArrayDePrenume count]; i++) {
        NSString *unPrenume = [self.unArrayDePrenume objectAtIndex:i];
        if ([unPrenume rangeOfString:stringDeCautat].length > 0) {
            [self.arrayDeSearch addObject:unPrenume];
        }
    }
}





@end
