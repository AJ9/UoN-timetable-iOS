//
//  AboutViewController.m
//  UON Timetable
//
//  Created by Adam Gask on 22/09/2014.
//  Copyright (c) 2014 AJ9. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController{
    NSMutableArray * tableData;
    int numberOfSections;
    int headerHeight;
    int rowHeight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //Populate the array for the TableView
    [self populateTableViewData];
    
    //Set the TableView details:
    numberOfSections = 4;
    headerHeight = 75;
    rowHeight = 44;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Populate the TableView array

-(void) populateTableViewData{
    tableData = [[NSMutableArray alloc]init];
    int numberOfItems = 1;
    for(int i = 0; i < numberOfItems ; i++ ){
        NSString * item = [NSString stringWithFormat:@"Item %i", i];
        [tableData addObject:item];
    }
}


#pragma mark - Table view data source methods


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //The identifier for the cell is set in the storyboard
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString * stringForRow = [tableData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = stringForRow;
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tableData count];
}



#pragma  mark - Table view delegate methods


-(UIView *) tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    
    NSLog(@"Width = %f", tableView.frame.size.width);
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, headerHeight)];
    l.backgroundColor = [UIColor grayColor];
    l.font = [UIFont systemFontOfSize:24];
    l.textColor = [UIColor whiteColor];
    l.textAlignment = NSTextAlignmentCenter;
    
    NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    
    NSMutableAttributedString * attString =[[NSMutableAttributedString alloc] initWithString:@"About" attributes:underlineAttribute];
    
    l.attributedText=attString;
    
    return nil;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rowHeight;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Row %i clicked!", indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}




@end