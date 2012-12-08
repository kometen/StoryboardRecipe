//
//  PRPRecipeEditorViewController.m
//  StoryboardRecipe
//
//  Created by Claus Guttesen on 22/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import "PRPRecipeEditorViewController.h"
#import "PRPRecipe.h"

@implementation PRPRecipeEditorViewController

- (IBAction)changePreparationTime:(UIStepper *)sender {
    NSInteger value = (NSInteger)[sender value];
    self.recipe.preparationTime = [NSNumber numberWithInteger:value];
    self.prepTimeLabel.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.titleField.text = self.recipe.title;
    self.directionsText.text = self.recipe.directions;
    self.prepTimeLabel.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
    self.prepTimeStepper.value = [self.recipe.preparationTime doubleValue];
    if (nil != self.recipe.image) {
        self.recipeImage.image = self.recipe.image;
    }
}

- (IBAction)done:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self.recipeListVC finishedEditingRecipe:self.recipe];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"editDirections" isEqualToString:segue.identifier]) {
        [[segue destinationViewController] setRecipe:self.recipe];
    }
    if ([@"choosePhoto" isEqualToString:segue.identifier]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

#pragma mark - Text Field Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.recipe.title = textField.text;
}

#pragma mark - Image Picker Delegate Methods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.recipe.image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
