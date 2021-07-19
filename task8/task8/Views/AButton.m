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
        
        self.layer.shadowColor = UIColor.blackColor.CGColor;
        self.layer.shadowRadius = 1;
        self.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
        self.layer.shadowOpacity = 0.25;
        self.layer.masksToBounds = NO;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
    }
    return self;
}

-(void)setSelected:(BOOL)selected {
    if (selected) {
        self.layer.shadowColor = [UIColor colorNamed:@"Chill Sky"].CGColor;
    } else {
        self.layer.shadowColor = UIColor.blackColor.CGColor;
    }
}

- (void)setEnabled:(BOOL)enabled {
    if (!enabled) {
        self.alpha = 0.5f;
        self.userInteractionEnabled = NO;
    } else {
        self.alpha = 1.0f;
        self.userInteractionEnabled = YES;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
