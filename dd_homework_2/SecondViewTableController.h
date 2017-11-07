//
//  TwoViewController.h
//  dd_homework_2
//
//  Created by Andrey on 24/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@protocol DeletedNotesDelegate;

@interface SecondViewTableController : UITableViewController

@property (assign) id <DeletedNotesDelegate> delegate;
@property (retain) NSMutableArray *notes;
@property (retain) NSMutableArray *willDeleteNotes;

@end

@protocol DeletedNotesDelegate

-(void)removeNotesWhichWasDelete:(SecondViewTableController *)secondView;

@end
