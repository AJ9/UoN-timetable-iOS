//
//  AboutItem.m
//  UON Timetable
//
//  Created by Adam Gask on 23/09/2014.
//  Copyright (c) 2014 AJ9. All rights reserved.
//

#import "AboutItem.h"

@implementation AboutItem
- (id) initWithText: (NSString *)text andButtonText:(NSString *) buttonText  andButtonLink:(NSString*) buttonLink {
    
    // Call superclass's initializer
    self = [super init];
    if( !self ) return nil;
    _text = text;
    _buttonText = buttonText;
    _buttonLink = buttonLink;
    return self;
}
@end
