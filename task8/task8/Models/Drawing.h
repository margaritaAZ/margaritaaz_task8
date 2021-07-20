//
//  Drawing.h
//  task8
//
//  Created by Маргарита Жучик on 20.07.21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, Line) {
    Line1,
    Line2,
    Line3
};

typedef NS_ENUM(NSInteger, DrawingType) {
    DrawingTypePlanet,
    DrawingTypeHead,
    DrawingTypeTree,
    DrawingTypeLandscape
};

@interface Drawing : NSObject

@property (nonatomic, assign) DrawingType type;
@property (nonatomic, strong) NSArray<UIColor *>* colors;
@property (assign, nonatomic) float timer;

- (UIBezierPath *)getTemplate: (Line) line;

@end

NS_ASSUME_NONNULL_END
