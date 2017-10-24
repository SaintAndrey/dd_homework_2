//
//  ViewController.m
//  dd_homework_2
//
//  Created by Andrey on 15/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *redButton;
@property (strong, nonatomic) IBOutlet UIButton *greenButton;
@property (strong, nonatomic) IBOutlet UIButton *blueButton;
@property (strong, nonatomic) IBOutlet UIButton *orangeButton;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.redButton setTintColor:[UIColor redColor]];
    [self.greenButton setTintColor:[UIColor greenColor]];
    [self.blueButton setTintColor:[UIColor blueColor]];
    [self.orangeButton setTintColor:[UIColor orangeColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressOnButtonWithColor:(UIButton *)sender {
    
    [self.textView.textStorage setAttributes:@{ NSForegroundColorAttributeName: [sender.titleLabel textColor]} range:self.textView.selectedRange];
}

- (IBAction)pressOnButtonClear:(UIButton *)sender {
    [self.textView.textStorage setAttributes:@{ NSForegroundColorAttributeName: [UIColor blackColor]} range:self.textView.selectedRange];
 
}

- (IBAction)goNotes:(id)sender {
    [self performSegueWithIdentifier:@"Notes" sender:sender];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"Notes"]) {
        NSMutableArray *arrayNotes = [[NSMutableArray alloc] init];
        
        NSAttributedString *string = [[NSAttributedString alloc] initWithAttributedString:self.textView.attributedText];
        
        [string enumerateAttributesInRange:NSMakeRange(0, self.textView.text.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id attrs, NSRange range, BOOL *stop){
            if ([attrs objectForKey:@"NSColor"] == [UIColor redColor] ||
                [attrs objectForKey:@"NSColor"] == [UIColor blueColor] ||
                [attrs objectForKey:@"NSColor"] == [UIColor greenColor] ||
                [attrs objectForKey:@"NSColor"] == [UIColor orangeColor]) {
                [arrayNotes addObject:[self.textView.attributedText attributedSubstringFromRange:range]];
            }
        }];
        
        TwoViewController *nextView = [segue destinationViewController];
        nextView.notes = arrayNotes;
    }
}

@end
