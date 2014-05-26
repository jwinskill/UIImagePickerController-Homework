//
//  UIImage+MonoChromeFilter.m
//  Extending Class Functionality
//
//  Created by Josh Winskill on 5/25/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import "UIImage+MonoChromeFilter.h"

@implementation UIImage (MonoChromeFilter)

+ (UIImage *) applyMonoChromeWithImage: (UIImage *)uIImage andColor:(UIColor *)passColor
{
    
    //  Convert UIColor to CIColor
    CGColorRef colorRef = [UIColor colorForPassing:passColor].CGColor;
    NSString *colorString = [CIColor colorWithCGColor:colorRef].stringRepresentation;
    CIColor *coreColor = [CIColor colorWithString:colorString];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //  Convert UIImage to CIImage
    CIImage *ciImage = [[CIImage alloc] initWithImage:uIImage];
    
    //  Set values for CIColorMonochrome Filter
    CIFilter *filter = [CIFilter filterWithName:@"CIColorMonochrome"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:@1.0 forKey:@"inputIntensity"];
    [filter setValue:coreColor forKey:@"inputColor"];
    
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGRect extent = [result extent];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:extent];
    
    UIImage *filteredImage = [[UIImage alloc] initWithCGImage:cgImage];
    
    return filteredImage;
}

@end
