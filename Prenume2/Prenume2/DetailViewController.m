//
//  DetailViewController.m
//  Prenume2
//
//  Created by Horatiu on 18/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *labelTitlu;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectDisplay;
@property (weak, nonatomic) IBOutlet UITextView *textViewMeu;

@end

@implementation DetailViewController

- (IBAction)selectareView:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.textViewMeu.text = self.istorie;
    }
    else if(selectedSegment == 1){
        self.textViewMeu.text = self.provenienta;   }
    else
        {
        self.textViewMeu.text = self.caracter;
        }
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.labelTitlu.title = self.titlu;
    self.textViewMeu.text = self.istorie;
    
    
    
    // Do any additional setup after loading the view.
 //   self.LabelPrenume.text = self.title;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
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
