//
//  UIImage+MonoChromeFilter.h
//  Extending Class Functionality
//
//  Created by Josh Winskill on 5/25/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import "UIColor+CustomColorCategory.h"

@interface UIImage (MonoChromeFilter)

+ (UIImage *) applyMonoChromeWithImage: (UIImage *)uIImage andColor:(UIColor *)passColor;

@end
