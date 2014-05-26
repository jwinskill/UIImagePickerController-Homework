//
//  BlogPost.h
//  UIImagePickerControllerHomework
//
//  Created by Josh Winskill on 5/24/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *blogTitle;
@property (nonatomic, strong) NSString *blogAuthor;
@property (nonatomic, strong) NSString *blogContent;
@property (nonatomic, strong) UIImage *blogImage;

- (id) initWithBlogTitle:(NSString *)blogTitle andBlogAuthor:(NSString *)blogAuthor andBlogContent:(NSString *)blogContent andBlogImage:(UIImage *)blogImage;

@end
