//
//  UIColor+CustomColorCategory.h
//  UIImagePickerControllerHomework
//
//  Created by Josh Winskill on 5/24/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (CustomColorCategory)

+ (UIColor *)randColor;
+ (UIColor *)lightenColor:(UIColor *)uiColor;
+ (UIColor *)colorForPassing:(UIColor *)color;

@end
