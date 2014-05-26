//
//  UIColor+CustomColorCategory.m
//  UIImagePickerControllerHomework
//
//  Created by Josh Winskill on 5/24/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//
//  These methods made possible by reference from the following resources:
//
//  http://stackoverflow.com/questions/11598043/get-slightly-lighter-and-darker-color-from-uicolor
//  http://stackoverflow.com/questions/21130433/generate-a-random-uicolor
//

#import "UIColor+CustomColorCategory.h"

@implementation UIColor (CustomColorCategory)

+ (UIColor *)randColor
{
    float red = arc4random_uniform(255) / 255.0;
    float green = arc4random_uniform(255) / 255.0;
    float blue = arc4random_uniform(255) / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    NSLog(@"%@", color);
    return color;
}

+ (UIColor *)lightenColor:(UIColor *)passedColor
{
    CGFloat red, green, blue, alpha;
    if ([passedColor getRed:&red green:&green blue:&blue alpha:&alpha])
        return [UIColor colorWithRed:MIN(red + 0.2, 1.0)
                               green:MIN(green + 0.2, 1.0)
                                blue:MIN(blue + 0.2, 1.0)
                               alpha:alpha];
    
    return nil;
}

+ (UIColor *)colorForPassing:(UIColor *)color
{
    CGFloat red, green, blue, alpha;
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha])
        return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return nil;
}

@end
