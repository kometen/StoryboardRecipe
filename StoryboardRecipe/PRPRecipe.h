//
//  PRPRecipe.h
//  Recipes
//
//  Created by Claus Guttesen on 04/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRPRecipe : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *directions;
@property(nonatomic, copy) NSNumber *preparationTime;
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) UIImage *thumbnail;

@end
