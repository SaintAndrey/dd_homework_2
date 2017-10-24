//
//  TwoViewController.m
//  dd_homework_2
//
//  Created by Andrey on 24/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "TwoViewController.h"

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%i", [_notes count]);
    return [_notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSInteger index = [indexPath row];
    
    NSAttributedString *note = _notes[index];
    
    cell.textLabel.attributedText = note;
    
    return cell;
}

@end
