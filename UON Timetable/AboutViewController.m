//
//  AboutViewController.m
//  UON Timetable
//
//  Created by Adam Gask on 22/09/2014.
//  Copyright (c) 2014 AJ9. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutItem.h"
#import "AboutSection.h"
#import "UIView+Borders.h"
#import <QuartzCore/QuartzCore.h>

@interface AboutViewController ()

@end

@implementation AboutViewController{
    NSMutableArray * tableData;
    int numberOfSections;
    int headerHeight;
    int rowHeight;
    UIFont *cellFont;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Populate the array for the TableView
    [self populateTableViewData];
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //Set up font
    cellFont = [UIFont fontWithName:@"Helvetica" size:17.0];
    
    
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
    
    //Section 1
    
    AboutSection *section1 = [[AboutSection alloc]init];
    section1.sectionTitle = @"Open Sourced";
   
    AboutItem * openSourcedText = [[AboutItem alloc]initWithText:@"This project is open source and contributions are welcome at the following repositiories." andButtonText:nil andButtonLink:nil];
    [section1.items addObject:openSourcedText];
    
    AboutItem * APIRepo = [[AboutItem alloc]initWithText:nil andButtonText:@"API Repo"     andButtonLink:@"https://github.com/ryanshawty/UoN-timetable-scraper/commits?author=ryanshawty"];
    
    [section1.items addObject:APIRepo];
    
    AboutItem * iOSRepo = [[AboutItem alloc]initWithText:nil andButtonText:@"iOS Repo"     andButtonLink:@"https://github.com/AJ9/UoN-timetable-iOS"];
    
    [section1.items addObject:iOSRepo];
    
    AboutItem * webAppRepo = [[AboutItem alloc]initWithText:nil andButtonText:@"Web App Repo"     andButtonLink:@"https://github.com/ryanshawty/UoN-timetable-app"];
    
    [section1.items addObject:webAppRepo];
    
    [tableData addObject:section1];
    
    //Section 2
    
    AboutSection *section2 = [[AboutSection alloc]init];
    section2.sectionTitle = @"Licence";
    
    AboutItem * licenceText = [[AboutItem alloc]initWithText:@"Project is licenced under the MIT licence which can be found on the GitHub repo." andButtonText:nil andButtonLink:nil];
    [section2.items addObject:licenceText];
    
    [tableData addObject:section2];
    
    //Section 3
    
    AboutSection *section3 = [[AboutSection alloc]init];
    section3.sectionTitle = @"App Info";
    
    AboutItem * applicationInfoText = [[AboutItem alloc]initWithText:@"The API & Android app is created by Ryan Shaw, iOS has been created by Adam Gask." andButtonText:nil andButtonLink:nil];
    [section3.items addObject:applicationInfoText];
    
    [tableData addObject:section3];
    
    //Section 4
    
    AboutSection *section4 = [[AboutSection alloc]init];
    section4.sectionTitle = @"Data";
    
    AboutItem * clearData = [[AboutItem alloc]initWithText:nil andButtonText:@"Clear data" andButtonLink:nil];
    [section4.items addObject:clearData];
    
    [tableData addObject:section4];
    
}


#pragma mark - Table view data source methods

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
        //Header
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   // //The identifier for the cell is set in the storyboard
    //NSString * celltext = [NSString stringWithFormat:@"cell row %ld & section %ld", (long)indexPath.row, (long)indexPath.section];
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    /*
    UITableViewCell *cell;
     if (cell == nil) {
         cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
     }*/
    
    AboutSection * currentSection = [tableData objectAtIndex:indexPath.section];
    AboutItem * currentItem = [currentSection.items objectAtIndex:indexPath.row];
    
    if (currentItem.text != nil) {
        NSString * stringForRow = currentItem.text;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = stringForRow;
    }
    else {
        UIButton *cellButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        float padding = 10;
        float width = tableView.frame.size.width;
        cellButton.frame = CGRectMake(padding, 5, width - (padding *2), 50);
        [cellButton setTitle:currentItem.buttonText forState:UIControlStateNormal];
        [cellButton addTarget:self action:@selector(openLink:)     forControlEvents:UIControlEventTouchUpInside];
        cellButton.accessibilityHint = currentItem.buttonLink;
        
        [cell.contentView addSubview:cellButton];
    }
    
   
    return cell;
}


-(void)openLink: (id) sender {
    NSLog(@"openLink");
    UIButton *temp = (UIButton*) sender;
NSString * link =     temp.accessibilityHint;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:link]];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    AboutSection * currentSection = [tableData objectAtIndex:section];
    
    return currentSection.items.count;
    
}



#pragma  mark - Table view delegate methods

/*
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
 }*/

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    AboutSection * currentSection = [tableData objectAtIndex:section];
    
    return currentSection.sectionTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AboutSection * currentSection = [tableData objectAtIndex:indexPath.section];
    AboutItem * currentItem = [currentSection.items objectAtIndex:indexPath.row];
    
    CGRect labelSize;
    
    if (currentItem.text != nil) {
        NSString *cellText = currentItem.text;
        
        CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
        
        
        labelSize = [cellText boundingRectWithSize:constraintSize
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:cellFont}
                                                  context:nil];
    }
    else {
        labelSize.size.height = 40;
    }
    
    
    return labelSize.size.height + 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Row %i clicked!", indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}




@end
