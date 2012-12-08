//
//  PRPRecipeEditorViewController.h
//  StoryboardRecipe
//
//  Created by Claus Guttesen on 22/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListViewController.h"

@class PRPRecipe;

@interface PRPRecipeEditorViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate>

@property(nonatomic, strong) PRPRecipe *recipe;
@property(nonatomic, strong) NSNumberFormatter *formatter;
@property(nonatomic, strong) IBOutlet UITextField *titleField;
@property(nonatomic, strong) IBOutlet UITextView *directionsText;
@property(nonatomic, strong) IBOutlet UILabel *prepTimeLabel;
@property(nonatomic, strong) IBOutlet UIImageView *recipeImage;
@property(nonatomic, strong) IBOutlet UIStepper *prepTimeStepper;
@property(nonatomic, weak) PRPRecipesListViewController *recipeListVC;

- (IBAction)changePreparationTime:(UIStepper *)sender;
- (IBAction)done:(UIBarButtonItem *)sender;

@end
