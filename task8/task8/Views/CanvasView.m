//
//  CanvasView.m
//  task8
//
//  Created by Маргарита Жучик on 16.07.21.
//

#import "CanvasView.h"

@interface CanvasView()

@property (nonatomic, strong) NSMutableSet<CAShapeLayer *>* pathLayers;

@end

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

- (void) addShapelayer: (UIBezierPath *) linePath withColor: (UIColor *) color andTimer: (float) time{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = linePath.CGPath;
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [color CGColor];
    [self.pathLayers addObject: shapeLayer];
    [self.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = time;
    pathAnimation.fromValue = @(0.0f);
    pathAnimation.toValue = @(1.0f);
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
}

- (void)startDrowings: (Drawing *) drawing {
    NSMutableArray <UIColor *>* lineColors = [NSMutableArray arrayWithArray:drawing.colors];
    while (lineColors.count < 3) {
        [lineColors addObject: UIColor.blackColor];
    }
    int count = 3;
    for (int i = 0; i < count - 1; i++) {
        int n = arc4random_uniform(count - i) + i;
        [lineColors exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    self.pathLayers = [NSMutableSet new];
    [self addShapelayer:[drawing getTemplate:Line1] withColor:lineColors[0] andTimer:drawing.timer];
    [self addShapelayer:[drawing getTemplate:Line2] withColor:lineColors[1] andTimer:drawing.timer];
    [self addShapelayer:[drawing getTemplate:Line3] withColor:lineColors[2] andTimer:drawing.timer];

    [self.delegate drowingWasEnded];
}

- (void)clearView {
    for (CAShapeLayer *path in self.pathLayers) {
        [path removeFromSuperlayer];
    }
    self.pathLayers = nil;
}

- (UIImage *) saveAsImage {
    UIGraphicsImageRenderer *render = [[UIGraphicsImageRenderer alloc] initWithBounds:self.bounds];
    return [render imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        [self.layer renderInContext:rendererContext.CGContext];
    }];
}

@end
