//
//  PRPDirectionsEditorViewController.h
//  StoryboardRecipe
//
//  Created by Claus Guttesen on 27/11/12.
//  Copyright (c) 2012 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPRecipe;

@interface PRPDirectionsEditorViewController : UIViewController <UITextViewDelegate>

@property(nonatomic, strong) PRPRecipe *recipe;
@property(nonatomic, strong) IBOutlet UITextView *textView;

@end
