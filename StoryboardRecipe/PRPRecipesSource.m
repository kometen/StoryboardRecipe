//
//  PRPRecipesSource.m
//  Recipes
//
//  Created by Claus Guttesen on 16/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import "PRPRecipesSource.h"
#import "PRPRecipe.h"

@interface PRPRecipesSource()
@property(nonatomic, strong) NSMutableArray *recipes;
@end

@implementation PRPRecipesSource

- (NSArray *)recipes {
    if (!_recipes) {
        NSMutableArray *localRecipes = [NSMutableArray array];
        PRPRecipe *recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"0 - Hæld rosiner i, og bland";
        recipe.title = @"0 - Rosinboller";
        recipe.preparationTime = [NSNumber numberWithInt:30];
        recipe.image = [UIImage imageNamed:@"icoffee-280x278.png"];
        recipe.thumbnail = [UIImage imageNamed:@"icoffee-thumbnail.png"];
        [localRecipes addObject:recipe];
        recipe = [[PRPRecipe alloc] init];
        recipe.directions = @"1 - Hæld hakket chokolade i, og bland";
        recipe.title = @"1 - Cookies";
        recipe.preparationTime = [NSNumber numberWithInt:25];
        recipe.image = [UIImage imageNamed:@"raven-280x279.png"];
        recipe.thumbnail = [UIImage imageNamed:@"raven-thumbnail.png"];
        [localRecipes addObject:recipe];
        self.recipes = localRecipes;
    }
    return _recipes;
}

#pragma mark Recipe Data Source Methods
- (NSInteger)recipeCount {
    return [self.recipes count];
}

- (PRPRecipe *)recipeAtIndex:(NSInteger)index {
    return [self.recipes objectAtIndex:index];
}

- (void)deleteRecipeAtIndex:(NSInteger)index {
    [self.recipes removeObjectAtIndex:index];
}

- (PRPRecipe *)createNewRecipe {
    PRPRecipe *recipe = [[PRPRecipe alloc] init];
    recipe.preparationTime = [NSNumber numberWithInteger:0];
    [self.recipes addObject:recipe];
    return recipe;
}

- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe {
    return [self.recipes indexOfObject:recipe];
}

@end
