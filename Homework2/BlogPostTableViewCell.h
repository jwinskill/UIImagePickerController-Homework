//
//  BlogPostTableViewCell.h
//  UIImagePickerControllerHomework
//
//  Created by Josh Winskill on 5/24/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlogPost;

@interface BlogPostTableViewCell : UITableViewCell

@property BlogPost *blogPost;
@property (weak, nonatomic) IBOutlet UILabel *blogTitleLabel;



@end
