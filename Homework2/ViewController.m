//
//  ViewController.m
//  UIImagePickerControllerHomework
//
//  Created by Josh Winskill on 5/24/14.
//  Copyright (c) 2014 Josh Winskill. All rights reserved.
//

#import "ViewController.h"
#import "BlogPost.h"
#import "BlogPostTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *blogPosts;

@end

@implementation ViewController

@synthesize blogPosts = _blogPosts;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Blog Feed";
    
    BlogPost *blogPost1 = [[BlogPost alloc] initWithBlogTitle:@"Blog Title 1"
                                                andBlogAuthor:@"Author 1"
                                               andBlogContent:@"Blog 1 Content"
                                                 andBlogImage:[UIImage imageNamed:@"NSMustache.png"]];
    
    BlogPost *blogPost2 = [[BlogPost alloc] initWithBlogTitle:@"Blog Title 2"
                                                andBlogAuthor:@"Author 2"
                                               andBlogContent:@"Blog 2 Content"
                                                 andBlogImage:[UIImage imageNamed:@"colorfulMustache.png"]];
    
    self.blogPosts = [[NSMutableArray alloc] initWithObjects:blogPost1, blogPost2, nil];
    
    //  navigation bar changes
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                              target:self action:@selector(addTapped:)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _blogPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellIdentifier = @"BlogCell";
    
    BlogPostTableViewCell *blogPostCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    blogPostCell.blogTitleLabel.text = blogPost.blogTitle;
    
    return blogPostCell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_blogPosts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)addTapped:(id)sender
{
    BlogPost *blogPost = [[BlogPost alloc] initWithBlogTitle:@""
                                               andBlogAuthor:@""
                                              andBlogContent:@""
                                                andBlogImage:nil];
    
    [_blogPosts addObject:blogPost];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_blogPosts.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
    
    [self.tableView selectRowAtIndexPath:indexPath animated:YES
                          scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"detailViewPush" sender:self];
}

#pragma mark Detail View Transition Methods

-(void)didMoveToParentViewController:(UIViewController *)parent{
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailViewController = segue.destinationViewController;
    BlogPost *blogPost = [self.blogPosts objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailViewController.detailItem = blogPost;
}


@end
