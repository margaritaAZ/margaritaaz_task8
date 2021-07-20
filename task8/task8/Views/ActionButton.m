//
//  ActionButton.m
//  task8
//
//  Created by Маргарита Жучик on 20.07.21.
//

#import "ActionButton.h"

@implementation ActionButton

- (void)setHighlighted:(BOOL)highlighted {
    if (highlighted) {
        self.layer.shadowColor = [UIColor colorNamed:@"Light Green Sea"].CGColor;
        self.layer.shadowRadius = 2;
        self.layer.shadowOpacity = 1;
        self.titleLabel.textColor = [UIColor colorNamed:@"Light Green Sea"];
    } else {
        [self setDefaultState];
    }
}

@end
