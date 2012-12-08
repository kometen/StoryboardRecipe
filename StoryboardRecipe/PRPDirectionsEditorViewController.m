//
//  PRPDirectionsEditorViewController.m
//  StoryboardRecipe
//
//  Created by Claus Guttesen on 27/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import "PRPDirectionsEditorViewController.h"
#import "PRPRecipe.h"

@interface PRPDirectionsEditorViewController ()

@end

@implementation PRPDirectionsEditorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Edit Directions";
    [self.textView becomeFirstResponder];
    self.textView.text = self.recipe.directions;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.textView resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.recipe.directions = self.textView.text;
}

@end
