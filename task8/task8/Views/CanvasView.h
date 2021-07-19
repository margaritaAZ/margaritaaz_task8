//
//  CanvasView.h
//  task8
//
//  Created by Маргарита Жучик on 16.07.21.
//

#import <UIKit/UIKit.h>
#import "CanvasViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView
@property(weak, nonatomic) id<CanvasViewDelegate> delegate;
- (void)startDrowings: (NSArray<UIColor *>*) colors timer: (float) time;
- (void) clearView;
- (UIImage *) saveAsImage;
@end

NS_ASSUME_NONNULL_END
