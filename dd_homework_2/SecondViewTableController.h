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

@property (nonatomic, weak) id <DeletedNotesDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *notes;
@property (strong, nonatomic) NSMutableArray *willDeleteNotes;

@end

@protocol DeletedNotesDelegate

-(void)removeNotesWhichWasDelete:(SecondViewTableController *)secondView;

@end
