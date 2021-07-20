//
//  AButton.m
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

#import "AButton.h"

@implementation AButton

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
        
        self.layer.cornerRadius = 10;
        self.backgroundColor = UIColor.whiteColor;
        
        [self setDefaultState];
        self.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
        self.layer.masksToBounds = NO;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
//    [super setSelected:selected];
    if (selected) {
        self.layer.shadowColor = [UIColor colorNamed:@"Light Green Sea"].CGColor;
        self.layer.shadowRadius = 2;
        self.layer.shadowOpacity = 1;
    } else {
        [self setDefaultState];
   }
}

- (void)setDefaultState {
    self.layer.shadowColor = UIColor.blackColor.CGColor;
    self.layer.shadowRadius = 1;
    self.layer.shadowOpacity = 0.25;
}

@end
