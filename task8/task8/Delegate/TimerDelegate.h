//
//  TimerDelegate.h
//  task8
//
//  Created by Маргарита Жучик on 19.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TimerDelegate <NSObject>
- (void) saveTimerButtonTapped: (float) timerValue;
@end

NS_ASSUME_NONNULL_END
