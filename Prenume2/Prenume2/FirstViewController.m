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

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.unArrayDePrenume=(@"Ion",@"Marin",@"Marian",@"Madalin");
    
    //  UIDatePicker *datePicker = [[UIDatePicker alloc]init];
  //  [datePicker setDate:[NSDate date]];
  //  [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
 //   [self.myTextUiView setInputView:datePicker];
    
  
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
- (NSInteger)tableView:(UITableView *)SearchBar numberOfRowsInSection:(NSInteger)section
{
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"dummmy"];
    return cell;
}


@end
