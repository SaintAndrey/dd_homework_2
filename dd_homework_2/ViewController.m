//
//  ViewController.m
//  dd_homework_2
//
//  Created by Andrey on 15/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "ViewController.h"

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
    NSRange selectedText = [self.textView selectedRange];

    UIColor *attributedColor = [sender.titleLabel textColor];

    NSMutableAttributedString *resultAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
    [resultAttributedString addAttribute:NSForegroundColorAttributeName
                                   value:attributedColor
                                   range:selectedText];

    self.textView.attributedText = resultAttributedString;
    
}
- (IBAction)pressOnButtonClear:(UIButton *)sender {
    NSMutableAttributedString *resultAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
    [resultAttributedString addAttribute:NSForegroundColorAttributeName
                                   value:[UIColor blackColor]
                                   range:NSMakeRange(0, self.textView.text.length)];
    
    self.textView.attributedText = resultAttributedString;
}


@end
