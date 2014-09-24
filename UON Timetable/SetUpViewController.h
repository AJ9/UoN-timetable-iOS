//
//  SetUpViewController.h
//  UON Timetable
//
//  Created by Adam Gask on 24/09/2014.
//  Copyright (c) 2014 AJ9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetUpViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
