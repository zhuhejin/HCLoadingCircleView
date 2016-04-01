//
//  LoadingCircleView.h
//  LoadingNavigationBar
//
//  Created by 朱何进 on 16/3/4.
//  Copyright © 2016年 hejin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCLoadingCircleView : UIView

@property (nonatomic, readonly) BOOL isAnimating;

- (void)startAnimation;

- (void)stopAnimation;

@end
