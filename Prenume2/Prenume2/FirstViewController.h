//
//  FirstViewController.h
//  Prenume2
//
//  Created by Horatiu on 12/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersoanaVeche.h"
@interface FirstViewController : UIViewController<UITextFieldDelegate,UISearchControllerDelegate,UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate>{
    UITextView *textView;
    
}
@property NSMutableArray *unArrayDePrenume;
@end

