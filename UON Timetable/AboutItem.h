//
//  AboutItem.h
//  UON Timetable
//
//  Created by Adam Gask on 23/09/2014.
//  Copyright (c) 2014 AJ9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AboutItem : NSObject
@property(strong, nonatomic) NSString * text;
@property(strong, nonatomic) NSString * buttonText;
@property(strong, nonatomic) NSString * buttonLink;
- (id) initWithText: (NSString *)text andButtonText:(NSString *) buttonText  andButtonLink:(NSString*) buttonLink;
typedef NS_ENUM(NSInteger, AboutType) {
AboutText,
AboutButton
};
@end
