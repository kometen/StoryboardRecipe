//
//  PRPRecipesListViewController.m
//  Recipes
//
//  Created by Claus Guttesen on 15/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import "PRPRecipesListViewController.h"
#import "PRPRecipe.h"
#import "PRPViewController.h"
#import "PRPRecipeEditorViewController.h"

@implementation PRPRecipesListViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource recipeCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    PRPRecipe *recipe = [self.dataSource recipeAtIndex:indexPath.row];
    
    cell.textLabel.text = [recipe title];
    cell.imageView.image = [recipe thumbnail];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", [recipe preparationTime], NSLocalizedString(@"minutes", nil)];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.dataSource deleteRecipeAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)finishedEditingRecipe:(PRPRecipe *)recipe {
    NSUInteger row = [self.dataSource indexOfRecipe:recipe];
    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationLeft];
}

#pragma mark - Table view data source

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"presentRecipeDetail" isEqualToString:segue.identifier]) {
        NSIndexPath *index = [self.tableView indexPathForCell:sender];
        PRPRecipe *recipe = [self.dataSource recipeAtIndex:index.row];
        [[segue destinationViewController] setRecipe:recipe];
    }
    if ([@"addNewRecipe" isEqualToString:segue.identifier]) {
        PRPRecipe *recipe = [self.dataSource createNewRecipe];
        UIViewController *topVC = [[segue destinationViewController] topViewController];
        PRPRecipeEditorViewController *editor = (PRPRecipeEditorViewController *)topVC;
        editor.recipeListVC = self;
        editor.recipe = recipe;
    }
}

@end
