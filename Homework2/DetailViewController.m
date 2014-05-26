//
//  DetailViewController.m
//  UIImagePickerControllerHomework
//
//  Created by Josh Winskill on 5/24/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import "DetailViewController.h"
#import "BlogPost.h"
#import "UIImage+MonoChromeFilter.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

- (void)configureView;

@end

@implementation DetailViewController

@synthesize picker = _picker;
@synthesize actionSheet = _actionSheet;
@synthesize blogPostColor = _blogPostColor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //  Set color for the Detail View Controller
    _blogPostColor = [UIColor randColor];
    self.view.backgroundColor = _blogPostColor;
    
    //  Set-up for text view
    if ([self.blogContentOutlet.text isEqual:@""]){
    self.blogContentOutlet.text = @"Content text here";
    self.blogContentOutlet.textColor = [UIColor lightGrayColor];
    }
    self.blogContentOutlet.backgroundColor = [UIColor lightenColor:_blogPostColor];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark Preserving Data for Fields

- (IBAction)blogTitleChanged:(id)sender {
    self.detailItem.blogTitle = self.blogTitleOutlet.text;
}

- (IBAction)blogAuthorChanged:(id)sender {
    self.detailItem.blogAuthor = self.blogAuthorOutlet.text;
}

- (void) textViewDidBeginEditing:(UITextView *) textView
{
    if ([self.blogContentOutlet.text isEqualToString:@"Content text here"]) {
    [textView setText:@""];
    }
    
    self.blogContentOutlet.textColor = [UIColor blackColor];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.detailItem.blogContent = self.blogContentOutlet.text;
}

#pragma mark Configuring the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    if (self.detailItem) {
        self.blogTitleOutlet.text = self.detailItem.blogTitle;
        self.blogAuthorOutlet.text = self.detailItem.blogAuthor;
        self.blogContentOutlet.text = self.detailItem.blogContent;
        self.blogImageOutlet.image = self.detailItem.blogImage;
    }
}

#pragma mark Action Sheet Configuration
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Camera"]) {
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Photo Library"]) {
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:_picker animated:YES completion:nil];
}

#pragma mark UIImagePicker Selector Methods
- (IBAction)blogImageSelected:(id)sender
{
        _picker = [[UIImagePickerController alloc] init];
        _picker.delegate = self;
        _picker.allowsEditing = YES;
    
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Source Type"
                                                                     delegate:self
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:@"Photo Library", @"Camera", nil];
            [actionSheet showInView:self.view];
        } else {
            _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:_picker animated:YES completion:nil];
        }
    
}

- (void)saveImageToLibrary:(UIImage *)editedImage
{
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary writeImageToSavedPhotosAlbum:editedImage.CGImage
                                    orientation:ALAssetOrientationUp
                                completionBlock:^(NSURL *assetURL, NSError *error) {
                                    NSLog(@"Asset URL: %@", assetURL);
                                    self.detailItem.blogImage = self.blogImageOutlet.image;
                                }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        editedImage = [UIImage applyMonoChromeWithImage:editedImage andColor:_blogPostColor];
        
        self.blogImageOutlet.image = editedImage;
        self.blogImageOutlet.layer.cornerRadius = self.blogImageOutlet.frame.size.width / 2.0;
        [self.blogImageOutlet setClipsToBounds:YES];
        [self saveImageToLibrary:editedImage];
        
    }];
}


#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
