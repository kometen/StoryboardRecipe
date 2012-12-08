//
//  PRPRecipesListViewController.h
//  Recipes
//
//  Created by Claus Guttesen on 15/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListDataSource.h"

@interface PRPRecipesListViewController : UITableViewController

@property (strong, nonatomic) id <PRPRecipesListDataSource> dataSource;

- (void)finishedEditingRecipe:(PRPRecipe *)recipe;

@end
