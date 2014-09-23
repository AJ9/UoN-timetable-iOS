//
//  AboutViewController.h
//  UON Timetable
//
//  Created by Adam Gask on 22/09/2014.
//  Copyright (c) 2014 AJ9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
