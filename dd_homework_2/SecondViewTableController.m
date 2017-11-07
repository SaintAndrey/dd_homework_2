//
//  TwoViewController.m
//  dd_homework_2
//
//  Created by Andrey on 24/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "SecondViewTableController.h"

@implementation SecondViewTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.willDeleteNotes = [[[NSMutableArray alloc] init] autorelease];
}

- (void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        [self.delegate removeNotesWhichWasDelete:self];
    }
    [super viewWillDisappear:animated];
}

#pragma mark - Table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Note *note = (Note*)self.notes[indexPath.row];
    [self.willDeleteNotes addObject:note];
    [self.notes removeObject:note];

    [tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Note *note = (Note*)self.notes[indexPath.row];
    cell.textLabel.attributedText = note.attString;
    
    return cell;
}

#pragma mark - dealloc

- (void)dealloc {
    [_willDeleteNotes release];
    [_notes release];
    [super dealloc];
}

@end
