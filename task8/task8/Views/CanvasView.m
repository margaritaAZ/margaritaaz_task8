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

- (void)startDrowings: (NSArray<UIColor *>*) colors timer: (float) time template: (NSInteger) template{
    NSMutableArray <UIColor *>* lineColors = [NSMutableArray arrayWithArray:colors];
    while (lineColors.count < 3) {
        [lineColors addObject: UIColor.blackColor];
    }
    int count = 3;
    for (int i = 0; i < count - 1; i++) {
        int n = arc4random_uniform(count - i) + i;
        [lineColors exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    self.pathLayers = [NSMutableSet new];
    [self addShapelayer: [self getLinePath:template lineType:line1] withColor:lineColors[0] andTimer:time];
    [self addShapelayer: [self getLinePath:template lineType:line2] withColor:lineColors[1] andTimer:time];
    [self addShapelayer: [self getLinePath:template lineType:line3] withColor:lineColors[2] andTimer:time];
    
    [self.delegate drowingWasEnded];
}

- (UIBezierPath *) getLinePath: (NSInteger) template lineType: (LineType) line {
    switch (template) {
        case 0:
            return [self getPlanetPath:line];
        case 1:
            return [self getHeadPath:line];
        case 2:
            return [self getTreePath:line];
        case 3:
            return [self getlandScapePath:line];
            
        default:
            break;
    }
    return nil;
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

// MARK: - Path descriptions
- (UIBezierPath *)getPlanetPath: (LineType) lineType {
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    switch (lineType) {
        case line1:
            [bezierPath moveToPoint: CGPointMake(60.5, 155)];
            [bezierPath addLineToPoint: CGPointMake(51.5, 159)];
            [bezierPath addLineToPoint: CGPointMake(42.5, 166)];
            [bezierPath addLineToPoint: CGPointMake(34, 174)];
            [bezierPath addLineToPoint: CGPointMake(28, 182)];
            [bezierPath addLineToPoint: CGPointMake(26, 190)];
            [bezierPath addLineToPoint: CGPointMake(27, 198)];
            [bezierPath addLineToPoint: CGPointMake(31, 204.5)];
            [bezierPath addLineToPoint: CGPointMake(38, 210)];
            [bezierPath addLineToPoint: CGPointMake(48.5, 214.5)];
            [bezierPath addLineToPoint: CGPointMake(59.5, 217)];
            [bezierPath addLineToPoint: CGPointMake(71, 218)];
            [bezierPath addLineToPoint: CGPointMake(82, 218.5)];
            [bezierPath addLineToPoint: CGPointMake(88.5, 218.3)];
            [bezierPath moveToPoint: CGPointMake(60.5, 155)];
            [bezierPath addLineToPoint: CGPointMake(61, 148)];
            [bezierPath addLineToPoint: CGPointMake(63.5, 135.5)];
            [bezierPath addLineToPoint: CGPointMake(67, 125)];
            [bezierPath addLineToPoint: CGPointMake(71.5, 113.5)];
            [bezierPath addLineToPoint: CGPointMake(77, 105)];
            [bezierPath addLineToPoint: CGPointMake(84, 95.5)];
            [bezierPath addLineToPoint: CGPointMake(92, 88)];
            [bezierPath addLineToPoint: CGPointMake(100, 82.5)];
            [bezierPath addLineToPoint: CGPointMake(108.5, 77.5)];
            [bezierPath addCurveToPoint: CGPointMake(120, 72.5) controlPoint1: CGPointMake(112.17, 76) controlPoint2: CGPointMake(119.6, 72.9)];
            [bezierPath addCurveToPoint: CGPointMake(131, 69) controlPoint1: CGPointMake(120.4, 72.1) controlPoint2: CGPointMake(127.5, 70)];
            [bezierPath addLineToPoint: CGPointMake(147.5, 67.5)];
            [bezierPath addLineToPoint: CGPointMake(161.5, 68.5)];
            [bezierPath addLineToPoint: CGPointMake(175.5, 71)];
            [bezierPath addLineToPoint: CGPointMake(188, 76)];
            [bezierPath addLineToPoint: CGPointMake(200, 83.5)];
            [bezierPath addLineToPoint: CGPointMake(208.5, 90.5)];
            [bezierPath addLineToPoint: CGPointMake(215.5, 97.5)];
            [bezierPath addLineToPoint: CGPointMake(221.5, 104.5)];
            [bezierPath moveToPoint: CGPointMake(60.5, 155)];
            [bezierPath addLineToPoint: CGPointMake(60.5, 161.5)];
            [bezierPath addLineToPoint: CGPointMake(61.5, 169)];
            [bezierPath moveToPoint: CGPointMake(221.5, 104.5)];
            [bezierPath addLineToPoint: CGPointMake(230.5, 103)];
            [bezierPath addLineToPoint: CGPointMake(242.5, 102.5)];
            [bezierPath addLineToPoint: CGPointMake(254, 104)];
            [bezierPath addLineToPoint: CGPointMake(264.5, 108)];
            [bezierPath addLineToPoint: CGPointMake(271.5, 113.5)];
            [bezierPath addLineToPoint: CGPointMake(274, 121)];
            [bezierPath addLineToPoint: CGPointMake(273.5, 130)];
            [bezierPath addLineToPoint: CGPointMake(270, 138.5)];
            [bezierPath addLineToPoint: CGPointMake(259.5, 152)];
            [bezierPath addLineToPoint: CGPointMake(251, 160.5)];
            [bezierPath addLineToPoint: CGPointMake(238, 170.5)];
            [bezierPath addLineToPoint: CGPointMake(234.67, 172.5)];
            [bezierPath moveToPoint: CGPointMake(221.5, 104.5)];
            [bezierPath addLineToPoint: CGPointMake(225, 109.5)];
            [bezierPath addLineToPoint: CGPointMake(228, 116)];
            [bezierPath moveToPoint: CGPointMake(61.5, 169)];
            [bezierPath addLineToPoint: CGPointMake(57.5, 171.5)];
            [bezierPath addLineToPoint: CGPointMake(54, 176)];
            [bezierPath addLineToPoint: CGPointMake(52.5, 181)];
            [bezierPath addLineToPoint: CGPointMake(53, 186)];
            [bezierPath addLineToPoint: CGPointMake(55.5, 190)];
            [bezierPath addLineToPoint: CGPointMake(60.5, 193)];
            [bezierPath addLineToPoint: CGPointMake(68, 196)];
            [bezierPath addLineToPoint: CGPointMake(70.5, 196.47)];
            [bezierPath moveToPoint: CGPointMake(61.5, 169)];
            [bezierPath addLineToPoint: CGPointMake(64, 177.5)];
            [bezierPath addLineToPoint: CGPointMake(66.5, 186)];
            [bezierPath addLineToPoint: CGPointMake(70.5, 196.47)];
            [bezierPath moveToPoint: CGPointMake(228, 116)];
            [bezierPath addLineToPoint: CGPointMake(234.5, 116)];
            [bezierPath addLineToPoint: CGPointMake(242.5, 119)];
            [bezierPath addLineToPoint: CGPointMake(245.5, 123)];
            [bezierPath addLineToPoint: CGPointMake(246, 129)];
            [bezierPath addLineToPoint: CGPointMake(244.5, 134.5)];
            [bezierPath addLineToPoint: CGPointMake(240.5, 140)];
            [bezierPath addLineToPoint: CGPointMake(236.83, 144)];
            [bezierPath moveToPoint: CGPointMake(228, 116)];
            [bezierPath addLineToPoint: CGPointMake(231, 123)];
            [bezierPath addLineToPoint: CGPointMake(234.67, 134.5)];
            [bezierPath addLineToPoint: CGPointMake(236.83, 144)];
            [bezierPath moveToPoint: CGPointMake(88.5, 218.3)];
            [bezierPath addLineToPoint: CGPointMake(98.5, 218)];
            [bezierPath addLineToPoint: CGPointMake(119.5, 215.5)];
            [bezierPath addLineToPoint: CGPointMake(137, 212)];
            [bezierPath addLineToPoint: CGPointMake(152.5, 208)];
            [bezierPath addLineToPoint: CGPointMake(172, 202)];
            [bezierPath addLineToPoint: CGPointMake(191.5, 194.5)];
            [bezierPath addLineToPoint: CGPointMake(207, 187.5)];
            [bezierPath addLineToPoint: CGPointMake(223, 179.5)];
            [bezierPath addLineToPoint: CGPointMake(234.67, 172.5)];
            [bezierPath moveToPoint: CGPointMake(88.5, 218.3)];
            [bezierPath addLineToPoint: CGPointMake(93.5, 224)];
            [bezierPath addLineToPoint: CGPointMake(101.5, 230)];
            [bezierPath addLineToPoint: CGPointMake(110.5, 234.5)];
            [bezierPath addLineToPoint: CGPointMake(119.5, 238)];
            [bezierPath addLineToPoint: CGPointMake(130.5, 241.5)];
            [bezierPath addLineToPoint: CGPointMake(143, 243.5)];
            [bezierPath addLineToPoint: CGPointMake(155, 243.5)];
            [bezierPath addLineToPoint: CGPointMake(166, 242.5)];
            [bezierPath addLineToPoint: CGPointMake(175.5, 240)];
            [bezierPath addLineToPoint: CGPointMake(183, 237)];
            [bezierPath addLineToPoint: CGPointMake(192.5, 232.5)];
            [bezierPath addLineToPoint: CGPointMake(200, 227.5)];
            [bezierPath addLineToPoint: CGPointMake(206, 223)];
            [bezierPath addLineToPoint: CGPointMake(214, 214.5)];
            [bezierPath addLineToPoint: CGPointMake(222, 204.5)];
            [bezierPath addLineToPoint: CGPointMake(227.5, 195)];
            [bezierPath addLineToPoint: CGPointMake(232.5, 183)];
            [bezierPath addLineToPoint: CGPointMake(234.67, 172.5)];
            [bezierPath moveToPoint: CGPointMake(236.83, 144)];
            [bezierPath addLineToPoint: CGPointMake(235, 146)];
            [bezierPath addLineToPoint: CGPointMake(230, 151)];
            [bezierPath addLineToPoint: CGPointMake(224, 155.5)];
            [bezierPath addLineToPoint: CGPointMake(216.5, 160.5)];
            [bezierPath addLineToPoint: CGPointMake(209.5, 165)];
            [bezierPath addLineToPoint: CGPointMake(202.5, 169)];
            [bezierPath addLineToPoint: CGPointMake(195.5, 172.5)];
            [bezierPath addLineToPoint: CGPointMake(186.5, 177)];
            [bezierPath addLineToPoint: CGPointMake(175, 182)];
            [bezierPath addLineToPoint: CGPointMake(163.5, 186)];
            [bezierPath addLineToPoint: CGPointMake(151.5, 189.5)];
            [bezierPath addLineToPoint: CGPointMake(140, 192.5)];
            [bezierPath addLineToPoint: CGPointMake(128, 195)];
            [bezierPath addLineToPoint: CGPointMake(116, 197)];
            [bezierPath addLineToPoint: CGPointMake(104, 198)];
            [bezierPath addLineToPoint: CGPointMake(92.5, 198.5)];
            [bezierPath addLineToPoint: CGPointMake(83.5, 198)];
            [bezierPath addLineToPoint: CGPointMake(76, 197.5)];
            [bezierPath addLineToPoint: CGPointMake(70.5, 196.47)];
            break;
            
        case line2:
            [bezierPath moveToPoint: CGPointMake(156, 115.5)];
            [bezierPath addLineToPoint: CGPointMake(162, 112.5)];
            [bezierPath addLineToPoint: CGPointMake(171.5, 107)];
            [bezierPath addLineToPoint: CGPointMake(181, 100)];
            [bezierPath addLineToPoint: CGPointMake(187.5, 93)];
            [bezierPath addLineToPoint: CGPointMake(191.5, 86)];
            [bezierPath addLineToPoint: CGPointMake(194, 80)];
            [bezierPath moveToPoint: CGPointMake(109.5, 94)];
            [bezierPath addLineToPoint: CGPointMake(102.5, 93.5)];
            [bezierPath addLineToPoint: CGPointMake(96.5, 91.5)];
            [bezierPath addLineToPoint: CGPointMake(91.5, 88.5)];
            [bezierPath moveToPoint: CGPointMake(120, 92.5)];
            [bezierPath addLineToPoint: CGPointMake(127.5, 90.5)];
            [bezierPath addLineToPoint: CGPointMake(135.5, 88)];
            [bezierPath addLineToPoint: CGPointMake(143.5, 83.5)];
            [bezierPath addCurveToPoint: CGPointMake(151, 78) controlPoint1: CGPointMake(145.83, 81.83) controlPoint2: CGPointMake(150.6, 78.4)];
            [bezierPath addCurveToPoint: CGPointMake(155.5, 73) controlPoint1: CGPointMake(151.4, 77.6) controlPoint2: CGPointMake(154.17, 74.5)];
            [bezierPath addLineToPoint: CGPointMake(157.5, 68.5)];
            [bezierPath moveToPoint: CGPointMake(97.5, 109.5)];
            [bezierPath addLineToPoint: CGPointMake(102, 110.5)];
            [bezierPath addLineToPoint: CGPointMake(109.5, 110.5)];
            [bezierPath addLineToPoint: CGPointMake(117.5, 109.5)];
            [bezierPath addLineToPoint: CGPointMake(124.5, 108)];
            [bezierPath addLineToPoint: CGPointMake(133, 106)];
            [bezierPath moveToPoint: CGPointMake(103, 129)];
            [bezierPath addCurveToPoint: CGPointMake(107, 128.5) controlPoint1: CGPointMake(103.4, 129) controlPoint2: CGPointMake(105.83, 128.67)];
            [bezierPath addLineToPoint: CGPointMake(111.5, 128)];
            [bezierPath addLineToPoint: CGPointMake(115.5, 127)];
            [bezierPath moveToPoint: CGPointMake(94.5, 128.5)];
            [bezierPath addLineToPoint: CGPointMake(87, 128)];
            [bezierPath addLineToPoint: CGPointMake(80, 125.5)];
            [bezierPath addCurveToPoint: CGPointMake(73.5, 122.5) controlPoint1: CGPointMake(78, 124.5) controlPoint2: CGPointMake(73.9, 122.5)];
            [bezierPath addCurveToPoint: CGPointMake(69, 120) controlPoint1: CGPointMake(73.1, 122.5) controlPoint2: CGPointMake(70.33, 120.83)];
            [bezierPath moveToPoint: CGPointMake(86.5, 167.5)];
            [bezierPath addLineToPoint: CGPointMake(78.5, 166)];
            [bezierPath addLineToPoint: CGPointMake(69.5, 162.5)];
            [bezierPath addLineToPoint: CGPointMake(60.5, 157)];
            [bezierPath moveToPoint: CGPointMake(106.5, 167.5)];
            [bezierPath addLineToPoint: CGPointMake(112, 167.5)];
            [bezierPath addLineToPoint: CGPointMake(116.5, 167)];
            [bezierPath addLineToPoint: CGPointMake(125.5, 165.5)];
            [bezierPath addLineToPoint: CGPointMake(136, 163)];
            [bezierPath addLineToPoint: CGPointMake(145.5, 160.5)];
            [bezierPath addLineToPoint: CGPointMake(155, 157.5)];
            [bezierPath addLineToPoint: CGPointMake(164.5, 154.5)];
            [bezierPath addLineToPoint: CGPointMake(174.5, 150)];
            [bezierPath addLineToPoint: CGPointMake(184, 145.5)];
            [bezierPath addLineToPoint: CGPointMake(192, 140.5)];
            [bezierPath addLineToPoint: CGPointMake(198, 136.5)];
            [bezierPath addLineToPoint: CGPointMake(203.5, 133)];
            [bezierPath moveToPoint: CGPointMake(212, 125)];
            [bezierPath addLineToPoint: CGPointMake(216, 120)];
            [bezierPath addLineToPoint: CGPointMake(219.5, 114)];
            [bezierPath addLineToPoint: CGPointMake(222.5, 106.5)];
            [bezierPath moveToPoint: CGPointMake(125.5, 146)];
            [bezierPath addLineToPoint: CGPointMake(133.5, 144)];
            [bezierPath addLineToPoint: CGPointMake(146.5, 140)];
            [bezierPath addLineToPoint: CGPointMake(155, 137)];
            [bezierPath addLineToPoint: CGPointMake(164, 133)];
            [bezierPath addLineToPoint: CGPointMake(171.5, 129.5)];
            [bezierPath addLineToPoint: CGPointMake(178, 126)];
            [bezierPath moveToPoint: CGPointMake(86.5, 185)];
            [bezierPath addLineToPoint: CGPointMake(93.5, 185.5)];
            [bezierPath addLineToPoint: CGPointMake(101, 185.5)];
            [bezierPath addLineToPoint: CGPointMake(109, 184.5)];
            [bezierPath moveToPoint: CGPointMake(190.5, 160.5)];
            [bezierPath addLineToPoint: CGPointMake(196.5, 158.5)];
            [bezierPath addLineToPoint: CGPointMake(204, 154)];
            [bezierPath addLineToPoint: CGPointMake(213, 147)];
            [bezierPath addLineToPoint: CGPointMake(219, 142.5)];
            [bezierPath addLineToPoint: CGPointMake(223, 138)];
            [bezierPath moveToPoint: CGPointMake(167, 214.5)];
            [bezierPath addLineToPoint: CGPointMake(171.5, 213.5)];
            [bezierPath addLineToPoint: CGPointMake(180.5, 210)];
            [bezierPath addLineToPoint: CGPointMake(188.5, 206.5)];
            [bezierPath addLineToPoint: CGPointMake(195, 203.5)];
            [bezierPath addLineToPoint: CGPointMake(201, 200.5)];
            [bezierPath addLineToPoint: CGPointMake(203.5, 197.5)];
            [bezierPath moveToPoint: CGPointMake(208.5, 210)];
            [bezierPath addLineToPoint: CGPointMake(214.5, 206.5)];
            [bezierPath addLineToPoint: CGPointMake(220, 202.5)];
            [bezierPath addLineToPoint: CGPointMake(227.5, 195)];
            [bezierPath moveToPoint: CGPointMake(198, 216)];
            [bezierPath addLineToPoint: CGPointMake(190.5, 219.5)];
            [bezierPath addLineToPoint: CGPointMake(180, 223.5)];
            [bezierPath addLineToPoint: CGPointMake(170, 227)];
            [bezierPath addLineToPoint: CGPointMake(159, 230)];
            [bezierPath addLineToPoint: CGPointMake(148.5, 232.5)];
            [bezierPath addLineToPoint: CGPointMake(134.5, 234)];
            [bezierPath addLineToPoint: CGPointMake(121, 234.5)];
            [bezierPath addLineToPoint: CGPointMake(109.5, 234)];
            
            break;
            
        case line3:
            [bezierPath moveToPoint: CGPointMake(252.5, 182)];
            [bezierPath addLineToPoint: CGPointMake(257.5, 178.5)];
            [bezierPath addLineToPoint: CGPointMake(264.5, 179)];
            [bezierPath addLineToPoint: CGPointMake(269, 182.5)];
            [bezierPath addLineToPoint: CGPointMake(270.5, 187.5)];
            [bezierPath addLineToPoint: CGPointMake(269.5, 192)];
            [bezierPath addLineToPoint: CGPointMake(266.5, 196.5)];
            [bezierPath addLineToPoint: CGPointMake(261.5, 198)];
            [bezierPath addLineToPoint: CGPointMake(255.5, 197)];
            [bezierPath addLineToPoint: CGPointMake(251.5, 193)];
            [bezierPath addLineToPoint: CGPointMake(250, 188)];
            [bezierPath addLineToPoint: CGPointMake(252.5, 182)];
            [bezierPath closePath];
            
            [bezierPath moveToPoint: CGPointMake(240, 212)];
            [bezierPath addLineToPoint: CGPointMake(242, 210)];
            [bezierPath addLineToPoint: CGPointMake(244.5, 210)];
            [bezierPath addLineToPoint: CGPointMake(246.5, 211.5)];
            [bezierPath addLineToPoint: CGPointMake(247, 214)];
            [bezierPath addLineToPoint: CGPointMake(246, 216)];
            [bezierPath addLineToPoint: CGPointMake(243.5, 217)];
            [bezierPath addLineToPoint: CGPointMake(241, 216.5)];
            [bezierPath addLineToPoint: CGPointMake(239.5, 214.5)];
            [bezierPath addLineToPoint: CGPointMake(240, 212)];
            [bezierPath closePath];
            
            [bezierPath moveToPoint: CGPointMake(74.5, 243)];
            [bezierPath addLineToPoint: CGPointMake(76.5, 242)];
            [bezierPath addLineToPoint: CGPointMake(79.5, 243)];
            [bezierPath addCurveToPoint: CGPointMake(81, 245.5) controlPoint1: CGPointMake(80, 243.67) controlPoint2: CGPointMake(81, 245.1)];
            [bezierPath addCurveToPoint: CGPointMake(81, 248.5) controlPoint1: CGPointMake(81, 245.9) controlPoint2: CGPointMake(81.17, 247.83)];
            [bezierPath addLineToPoint: CGPointMake(78.5, 250)];
            [bezierPath addLineToPoint: CGPointMake(75, 250)];
            [bezierPath addLineToPoint: CGPointMake(73.5, 248)];
            [bezierPath addLineToPoint: CGPointMake(73, 245.5)];
            [bezierPath addLineToPoint: CGPointMake(74.5, 243)];
            [bezierPath closePath];
            
            [bezierPath moveToPoint: CGPointMake(35.5, 77.5)];
            [bezierPath addCurveToPoint: CGPointMake(41.5, 73) controlPoint1: CGPointMake(37.33, 76) controlPoint2: CGPointMake(41.1, 73)];
            [bezierPath addLineToPoint: CGPointMake(48, 72)];
            [bezierPath addLineToPoint: CGPointMake(54.5, 74)];
            [bezierPath addLineToPoint: CGPointMake(60.5, 81)];
            [bezierPath addLineToPoint: CGPointMake(61, 90.5)];
            [bezierPath addLineToPoint: CGPointMake(57, 98)];
            [bezierPath addLineToPoint: CGPointMake(48.5, 102)];
            [bezierPath addLineToPoint: CGPointMake(39.5, 100)];
            [bezierPath addLineToPoint: CGPointMake(33.5, 95.5)];
            [bezierPath addLineToPoint: CGPointMake(31.5, 86.5)];
            [bezierPath addLineToPoint: CGPointMake(35.5, 77.5)];
            [bezierPath closePath];
            
        default:
            break;
    }
    bezierPath.lineWidth = 1;
    bezierPath.miterLimit = 4;
    bezierPath.lineCapStyle = kCGLineCapRound;
    [bezierPath stroke];
    
    return bezierPath;
}
- (UIBezierPath *)getHeadPath: (LineType) lineType {
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

- (UIBezierPath *)getTreePath: (LineType) lineType
{
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    switch (lineType) {
        case line1:
            [bezierPath moveToPoint: CGPointMake(212.19, 81.76)];
            [bezierPath addCurveToPoint: CGPointMake(216, 72.5) controlPoint1: CGPointMake(214.57, 79.25) controlPoint2: CGPointMake(216, 76.02)];
            [bezierPath addCurveToPoint: CGPointMake(199.5, 58) controlPoint1: CGPointMake(216, 64.49) controlPoint2: CGPointMake(208.61, 58)];
            [bezierPath addCurveToPoint: CGPointMake(194.97, 58.55) controlPoint1: CGPointMake(197.93, 58) controlPoint2: CGPointMake(196.41, 58.19)];
            [bezierPath addCurveToPoint: CGPointMake(178.5, 45) controlPoint1: CGPointMake(194.41, 50.99) controlPoint2: CGPointMake(187.25, 45)];
            [bezierPath addCurveToPoint: CGPointMake(170.6, 46.77) controlPoint1: CGPointMake(175.64, 45) controlPoint2: CGPointMake(172.94, 45.64)];
            [bezierPath addCurveToPoint: CGPointMake(159.5, 43) controlPoint1: CGPointMake(167.67, 44.43) controlPoint2: CGPointMake(163.77, 43)];
            [bezierPath addCurveToPoint: CGPointMake(154.97, 43.55) controlPoint1: CGPointMake(157.93, 43) controlPoint2: CGPointMake(156.41, 43.19)];
            [bezierPath addCurveToPoint: CGPointMake(138.5, 30) controlPoint1: CGPointMake(154.41, 35.99) controlPoint2: CGPointMake(147.25, 30)];
            [bezierPath addCurveToPoint: CGPointMake(124.59, 36.7) controlPoint1: CGPointMake(132.65, 30) controlPoint2: CGPointMake(127.52, 32.67)];
            [bezierPath addCurveToPoint: CGPointMake(119.5, 36) controlPoint1: CGPointMake(122.98, 36.25) controlPoint2: CGPointMake(121.28, 36)];
            [bezierPath addCurveToPoint: CGPointMake(109.81, 38.77) controlPoint1: CGPointMake(115.88, 36) controlPoint2: CGPointMake(112.53, 37.03)];
            [bezierPath addCurveToPoint: CGPointMake(104.5, 38) controlPoint1: CGPointMake(108.14, 38.27) controlPoint2: CGPointMake(106.36, 38)];
            [bezierPath addCurveToPoint: CGPointMake(90.59, 44.7) controlPoint1: CGPointMake(98.65, 38) controlPoint2: CGPointMake(93.52, 40.67)];
            [bezierPath addCurveToPoint: CGPointMake(85.5, 44) controlPoint1: CGPointMake(88.98, 44.25) controlPoint2: CGPointMake(87.28, 44)];
            [bezierPath addCurveToPoint: CGPointMake(69, 58.5) controlPoint1: CGPointMake(76.39, 44) controlPoint2: CGPointMake(69, 50.49)];
            [bezierPath addCurveToPoint: CGPointMake(69.01, 59.02) controlPoint1: CGPointMake(69, 58.68) controlPoint2: CGPointMake(69, 58.85)];
            [bezierPath addCurveToPoint: CGPointMake(67.59, 60.7) controlPoint1: CGPointMake(68.49, 59.55) controlPoint2: CGPointMake(68.02, 60.11)];
            [bezierPath addCurveToPoint: CGPointMake(62.5, 60) controlPoint1: CGPointMake(65.98, 60.25) controlPoint2: CGPointMake(64.28, 60)];
            [bezierPath addCurveToPoint: CGPointMake(46, 74.5) controlPoint1: CGPointMake(53.39, 60) controlPoint2: CGPointMake(46, 66.49)];
            [bezierPath addCurveToPoint: CGPointMake(47.58, 80.71) controlPoint1: CGPointMake(46, 76.72) controlPoint2: CGPointMake(46.57, 78.83)];
            [bezierPath addCurveToPoint: CGPointMake(45, 88.5) controlPoint1: CGPointMake(45.95, 82.96) controlPoint2: CGPointMake(45, 85.63)];
            [bezierPath addCurveToPoint: CGPointMake(46.19, 93.92) controlPoint1: CGPointMake(45, 90.42) controlPoint2: CGPointMake(45.42, 92.25)];
            [bezierPath addCurveToPoint: CGPointMake(43, 102.5) controlPoint1: CGPointMake(44.19, 96.33) controlPoint2: CGPointMake(43, 99.29)];
            [bezierPath addCurveToPoint: CGPointMake(44.58, 108.71) controlPoint1: CGPointMake(43, 104.72) controlPoint2: CGPointMake(43.57, 106.83)];
            [bezierPath addCurveToPoint: CGPointMake(42, 116.5) controlPoint1: CGPointMake(42.95, 110.96) controlPoint2: CGPointMake(42, 113.63)];
            [bezierPath addCurveToPoint: CGPointMake(58.5, 131) controlPoint1: CGPointMake(42, 124.51) controlPoint2: CGPointMake(49.39, 131)];
            [bezierPath addCurveToPoint: CGPointMake(60.68, 130.88) controlPoint1: CGPointMake(59.24, 131) controlPoint2: CGPointMake(59.96, 130.96)];
            [bezierPath addCurveToPoint: CGPointMake(75.5, 139) controlPoint1: CGPointMake(63.36, 135.69) controlPoint2: CGPointMake(68.99, 139)];
            [bezierPath addCurveToPoint: CGPointMake(83.35, 137.26) controlPoint1: CGPointMake(78.34, 139) controlPoint2: CGPointMake(81.02, 138.37)];
            [bezierPath addCurveToPoint: CGPointMake(98.5, 146) controlPoint1: CGPointMake(85.89, 142.4) controlPoint2: CGPointMake(91.71, 146)];
            [bezierPath addCurveToPoint: CGPointMake(100.68, 145.88) controlPoint1: CGPointMake(99.24, 146) controlPoint2: CGPointMake(99.96, 145.96)];
            [bezierPath addCurveToPoint: CGPointMake(115.5, 154) controlPoint1: CGPointMake(103.36, 150.69) controlPoint2: CGPointMake(108.99, 154)];
            [bezierPath addCurveToPoint: CGPointMake(124, 151.93) controlPoint1: CGPointMake(118.61, 154) controlPoint2: CGPointMake(121.52, 153.24)];
            [bezierPath addCurveToPoint: CGPointMake(128.66, 153.6) controlPoint1: CGPointMake(125.43, 152.69) controlPoint2: CGPointMake(126.99, 153.26)];
            [bezierPath addCurveToPoint: CGPointMake(141.5, 159) controlPoint1: CGPointMake(131.68, 156.9) controlPoint2: CGPointMake(136.31, 159)];
            [bezierPath addCurveToPoint: CGPointMake(149.35, 157.26) controlPoint1: CGPointMake(144.34, 159) controlPoint2: CGPointMake(147.02, 158.37)];
            [bezierPath addCurveToPoint: CGPointMake(164.5, 166) controlPoint1: CGPointMake(151.89, 162.4) controlPoint2: CGPointMake(157.72, 166)];
            [bezierPath addCurveToPoint: CGPointMake(166.68, 165.88) controlPoint1: CGPointMake(165.24, 166) controlPoint2: CGPointMake(165.96, 165.96)];
            [bezierPath addCurveToPoint: CGPointMake(181.5, 174) controlPoint1: CGPointMake(169.36, 170.69) controlPoint2: CGPointMake(174.99, 174)];
            [bezierPath addCurveToPoint: CGPointMake(190, 171.93) controlPoint1: CGPointMake(184.61, 174) controlPoint2: CGPointMake(187.52, 173.24)];
            [bezierPath addCurveToPoint: CGPointMake(198.5, 174) controlPoint1: CGPointMake(192.48, 173.24) controlPoint2: CGPointMake(195.39, 174)];
            [bezierPath addCurveToPoint: CGPointMake(215, 159.5) controlPoint1: CGPointMake(207.61, 174) controlPoint2: CGPointMake(215, 167.51)];
            [bezierPath addCurveToPoint: CGPointMake(214.99, 158.99) controlPoint1: CGPointMake(215, 159.33) controlPoint2: CGPointMake(215, 159.16)];
            [bezierPath addCurveToPoint: CGPointMake(215.5, 159) controlPoint1: CGPointMake(215.16, 159) controlPoint2: CGPointMake(215.33, 159)];
            [bezierPath addCurveToPoint: CGPointMake(224, 156.93) controlPoint1: CGPointMake(218.61, 159) controlPoint2: CGPointMake(221.52, 158.24)];
            [bezierPath addCurveToPoint: CGPointMake(232.5, 159) controlPoint1: CGPointMake(226.48, 158.24) controlPoint2: CGPointMake(229.39, 159)];
            [bezierPath addCurveToPoint: CGPointMake(249, 144.5) controlPoint1: CGPointMake(241.61, 159) controlPoint2: CGPointMake(249, 152.51)];
            [bezierPath addCurveToPoint: CGPointMake(248.66, 141.56) controlPoint1: CGPointMake(249, 143.49) controlPoint2: CGPointMake(248.88, 142.51)];
            [bezierPath addCurveToPoint: CGPointMake(256, 129.5) controlPoint1: CGPointMake(253.09, 138.96) controlPoint2: CGPointMake(256, 134.53)];
            [bezierPath addCurveToPoint: CGPointMake(252.19, 120.23) controlPoint1: CGPointMake(256, 125.98) controlPoint2: CGPointMake(254.57, 122.75)];
            [bezierPath addCurveToPoint: CGPointMake(259, 108.5) controlPoint1: CGPointMake(256.32, 117.6) controlPoint2: CGPointMake(259, 113.33)];
            [bezierPath addCurveToPoint: CGPointMake(242.5, 94) controlPoint1: CGPointMake(259, 100.49) controlPoint2: CGPointMake(251.61, 94)];
            [bezierPath addCurveToPoint: CGPointMake(237.97, 94.55) controlPoint1: CGPointMake(240.93, 94) controlPoint2: CGPointMake(239.41, 94.19)];
            [bezierPath addCurveToPoint: CGPointMake(221.5, 81) controlPoint1: CGPointMake(237.41, 86.99) controlPoint2: CGPointMake(230.25, 81)];
            [bezierPath addCurveToPoint: CGPointMake(213.6, 82.77) controlPoint1: CGPointMake(218.64, 81) controlPoint2: CGPointMake(215.94, 81.64)];
            [bezierPath addCurveToPoint: CGPointMake(212.19, 81.76) controlPoint1: CGPointMake(213.15, 82.41) controlPoint2: CGPointMake(212.68, 82.08)];
            [bezierPath closePath];
            bezierPath.usesEvenOddFillRule = YES;
            [bezierPath addClip];
            break;
            
        case line2:
            [bezierPath moveToPoint: CGPointMake(81, 266.5)];
            [bezierPath addCurveToPoint: CGPointMake(142.5, 203.5) controlPoint1: CGPointMake(100.83, 260.67) controlPoint2: CGPointMake(140.9, 239.9)];
            [bezierPath addCurveToPoint: CGPointMake(132.5, 156.5) controlPoint1: CGPointMake(144.1, 167.1) controlPoint2: CGPointMake(136.5, 157)];
            [bezierPath moveToPoint: CGPointMake(224.5, 272)];
            [bezierPath addCurveToPoint: CGPointMake(171, 243) controlPoint1: CGPointMake(206.17, 271) controlPoint2: CGPointMake(169.8, 263.8)];
            [bezierPath addCurveToPoint: CGPointMake(182, 184.5) controlPoint1: CGPointMake(172.2, 222.2) controlPoint2: CGPointMake(178.83, 195.33)];
            [bezierPath addCurveToPoint: CGPointMake(191.5, 172.5) controlPoint1: CGPointMake(184.17, 180.17) controlPoint2: CGPointMake(189.1, 171.7)];
            [bezierPath moveToPoint: CGPointMake(157.5, 181)];
            [bezierPath addCurveToPoint: CGPointMake(150, 230) controlPoint1: CGPointMake(156, 196.17) controlPoint2: CGPointMake(152.4, 227.2)];
            [bezierPath moveToPoint: CGPointMake(162.5, 255.5)];
            [bezierPath addCurveToPoint: CGPointMake(167.5, 184.5) controlPoint1: CGPointMake(162.5, 247.5) controlPoint2: CGPointMake(161.5, 199)];
            [bezierPath moveToPoint: CGPointMake(144, 223.5)];
            [bezierPath addCurveToPoint: CGPointMake(123.5, 252.5) controlPoint1: CGPointMake(131, 242.5) controlPoint2: CGPointMake(129.5, 247)];
            break;
            
        case line3:
            [bezierPath moveToPoint: CGPointMake(98.5, 259.5)];
            [bezierPath addCurveToPoint: CGPointMake(65, 264.81) controlPoint1: CGPointMake(90.5, 251) controlPoint2: CGPointMake(75.4, 251.61)];
            [bezierPath moveToPoint: CGPointMake(38.5, 271)];
            [bezierPath addCurveToPoint: CGPointMake(62.5, 264) controlPoint1: CGPointMake(41.83, 267.17) controlPoint2: CGPointMake(51.3, 260.4)];
            [bezierPath addCurveToPoint: CGPointMake(73, 268) controlPoint1: CGPointMake(73.7, 267.6) controlPoint2: CGPointMake(74.17, 268.17)];
            [bezierPath moveToPoint: CGPointMake(177, 256.5)];
            [bezierPath addCurveToPoint: CGPointMake(200.5, 256.5) controlPoint1: CGPointMake(182, 253.73) controlPoint2: CGPointMake(193.7, 249.85)];
            [bezierPath addCurveToPoint: CGPointMake(205.74, 262.5) controlPoint1: CGPointMake(202.78, 258.73) controlPoint2: CGPointMake(204.48, 260.74)];
            [bezierPath moveToPoint: CGPointMake(209, 269.5)];
            [bezierPath addCurveToPoint: CGPointMake(205.74, 262.5) controlPoint1: CGPointMake(209, 268.46) controlPoint2: CGPointMake(208.25, 265.99)];
            [bezierPath moveToPoint: CGPointMake(205.74, 262.5)];
            [bezierPath addCurveToPoint: CGPointMake(240.5, 264) controlPoint1: CGPointMake(217.33, 259.33) controlPoint2: CGPointMake(240.5, 255.2)];
            [bezierPath addCurveToPoint: CGPointMake(223.5, 272) controlPoint1: CGPointMake(240.5, 272.8) controlPoint2: CGPointMake(224.83, 271.17)];
            
        default:
            break;
    }
    bezierPath.lineWidth = 1;
    bezierPath.miterLimit = 4;
    bezierPath.lineCapStyle = kCGLineCapRound;
    [bezierPath stroke];
    
    return bezierPath;
}

- (UIBezierPath *)getlandScapePath: (LineType) lineType {
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    switch (lineType) {
        case line1:
            [bezierPath moveToPoint: CGPointMake(255, 135)];
            [bezierPath addLineToPoint: CGPointMake(261.5, 144.5)];
            [bezierPath addLineToPoint: CGPointMake(274, 157)];
            [bezierPath addLineToPoint: CGPointMake(273, 140.5)];
            [bezierPath addLineToPoint: CGPointMake(270.5, 125)];
            [bezierPath addLineToPoint: CGPointMake(265.5, 111.5)];
            [bezierPath addLineToPoint: CGPointMake(261.5, 103)];
            [bezierPath addLineToPoint: CGPointMake(257.5, 95.5)];
            [bezierPath addLineToPoint: CGPointMake(251.5, 87)];
            [bezierPath addLineToPoint: CGPointMake(246.5, 86.5)];
            [bezierPath addLineToPoint: CGPointMake(244, 86.5)];
            [bezierPath addLineToPoint: CGPointMake(240, 87)];
            [bezierPath addLineToPoint: CGPointMake(236, 88.5)];
            [bezierPath addLineToPoint: CGPointMake(232.5, 86.5)];
            [bezierPath addLineToPoint: CGPointMake(229.5, 85.5)];
            [bezierPath addLineToPoint: CGPointMake(225.5, 86.5)];
            [bezierPath addLineToPoint: CGPointMake(220.5, 86.5)];
            [bezierPath addLineToPoint: CGPointMake(216, 88.5)];
            [bezierPath addLineToPoint: CGPointMake(213, 87)];
            [bezierPath addLineToPoint: CGPointMake(209, 85.5)];
            [bezierPath addLineToPoint: CGPointMake(205, 85.5)];
            [bezierPath addLineToPoint: CGPointMake(198, 85.5)];
            [bezierPath addLineToPoint: CGPointMake(191.5, 85.5)];
            [bezierPath addLineToPoint: CGPointMake(188.5, 87)];
            [bezierPath addLineToPoint: CGPointMake(182, 85.5)];
            [bezierPath addLineToPoint: CGPointMake(176, 85.5)];
            [bezierPath addLineToPoint: CGPointMake(172, 84.5)];
            [bezierPath addLineToPoint: CGPointMake(166.5, 86.5)];
            [bezierPath addLineToPoint: CGPointMake(163, 84.5)];
            [bezierPath addLineToPoint: CGPointMake(156, 84.5)];
            [bezierPath addLineToPoint: CGPointMake(161.5, 83)];
            [bezierPath addLineToPoint: CGPointMake(165, 80)];
            [bezierPath addLineToPoint: CGPointMake(166.5, 78)];
            [bezierPath addLineToPoint: CGPointMake(169.5, 75.5)];
            [bezierPath addLineToPoint: CGPointMake(172, 72)];
            [bezierPath addLineToPoint: CGPointMake(176, 72)];
            [bezierPath addLineToPoint: CGPointMake(183.5, 72)];
            [bezierPath addLineToPoint: CGPointMake(189, 72)];
            [bezierPath addLineToPoint: CGPointMake(194, 69)];
            [bezierPath addLineToPoint: CGPointMake(196, 65)];
            [bezierPath addLineToPoint: CGPointMake(202.5, 64)];
            [bezierPath addLineToPoint: CGPointMake(206, 66.5)];
            [bezierPath addLineToPoint: CGPointMake(210, 65)];
            [bezierPath addLineToPoint: CGPointMake(214, 66.5)];
            [bezierPath addLineToPoint: CGPointMake(216, 62.5)];
            [bezierPath addLineToPoint: CGPointMake(220.5, 60.5)];
            [bezierPath addLineToPoint: CGPointMake(226.5, 60.5)];
            [bezierPath addLineToPoint: CGPointMake(216, 53)];
            [bezierPath addLineToPoint: CGPointMake(202.5, 45.5)];
            [bezierPath addLineToPoint: CGPointMake(185, 38.5)];
            [bezierPath addLineToPoint: CGPointMake(165, 34.5)];
            [bezierPath addLineToPoint: CGPointMake(149.5, 33.5)];
            [bezierPath addLineToPoint: CGPointMake(132.5, 34.5)];
            [bezierPath addLineToPoint: CGPointMake(116, 37)];
            [bezierPath addLineToPoint: CGPointMake(103, 42)];
            [bezierPath addLineToPoint: CGPointMake(91.5, 47)];
            [bezierPath addLineToPoint: CGPointMake(97, 50)];
            [bezierPath addLineToPoint: CGPointMake(101, 54)];
            [bezierPath addLineToPoint: CGPointMake(104, 59.5)];
            [bezierPath addLineToPoint: CGPointMake(104.5, 65)];
            [bezierPath addLineToPoint: CGPointMake(101, 73)];
            [bezierPath addLineToPoint: CGPointMake(95.5, 78)];
            [bezierPath addLineToPoint: CGPointMake(91.5, 80)];
            [bezierPath addLineToPoint: CGPointMake(87, 80)];
            [bezierPath addLineToPoint: CGPointMake(80, 77)];
            [bezierPath addLineToPoint: CGPointMake(75, 73)];
            [bezierPath addLineToPoint: CGPointMake(71.5, 66.5)];
            [bezierPath addLineToPoint: CGPointMake(71.5, 60.5)];
            [bezierPath addLineToPoint: CGPointMake(59, 71.5)];
            [bezierPath addLineToPoint: CGPointMake(50.5, 81.5)];
            [bezierPath addLineToPoint: CGPointMake(43, 93)];
            [bezierPath addLineToPoint: CGPointMake(37.5, 104)];
            [bezierPath addLineToPoint: CGPointMake(36, 110)];
            [bezierPath addLineToPoint: CGPointMake(39.5, 110)];
            [bezierPath addLineToPoint: CGPointMake(43, 109)];
            [bezierPath addLineToPoint: CGPointMake(49.5, 113)];
            [bezierPath addLineToPoint: CGPointMake(55.5, 113)];
            [bezierPath addLineToPoint: CGPointMake(61.5, 118)];
            [bezierPath addLineToPoint: CGPointMake(65, 117)];
            [bezierPath addLineToPoint: CGPointMake(70, 119.5)];
            [bezierPath addLineToPoint: CGPointMake(67.5, 120.5)];
            [bezierPath addLineToPoint: CGPointMake(61.5, 122)];
            [bezierPath addLineToPoint: CGPointMake(56.5, 121)];
            [bezierPath addLineToPoint: CGPointMake(54.5, 122)];
            [bezierPath addLineToPoint: CGPointMake(50.5, 122)];
            [bezierPath addLineToPoint: CGPointMake(47.5, 122)];
            [bezierPath addLineToPoint: CGPointMake(45.5, 124)];
            [bezierPath addLineToPoint: CGPointMake(43.5, 123)];
            [bezierPath addLineToPoint: CGPointMake(41.5, 123)];
            [bezierPath addLineToPoint: CGPointMake(36, 120.5)];
            [bezierPath addLineToPoint: CGPointMake(30.5, 123)];
            [bezierPath addLineToPoint: CGPointMake(28, 131.5)];
            [bezierPath addLineToPoint: CGPointMake(26, 157.5)];
            [bezierPath addLineToPoint: CGPointMake(30.5, 187.5)];
            [bezierPath addLineToPoint: CGPointMake(37.5, 180.5)];
            [bezierPath addLineToPoint: CGPointMake(43, 176.5)];
            [bezierPath addLineToPoint: CGPointMake(54.5, 164)];
            [bezierPath addLineToPoint: CGPointMake(65, 152.5)];
            [bezierPath moveToPoint: CGPointMake(255, 135)];
            [bezierPath addLineToPoint: CGPointMake(244, 140.5)];
            [bezierPath moveToPoint: CGPointMake(255, 135)];
            [bezierPath addLineToPoint: CGPointMake(253.17, 144.5)];
            [bezierPath addLineToPoint: CGPointMake(253.17, 156)];
            [bezierPath moveToPoint: CGPointMake(244, 140.5)];
            [bezierPath addLineToPoint: CGPointMake(232.5, 117)];
            [bezierPath addLineToPoint: CGPointMake(224, 109.5)];
            [bezierPath addLineToPoint: CGPointMake(216, 119.5)];
            [bezierPath addLineToPoint: CGPointMake(205, 132)];
            [bezierPath addLineToPoint: CGPointMake(200.5, 129.5)];
            [bezierPath addLineToPoint: CGPointMake(183.5, 147.5)];
            [bezierPath addLineToPoint: CGPointMake(169.5, 168)];
            [bezierPath moveToPoint: CGPointMake(244, 140.5)];
            [bezierPath addLineToPoint: CGPointMake(248, 147.5)];
            [bezierPath addLineToPoint: CGPointMake(253.17, 156)];
            [bezierPath moveToPoint: CGPointMake(169.5, 168)];
            [bezierPath addLineToPoint: CGPointMake(161.5, 159)];
            [bezierPath addLineToPoint: CGPointMake(141, 139)];
            [bezierPath addLineToPoint: CGPointMake(133.5, 119.5)];
            [bezierPath addLineToPoint: CGPointMake(129, 119.5)];
            [bezierPath addLineToPoint: CGPointMake(122.5, 109.5)];
            [bezierPath moveToPoint: CGPointMake(169.5, 168)];
            [bezierPath addLineToPoint: CGPointMake(169.5, 170.5)];
            [bezierPath addLineToPoint: CGPointMake(173, 174)];
            [bezierPath addLineToPoint: CGPointMake(180.25, 181.25)];
            [bezierPath moveToPoint: CGPointMake(122.5, 109.5)];
            [bezierPath addLineToPoint: CGPointMake(111, 118)];
            [bezierPath addLineToPoint: CGPointMake(107.5, 125)];
            [bezierPath addLineToPoint: CGPointMake(96.5, 137.5)];
            [bezierPath addLineToPoint: CGPointMake(90.5, 135)];
            [bezierPath moveToPoint: CGPointMake(122.5, 109.5)];
            [bezierPath addLineToPoint: CGPointMake(118.5, 117)];
            [bezierPath addLineToPoint: CGPointMake(117, 125)];
            [bezierPath moveToPoint: CGPointMake(90.5, 135)];
            [bezierPath addLineToPoint: CGPointMake(75, 155)];
            [bezierPath addLineToPoint: CGPointMake(65, 152.5)];
            [bezierPath moveToPoint: CGPointMake(90.5, 135)];
            [bezierPath addLineToPoint: CGPointMake(90.5, 147.5)];
            [bezierPath addLineToPoint: CGPointMake(92.5, 159)];
            [bezierPath moveToPoint: CGPointMake(65, 152.5)];
            [bezierPath addLineToPoint: CGPointMake(68.5, 158.5)];
            [bezierPath addLineToPoint: CGPointMake(70, 165.5)];
            [bezierPath addLineToPoint: CGPointMake(70, 175)];
            [bezierPath addLineToPoint: CGPointMake(75, 184.5)];
            [bezierPath moveToPoint: CGPointMake(187.5, 188.5)];
            [bezierPath addLineToPoint: CGPointMake(180.25, 181.25)];
            [bezierPath moveToPoint: CGPointMake(264.5, 176)];
            [bezierPath addLineToPoint: CGPointMake(255, 159)];
            [bezierPath addLineToPoint: CGPointMake(253.17, 156)];
            [bezierPath moveToPoint: CGPointMake(180.25, 181.25)];
            [bezierPath addLineToPoint: CGPointMake(194, 176.5)];
            [bezierPath addLineToPoint: CGPointMake(195.16, 178)];
            [bezierPath moveToPoint: CGPointMake(202.5, 187.5)];
            [bezierPath addLineToPoint: CGPointMake(195.16, 178)];
            [bezierPath moveToPoint: CGPointMake(195.16, 178)];
            [bezierPath addLineToPoint: CGPointMake(202.5, 175)];
            [bezierPath addLineToPoint: CGPointMake(209, 178)];
            [bezierPath addLineToPoint: CGPointMake(219, 184.5)];
            [bezierPath addLineToPoint: CGPointMake(229.5, 188.5)];
            [bezierPath addLineToPoint: CGPointMake(238, 195.5)];
            [bezierPath addLineToPoint: CGPointMake(244, 197)];
            [bezierPath addLineToPoint: CGPointMake(259.5, 209)];
            [bezierPath moveToPoint: CGPointMake(114, 150)];
            [bezierPath addLineToPoint: CGPointMake(114, 141.5)];
            [bezierPath addLineToPoint: CGPointMake(115.5, 132)];
            break;
            
        case line2:
            [bezierPath moveToPoint: CGPointMake(41.5, 214.5)];
            [bezierPath addLineToPoint: CGPointMake(56, 214.5)];
            [bezierPath addLineToPoint: CGPointMake(70, 211)];
            [bezierPath addLineToPoint: CGPointMake(87.5, 201.5)];
            [bezierPath addLineToPoint: CGPointMake(104.5, 196.5)];
            [bezierPath addLineToPoint: CGPointMake(120.5, 203)];
            [bezierPath addLineToPoint: CGPointMake(133.25, 208.75)];
            [bezierPath moveToPoint: CGPointMake(146, 214.5)];
            [bezierPath addLineToPoint: CGPointMake(133.25, 208.75)];
            [bezierPath moveToPoint: CGPointMake(133.25, 208.75)];
            [bezierPath addLineToPoint: CGPointMake(146, 205)];
            [bezierPath addLineToPoint: CGPointMake(156, 206.5)];
            [bezierPath addLineToPoint: CGPointMake(165.5, 208.75)];
            [bezierPath addLineToPoint: CGPointMake(179, 211)];
            [bezierPath addLineToPoint: CGPointMake(201, 218.5)];
            [bezierPath moveToPoint: CGPointMake(191.5, 221)];
            [bezierPath addLineToPoint: CGPointMake(204, 218.5)];
            [bezierPath addLineToPoint: CGPointMake(214.5, 213)];
            [bezierPath addLineToPoint: CGPointMake(228.5, 213)];
            [bezierPath addLineToPoint: CGPointMake(243, 213)];
            [bezierPath addLineToPoint: CGPointMake(263, 208.75)];
            [bezierPath moveToPoint: CGPointMake(62.5, 242.5)];
            [bezierPath addLineToPoint: CGPointMake(76.5, 242.5)];
            [bezierPath addLineToPoint: CGPointMake(93.5, 239)];
            [bezierPath addLineToPoint: CGPointMake(110.5, 242.5)];
            [bezierPath addLineToPoint: CGPointMake(135, 245.5)];
            [bezierPath addLineToPoint: CGPointMake(179, 250)];
            [bezierPath moveToPoint: CGPointMake(146, 259.5)];
            [bezierPath addLineToPoint: CGPointMake(169.5, 253.5)];
            [bezierPath addLineToPoint: CGPointMake(191.5, 242.5)];
            [bezierPath addLineToPoint: CGPointMake(204, 236)];
            [bezierPath addLineToPoint: CGPointMake(222.5, 236)];
            [bezierPath addLineToPoint: CGPointMake(244.5, 236)];
            [bezierPath moveToPoint: CGPointMake(92, 266)];
            [bezierPath addLineToPoint: CGPointMake(104.5, 263.5)];
            [bezierPath addLineToPoint: CGPointMake(129, 266)];
            [bezierPath addLineToPoint: CGPointMake(157, 267)];
            [bezierPath addLineToPoint: CGPointMake(179, 267)];
            [bezierPath addLineToPoint: CGPointMake(201, 259.5)];
            [bezierPath addLineToPoint: CGPointMake(224, 257)];
            break;
            
        case line3:
            [bezierPath moveToPoint: CGPointMake(109.5, 154)];
            [bezierPath addLineToPoint: CGPointMake(111.5, 160.5)];
            [bezierPath addLineToPoint: CGPointMake(112.5, 171.5)];
            [bezierPath addLineToPoint: CGPointMake(110, 190)];
            [bezierPath addLineToPoint: CGPointMake(106.5, 207.5)];
            [bezierPath addLineToPoint: CGPointMake(107, 217)];
            [bezierPath addLineToPoint: CGPointMake(110, 225)];
            [bezierPath moveToPoint: CGPointMake(114.5, 225)];
            [bezierPath addLineToPoint: CGPointMake(115.5, 213.5)];
            [bezierPath moveToPoint: CGPointMake(116.5, 209.5)];
            [bezierPath addLineToPoint: CGPointMake(115.5, 197.5)];
            [bezierPath addLineToPoint: CGPointMake(114.5, 189.5)];
            [bezierPath addLineToPoint: CGPointMake(113.5, 182)];
            [bezierPath moveToPoint: CGPointMake(122, 176.5)];
            [bezierPath addLineToPoint: CGPointMake(124, 184.5)];
            [bezierPath addLineToPoint: CGPointMake(125.5, 195)];
            [bezierPath moveToPoint: CGPointMake(127, 185.5)];
            [bezierPath addLineToPoint: CGPointMake(127.5, 191.5)];
            [bezierPath addLineToPoint: CGPointMake(130, 200.5)];
            [bezierPath addLineToPoint: CGPointMake(132.5, 206.5)];
            [bezierPath moveToPoint: CGPointMake(131, 195)];
            [bezierPath addLineToPoint: CGPointMake(131.5, 199.5)];
            [bezierPath addLineToPoint: CGPointMake(135, 205.5)];
            [bezierPath moveToPoint: CGPointMake(144, 183)];
            [bezierPath addLineToPoint: CGPointMake(145, 190)];
            [bezierPath addLineToPoint: CGPointMake(146.5, 197)];
            [bezierPath addLineToPoint: CGPointMake(149, 202.5)];
            [bezierPath moveToPoint: CGPointMake(152.5, 204)];
            [bezierPath addLineToPoint: CGPointMake(149.5, 198)];
            [bezierPath addLineToPoint: CGPointMake(148, 193)];
            [bezierPath addLineToPoint: CGPointMake(147.5, 188)];
            [bezierPath moveToPoint: CGPointMake(145, 197)];
            [bezierPath addLineToPoint: CGPointMake(143, 191)];
            [bezierPath addLineToPoint: CGPointMake(142, 185)];
            [bezierPath addLineToPoint: CGPointMake(141.5, 177)];
            [bezierPath addLineToPoint: CGPointMake(142, 170)];
            [bezierPath moveToPoint: CGPointMake(85, 159.5)];
            [bezierPath addLineToPoint: CGPointMake(82.5, 167)];
            [bezierPath addLineToPoint: CGPointMake(81.5, 174)];
            [bezierPath addLineToPoint: CGPointMake(81.5, 182)];
            [bezierPath moveToPoint: CGPointMake(79.5, 176.5)];
            [bezierPath addLineToPoint: CGPointMake(80, 168.5)];
            [bezierPath addLineToPoint: CGPointMake(82.5, 159.5)];
            [bezierPath addLineToPoint: CGPointMake(86, 152)];
            [bezierPath moveToPoint: CGPointMake(88.5, 141)];
            [bezierPath addLineToPoint: CGPointMake(84.5, 147)];
            [bezierPath addLineToPoint: CGPointMake(81.5, 153)];
            [bezierPath moveToPoint: CGPointMake(44.5, 182)];
            [bezierPath addLineToPoint: CGPointMake(42.5, 190)];
            [bezierPath addLineToPoint: CGPointMake(39.5, 197.5)];
            [bezierPath addLineToPoint: CGPointMake(36.5, 203)];
            [bezierPath moveToPoint: CGPointMake(47.5, 182)];
            [bezierPath addLineToPoint: CGPointMake(45.5, 189.5)];
            [bezierPath addLineToPoint: CGPointMake(42, 198.5)];
            [bezierPath moveToPoint: CGPointMake(49, 174)];
            [bezierPath addLineToPoint: CGPointMake(48, 179.5)];
            [bezierPath moveToPoint: CGPointMake(62.5, 160.5)];
            [bezierPath addLineToPoint: CGPointMake(60, 170)];
            [bezierPath moveToPoint: CGPointMake(61.5, 173)];
            [bezierPath addLineToPoint: CGPointMake(60, 179.5)];
            [bezierPath addLineToPoint: CGPointMake(59.5, 187)];
            [bezierPath moveToPoint: CGPointMake(58.5, 175.5)];
            [bezierPath addLineToPoint: CGPointMake(57.5, 185)];
            [bezierPath moveToPoint: CGPointMake(68.5, 188)];
            [bezierPath addLineToPoint: CGPointMake(69, 194)];
            [bezierPath moveToPoint: CGPointMake(70.5, 195)];
            [bezierPath addLineToPoint: CGPointMake(70.5, 209.5)];
            [bezierPath moveToPoint: CGPointMake(86, 175.5)];
            [bezierPath addLineToPoint: CGPointMake(86.5, 186.5)];
            [bezierPath addLineToPoint: CGPointMake(87.5, 195)];
            [bezierPath moveToPoint: CGPointMake(197.5, 142)];
            [bezierPath addLineToPoint: CGPointMake(198, 146.5)];
            [bezierPath addLineToPoint: CGPointMake(200.5, 153)];
            [bezierPath addLineToPoint: CGPointMake(201.04, 155.5)];
            [bezierPath moveToPoint: CGPointMake(200.5, 167.5)];
            [bezierPath addLineToPoint: CGPointMake(202, 160)];
            [bezierPath addLineToPoint: CGPointMake(201.04, 155.5)];
            [bezierPath moveToPoint: CGPointMake(202, 141.5)];
            [bezierPath addLineToPoint: CGPointMake(201.5, 147.5)];
            [bezierPath addLineToPoint: CGPointMake(201.04, 155.5)];
            [bezierPath moveToPoint: CGPointMake(213.5, 134.5)];
            [bezierPath addLineToPoint: CGPointMake(211.5, 142)];
            [bezierPath addLineToPoint: CGPointMake(209.5, 149.5)];
            [bezierPath moveToPoint: CGPointMake(232, 145)];
            [bezierPath addLineToPoint: CGPointMake(233.5, 154.5)];
            [bezierPath addLineToPoint: CGPointMake(239.5, 167.5)];
            [bezierPath moveToPoint: CGPointMake(211.5, 189.5)];
            [bezierPath addLineToPoint: CGPointMake(216, 197)];
            [bezierPath addLineToPoint: CGPointMake(221, 202.5)];
            [bezierPath moveToPoint: CGPointMake(209.5, 203)];
            [bezierPath addLineToPoint: CGPointMake(204, 199.5)];
            [bezierPath moveToPoint: CGPointMake(259.5, 152)];
            [bezierPath addLineToPoint: CGPointMake(259.5, 155.5)];
            [bezierPath moveToPoint: CGPointMake(264, 154.5)];
            [bezierPath addLineToPoint: CGPointMake(264, 159.5)];
            [bezierPath addLineToPoint: CGPointMake(266.5, 163.5)];
            [bezierPath moveToPoint: CGPointMake(125.5, 137)];
            [bezierPath addLineToPoint: CGPointMake(127.5, 146.5)];
            [bezierPath addLineToPoint: CGPointMake(132.5, 149.5)];
            [bezierPath addLineToPoint: CGPointMake(135, 155.5)];
            [bezierPath moveToPoint: CGPointMake(225, 117.5)];
            [bezierPath addLineToPoint: CGPointMake(227, 121)];
            [bezierPath addLineToPoint: CGPointMake(227, 125)];
            [bezierPath moveToPoint: CGPointMake(221, 123.5)];
            [bezierPath addLineToPoint: CGPointMake(219.5, 133.5)];
            [bezierPath moveToPoint: CGPointMake(229.5, 197)];
            [bezierPath addLineToPoint: CGPointMake(232, 198.5)];
            [bezierPath addLineToPoint: CGPointMake(237, 200.5)];
            [bezierPath addLineToPoint: CGPointMake(245.5, 207.5)];
            [bezierPath moveToPoint: CGPointMake(165.5, 175.5)];
            [bezierPath addLineToPoint: CGPointMake(168, 182)];
            [bezierPath addLineToPoint: CGPointMake(174.5, 189.5)];
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
