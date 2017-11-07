//
//  Note.m
//  dd_homework_2
//
//  Created by Andrey on 28/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "Note.h"

@implementation Note

- (void)dealloc {
    [_attString release];
    [super dealloc];
}

@end
