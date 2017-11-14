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

@interface NotesViewTableContorller : UITableViewController

@property (assign) id <DeletedNotesDelegate> delegate;
@property (retain, nonatomic) NSMutableArray *notes;
@property (retain, nonatomic) NSMutableArray *willDeleteNotes;

@end

@protocol DeletedNotesDelegate

-(void)removeNotesWhichWasDelete:(NotesViewTableContorller *)secondView;

@end
