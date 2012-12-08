//
//  PRPRecipesListDataSource.h
//  Recipes
//
//  Created by Claus Guttesen on 15/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRPRecipe.h"

@protocol PRPRecipesListDataSource <NSObject>
- (NSInteger)recipeCount;
- (PRPRecipe *)recipeAtIndex:(NSInteger)index;
- (void)deleteRecipeAtIndex:(NSInteger)index;
- (PRPRecipe *)createNewRecipe;
- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe;
@end
