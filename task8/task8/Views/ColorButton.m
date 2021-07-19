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
//        self.bState = disselected;
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
//        NSLog(@"%ld", (long)self.bState);
//        if (self.bState == disselected) {
            self.subviews.firstObject.layer.frame = CGRectMake(2, 2, 36, 36);
            self.subviews.firstObject.layer.cornerRadius = 8;
//            self.bState = 0;
        }
    else {
            self.subviews.firstObject.layer.frame = CGRectMake(8, 8, 24, 24);
            self.subviews.firstObject.layer.cornerRadius = 6;
//            self.bState = disselected;
        }
//    }
}




//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//}
//
//- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesEnded:touches withEvent:event];
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesCancelled:touches withEvent:event];
//}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
