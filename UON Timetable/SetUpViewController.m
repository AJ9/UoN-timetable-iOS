//
//  SetUpViewController.m
//  UON Timetable
//
//  Created by Adam Gask on 24/09/2014.
//  Copyright (c) 2014 AJ9. All rights reserved.
//

#import "SetUpViewController.h"

@interface SetUpViewController ()

@end

@implementation SetUpViewController{
    NSMutableArray * tableData;
    int numberOfSections;
    int headerHeight;
    int rowHeight;
    UIFont *cellFont;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _usernameInput.delegate = self;
    
    //Set the TableView details:
    numberOfSections = 4;
    headerHeight = 75;
    rowHeight = 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
        NSString * stringForRow = @"Module";
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = stringForRow;
    
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return 10;
    
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Row %i clicked!", indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


#pragma mark textfield devs

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _usernameInput) {
        [textField resignFirstResponder];
    }
    return NO;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)findModules:(id)sender {
    [self textFieldShouldReturn:_usernameInput];
    
}

@end
