//
//  PRPViewController.m
//  Recipes
//
//  Created by Claus Guttesen on 04/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import "PRPViewController.h"

@interface PRPViewController ()

@end

@implementation PRPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = self.recipe.title;
    self.directionsView.text = self.recipe.directions;
    self.prepTime.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
    if (self.recipe.image) {
        self.imageView.image = self.recipe.image;
    }
}

@end
