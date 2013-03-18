//
//  BlogList_TableViewController.m
//  SolsticeTest
//
//  Created by Brad Woodard on 3/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "BlogList_TableViewController.h"

@interface BlogList_TableViewController ()

@end

@implementation BlogList_TableViewController

XMLParser *xmlParser;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - LOAD THE VIEW
// When the view loads we want to the parser to work on the feed and extract the data we need for the app
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"J's Blog"; // Cosmetic: Assign a title within the navigation bar
    
    // Use the private xmlParser to load our xml from the feed URL
    if (!xmlParser) {
        xmlParser = [[XMLParser alloc] loadXMLfromURL:@"http://feeds.feedburner.com/TheTechnologyEdge?format=xml"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[xmlParser blogEntries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // Define the current blog entry so elements can be pulled from the blogEntries array
    // and displayed within the view
    BlogEntry *currentBlog = [[xmlParser blogEntries] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = currentBlog.articleTitle; // Set the table cell title to the title of the corresponding blog from blogEntries
    cell.detailTextLabel.text = currentBlog.articleDate; // Set the table cell subtitle to the published date of the corresponding blog from blogEntries
    
    return cell;
}


#pragma mark - Table view delegate
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // We want to send data from the table view to the detail view.
    // Setup the segue in storyboard and incorporate
     if ([segue.identifier isEqualToString:@"toDetailView"]) {
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; // Identify which row in the table was selected
         
         // Set the destination view controller for the seque
         BlogDetail_ViewController *blogDetailView = segue.destinationViewController;
         
         // Pass the corresponding data from the selected row to the detail view by
         // setting the BlogEntry object on the detail view equal to the object in the selected table row
         blogDetailView.incomingBlogEntry = [[xmlParser blogEntries] objectAtIndex:indexPath.row];
        }
 }


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Open the detail view when a row is selected
    [self performSegueWithIdentifier:@"toDetailView" sender:self];
}

@end
