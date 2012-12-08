//
//  PRPViewController.h
//  Recipes
//
//  Created by Claus Guttesen on 04/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipe.h"

@interface PRPViewController : UIViewController

@property(nonatomic, strong) IBOutlet UITextView *directionsView;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) IBOutlet UILabel *prepTime;
@property(nonatomic, strong) NSNumberFormatter *formatter;
@property(nonatomic, strong) PRPRecipe *recipe;

@end
