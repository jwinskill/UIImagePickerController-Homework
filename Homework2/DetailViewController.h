//
//  DetailViewController.h
//  UIImagePickerControllerHomework
//
//  Created by Josh Winskill on 5/24/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


@class BlogPost;

@interface DetailViewController : UIViewController

//  post property for grabbing the post from the postTableViewCell
@property (nonatomic, strong) BlogPost *detailItem;

//  Properties for displaying the selected blog post's title, author, content, and image
@property (weak, nonatomic) IBOutlet UITextField *blogTitleOutlet;
@property (weak, nonatomic) IBOutlet UITextField *blogAuthorOutlet;
@property (weak, nonatomic) IBOutlet UITextView *blogContentOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *blogImageOutlet;

//  Image getting properties
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) UIActionSheet *actionSheet;

//  Actions for editing the selected blog post's title, author, and content
- (IBAction)blogTitleChanged:(id)sender;
- (IBAction)blogAuthorChanged:(id)sender;
- (IBAction)blogImageSelected:(id)sender;

//  Global property for color to be applied to background, text view, and monochrome filter for picture
@property (nonatomic, strong) UIColor *blogPostColor;


@end
