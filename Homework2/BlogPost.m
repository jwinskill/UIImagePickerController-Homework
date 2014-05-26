//
//  BlogPost.m
//  UIImagePickerControllerHomework
//
//  Created by Josh Winskill on 5/24/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

@synthesize blogTitle = _blogTitle;
@synthesize blogAuthor = _blogAuthor;
@synthesize blogContent = _blogContent;
@synthesize blogImage = _blogImage;

- (id) initWithBlogTitle:(NSString *)blogTitle andBlogAuthor:(NSString *)blogAuthor andBlogContent:(NSString *)blogContent andBlogImage:(UIImage *)blogImage
{
    if ((self = [super init])) {
        self.blogTitle = blogTitle;
        self.blogAuthor = blogAuthor;
        self.blogContent = blogContent;
        self.blogImage = blogImage;
    }
    return self;
}

@end
