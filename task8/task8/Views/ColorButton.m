//
//  ColorButton.m
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//


#import "ColorButton.h"


@implementation ColorButton

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        
        self.layer.cornerRadius = 10;
        self.backgroundColor = UIColor.whiteColor;
        
        self.layer.shadowColor = UIColor.blackColor.CGColor;
        self.layer.shadowRadius = 1;
        self.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
        self.layer.shadowOpacity = 0.25;
        self.layer.masksToBounds = NO;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
    }
    return self;
}

- (void) setButtonColor:(UIColor *)color {
    self.color = color;
    self.backgroundColor = UIColor.whiteColor;
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(8, 8, 24, 24)];
    subView.backgroundColor = color;
    subView.layer.cornerRadius = 6;
    subView.userInteractionEnabled = NO;
    [self addSubview:subView];
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
            self.subviews.firstObject.layer.frame = CGRectMake(2, 2, 36, 36);
            self.subviews.firstObject.layer.cornerRadius = 8;
        }
    else {
            self.subviews.firstObject.layer.frame = CGRectMake(8, 8, 24, 24);
            self.subviews.firstObject.layer.cornerRadius = 6;
        }
}

- (void)setSelectedWithAnimation:(BOOL)selected {
    if (selected) {
        [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveLinear
                       animations:^{
                         self.subviews.firstObject.layer.frame = CGRectMake(2, 2, 36, 36);
                         self.subviews.firstObject.layer.cornerRadius = 8;
                       }
                       completion:^(BOOL finished){
                           NSLog(@"Done!");
                       }];
        }
    else {
        [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionCurveLinear
                       animations:^{
                         self.subviews.firstObject.layer.frame = CGRectMake(8, 8, 24, 24);
                         self.subviews.firstObject.layer.cornerRadius = 6;
                       }
                       completion:^(BOOL finished){
                           NSLog(@"Done!");
                       }];
        }
}

@end
