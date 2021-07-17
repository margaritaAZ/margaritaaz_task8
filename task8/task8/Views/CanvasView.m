//
//  CanvasView.m
//  task8
//
//  Created by Маргарита Жучик on 16.07.21.
//

#import "CanvasView.h"

@implementation CanvasView

-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        
        self.layer.cornerRadius = 8;
        
        self.layer.shadowColor = [UIColor colorNamed:@"Chill Sky"].CGColor;
        self.layer.shadowRadius = 4;
        self.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
        self.layer.shadowOpacity = 0.25f;
        self.layer.masksToBounds = NO;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:8].CGPath;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
