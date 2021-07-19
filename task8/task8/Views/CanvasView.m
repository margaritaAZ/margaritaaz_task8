//
//  CanvasView.m
//  task8
//
//  Created by Маргарита Жучик on 16.07.21.
//

#import "CanvasView.h"

typedef NS_ENUM(NSInteger, LineType) {
    line1,
    line2,
    line3
};

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
        
//        [self startDrowings];
    }
    return self;
}

- (void) addShapelayer: (LineType) line withColor: (UIColor *) color{
    UIBezierPath *path = [UIBezierPath new];
    path = [self getPath:line];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [color CGColor];
    [self.pathLayers addObject: shapeLayer];
    [self.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = @(0.0f);
    pathAnimation.toValue = @(1.0f);
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
}

- (void)startDrowings: (NSArray<UIColor *>*) colors 
{
 NSMutableArray <UIColor *>* lineColors = [NSMutableArray arrayWithArray:colors];
    while (lineColors.count < 3) {
        [lineColors addObject: UIColor.blackColor];
    }
    self.pathLayers = [NSMutableSet new];
    [self addShapelayer:line1 withColor:lineColors[0]];
    [self addShapelayer:line2 withColor:lineColors[1]];
    [self addShapelayer:line3 withColor:lineColors[2]];
    
    [self.delegate drowingWasEnded];
}

- (void)clearView {
    for (CAShapeLayer *path in self.pathLayers) {
        [path removeFromSuperlayer];
    }
    self.pathLayers = nil;
}

- (UIBezierPath *)getPath: (LineType) lineType
{
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    switch (lineType) {
        case line1:
            [bezierPath moveToPoint: CGPointMake(61.5, 22)];
            [bezierPath addLineToPoint: CGPointMake(77, 82)];
            [bezierPath addLineToPoint: CGPointMake(89, 105)];
            [bezierPath addLineToPoint: CGPointMake(106.5, 124.5)];
            [bezierPath addLineToPoint: CGPointMake(133.5, 147)];
            [bezierPath addLineToPoint: CGPointMake(157, 152.5)];
            [bezierPath addLineToPoint: CGPointMake(193, 135)];
            [bezierPath addLineToPoint: CGPointMake(220, 105)];
            [bezierPath addLineToPoint: CGPointMake(228.5, 93)];
            [bezierPath addLineToPoint: CGPointMake(228.5, 70.5)];
            [bezierPath addLineToPoint: CGPointMake(230.5, 43.5)];
            [bezierPath addLineToPoint: CGPointMake(218.5, 33.5)];
            [bezierPath addLineToPoint: CGPointMake(202, 36.5)];
            [bezierPath addLineToPoint: CGPointMake(191, 53.5)];
            [bezierPath addLineToPoint: CGPointMake(189, 76.5)];
            [bezierPath addLineToPoint: CGPointMake(193, 89)];
            break;
            
        case line2:
            [bezierPath moveToPoint: CGPointMake(184, 93)];
            [bezierPath addLineToPoint: CGPointMake(175.5, 91.5)];
            [bezierPath addLineToPoint: CGPointMake(166, 93.5)];
            [bezierPath addLineToPoint: CGPointMake(158, 94.5)];
            [bezierPath addLineToPoint: CGPointMake(148.5, 93.5)];
            [bezierPath addLineToPoint: CGPointMake(140, 92)];
            [bezierPath addLineToPoint: CGPointMake(133.5, 91.5)];
            [bezierPath addLineToPoint: CGPointMake(126, 93)];
            [bezierPath addLineToPoint: CGPointMake(121.5, 95)];
            [bezierPath addLineToPoint: CGPointMake(127.5, 97.5)];
            [bezierPath addLineToPoint: CGPointMake(132, 101)];
            [bezierPath addLineToPoint: CGPointMake(136.5, 106)];
            [bezierPath addLineToPoint: CGPointMake(142.5, 108.5)];
            [bezierPath addLineToPoint: CGPointMake(150, 109.5)];
            [bezierPath addLineToPoint: CGPointMake(157, 108.5)];
            [bezierPath addLineToPoint: CGPointMake(164.5, 109.5)];
            [bezierPath addLineToPoint: CGPointMake(170.5, 108.5)];
            [bezierPath addLineToPoint: CGPointMake(177, 104.5)];
            [bezierPath addLineToPoint: CGPointMake(184, 96.5)];
            [bezierPath addLineToPoint: CGPointMake(188.5, 90.5)];
            [bezierPath addLineToPoint: CGPointMake(180.5, 89.5)];
            [bezierPath addLineToPoint: CGPointMake(171.5, 88.5)];
            [bezierPath addLineToPoint: CGPointMake(162.5, 86.5)];
            [bezierPath addLineToPoint: CGPointMake(154, 86)];
            [bezierPath addLineToPoint: CGPointMake(144, 87.5)];
            [bezierPath addLineToPoint: CGPointMake(135, 89.5)];
            [bezierPath addLineToPoint: CGPointMake(125, 90.5)];
            [bezierPath addLineToPoint: CGPointMake(118, 90)];
            [bezierPath addLineToPoint: CGPointMake(127.5, 84)];
            [bezierPath addLineToPoint: CGPointMake(136.5, 77.5)];
            [bezierPath addLineToPoint: CGPointMake(142.5, 74)];
            [bezierPath addLineToPoint: CGPointMake(147.5, 75.5)];
            [bezierPath addLineToPoint: CGPointMake(153, 77.5)];
            [bezierPath addLineToPoint: CGPointMake(159.5, 76.5)];
            [bezierPath addLineToPoint: CGPointMake(166, 75.5)];
            [bezierPath addLineToPoint: CGPointMake(171.5, 75.5)];
            [bezierPath addLineToPoint: CGPointMake(174.5, 77.5)];
            [bezierPath addLineToPoint: CGPointMake(179.5, 82.5)];
            [bezierPath addLineToPoint: CGPointMake(187, 87)];
            break;
            
        case line3:
            [bezierPath moveToPoint: CGPointMake(189.5, 95.5)];
            [bezierPath addLineToPoint: CGPointMake(194, 101.5)];
            [bezierPath addLineToPoint: CGPointMake(196.5, 108)];
            [bezierPath addLineToPoint: CGPointMake(193, 117)];
            [bezierPath addLineToPoint: CGPointMake(186, 125.5)];
            [bezierPath addLineToPoint: CGPointMake(177, 132.5)];
            [bezierPath addLineToPoint: CGPointMake(167.5, 125.5)];
            [bezierPath addLineToPoint: CGPointMake(157, 121.5)];
            [bezierPath addLineToPoint: CGPointMake(147.5, 121.5)];
            [bezierPath addLineToPoint: CGPointMake(135.5, 125.5)];
            [bezierPath addLineToPoint: CGPointMake(127.5, 135)];
            [bezierPath addLineToPoint: CGPointMake(121, 147.5)];
            [bezierPath addLineToPoint: CGPointMake(109.5, 140.5)];
            [bezierPath addLineToPoint: CGPointMake(101.5, 130.5)];
            [bezierPath addLineToPoint: CGPointMake(93, 121.5)];
            [bezierPath addLineToPoint: CGPointMake(93, 135)];
            [bezierPath addLineToPoint: CGPointMake(93, 163.5)];
            [bezierPath addLineToPoint: CGPointMake(93, 180.5)];
            [bezierPath addLineToPoint: CGPointMake(86, 192)];
            [bezierPath addLineToPoint: CGPointMake(74.5, 200.5)];
            [bezierPath addLineToPoint: CGPointMake(63.5, 207.5)];
            [bezierPath addLineToPoint: CGPointMake(81, 214)];
            [bezierPath addLineToPoint: CGPointMake(94.5, 222.5)];
            [bezierPath addLineToPoint: CGPointMake(105, 236.5)];
            [bezierPath addLineToPoint: CGPointMake(119, 254)];
            [bezierPath addLineToPoint: CGPointMake(138, 272)];
            [bezierPath addLineToPoint: CGPointMake(157, 278.5)];
            [bezierPath addLineToPoint: CGPointMake(171, 278.5)];
            [bezierPath addLineToPoint: CGPointMake(186, 270.5)];
            [bezierPath addLineToPoint: CGPointMake(199.5, 254)];
            [bezierPath addLineToPoint: CGPointMake(209.5, 232.5)];
            [bezierPath addLineToPoint: CGPointMake(219, 216.5)];
            [bezierPath addLineToPoint: CGPointMake(233.5, 210)];
            [bezierPath addLineToPoint: CGPointMake(237, 210)];
            [bezierPath addLineToPoint: CGPointMake(230.5, 194.5)];
            [bezierPath addLineToPoint: CGPointMake(221, 166)];
            [bezierPath addLineToPoint: CGPointMake(219, 143)];
            [bezierPath addLineToPoint: CGPointMake(219, 119.5)];
            [bezierPath addLineToPoint: CGPointMake(212, 130.5)];
            [bezierPath addLineToPoint: CGPointMake(204, 138.5)];
            [bezierPath addLineToPoint: CGPointMake(196.5, 147.5)];
            [bezierPath addLineToPoint: CGPointMake(180, 163.5)];
            [bezierPath addLineToPoint: CGPointMake(170, 178)];
            [bezierPath addLineToPoint: CGPointMake(161.5, 199.5)];
            [bezierPath addLineToPoint: CGPointMake(158.5, 225.5)];
            [bezierPath addLineToPoint: CGPointMake(158.5, 254)];
            [bezierPath addLineToPoint: CGPointMake(158.5, 272)];
            
        default:
            break;
    }
    bezierPath.lineWidth = 1;
    bezierPath.miterLimit = 4;
    bezierPath.lineCapStyle = kCGLineCapRound;
    [bezierPath stroke];
    
    return bezierPath;
}


@end
