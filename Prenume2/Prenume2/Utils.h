//
//  Utils.h
//  Prenume2
//
//  Created by Horatiu on 19/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"


#define MENU_TOP_NAV_COLOR [UIColor colorWithRed:(CGFloat)200/255.0 green:(CGFloat)209/255.0 blue:(CGFloat)220/255.0 alpha:1.0]
#define BOTTOM_TOOLBAR_COLOR [UIColor colorWithRed:(CGFloat)137/255.0 green:(CGFloat)159/255.0 blue:(CGFloat)1/255.0 alpha:1.0]
#define COLOR_BACKGROUND [UIColor colorWithRed:(CGFloat)229/255.0 green:(CGFloat)236/255.0 blue:(CGFloat)242/255.0 alpha:1.0]
#define FAVORIS_BUTTON_TEXT_COLOR [UIColor colorWithRed:(CGFloat)67/255.0 green:(CGFloat)77/255.0 blue:(CGFloat)90/255.0 alpha:1.0]
#define FAVORIS_BUTTON_TEXT_SHADOW_COLOR [UIColor colorWithRed:(CGFloat)173/255.0 green:(CGFloat)176/255.0 blue:(CGFloat)179/255.0 alpha:1.0]
#define TOOLBAR_HEIGHT	44

#define COLOR_SEGMENT_BAR [UIColor colorWithRed:(CGFloat)216/255.0 green:(CGFloat)216/255.0 blue:(CGFloat)216/255.0 alpha:1.0]
#define COLOR_PRENOM_COLOR [UIColor colorWithRed:(CGFloat)251/255.0 green:(CGFloat)229/255.0 blue:(CGFloat)160/255.0 alpha:1.0]
#define COLOR_CARACTERE_TEXT [UIColor colorWithRed:(CGFloat)117/255.0 green:(CGFloat)134/255.0 blue:(CGFloat)1/255.0 alpha:1.0]

#define FAVORIS_SELECTION_COLOR [UIColor colorWithRed:(CGFloat)117/255.0 green:(CGFloat)147/255.0 blue:(CGFloat)183/255.0 alpha:1.0]
#define TEXT_FIELD_MAX_CARS 20

#define RIGHT_DISTANCE_TO_FAV_STAR 60
#define LEFT_DETAILS_LABEL 5
#define FIRST_TOOLBAR_BUTTON_TAG 100

#define DATABASE_NAME @"prenom"

#define GENRE_BTN_NORMAL @"button_gray_home.png"
#define GENRE_BTN_SELECTED @"button_gray_selected.png"

#define IMG_FAVORIS_ACTIVE @"favoris_active.png"
#define IMG_FAVORIS_INACTIVE @"favoris_inactive.png"

#define IMGS_GENRE_F @"ico_female.png"
#define IMGS_GENRE_M @"ico_male.png"
#define IMGS_GENRE_M_F @"ico_male-female.png"

#define EMPTY_DATE_STRING @"__/__/____"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

#define DATE_PICKER_HEIGHT 216
#define DATE_TOOLBAR_HEIGHT 30
#define LABEL_FONT_SIZE 14;

#define ID_STRING_GENRE_M @"1"
#define ID_STRING_GENRE_F @"2"

//---------------------------------------MODIF------------------


@interface Utils : NSObject

+(void) loadEverything;
+(NSMutableDictionary *) getAllPrenoms;

@end
