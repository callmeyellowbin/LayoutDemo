//
//  UIView+Extension.h
//  Fade-iOS
//
//  Created by 黄洪彬 on 2018/7/20.
//  Copyright © 2018年 Fade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic,assign) CGFloat x;

@property (nonatomic,assign) CGFloat y;

@property (nonatomic,assign) CGFloat centerX;

@property (nonatomic,assign) CGFloat centerY;

@property (nonatomic,assign) CGFloat width;

@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign) CGFloat bottom;

@property (nonatomic,assign) CGFloat right;

@property (nonatomic,assign) CGSize size;

@property (nonatomic,assign) CGPoint origin;

@end

@interface UIView (FindFirstResponder)

- (UIView *)findFirstResponder;

@end
