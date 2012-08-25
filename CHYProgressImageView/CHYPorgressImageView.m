//
//  CHYPorgressImageView.m
//  CHYProgressImageViewDemo
//
//  Created by Chen Chris on 8/25/12.
//  Copyright (c) 2012 ciderstudios.com. All rights reserved.
//

#import "CHYPorgressImageView.h"

@interface CHYPorgressImageView ()
- (void)commonInit;
@end

@implementation CHYPorgressImageView
@synthesize progress = _progress;
@synthesize hasGrayscaleBackground = _hasGrayscaleBackground;
@synthesize verticalProgress = _verticalProgress;

#pragma mark - UIView lifecycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;    
}

- (void)commonInit
{
    _progress = 0.f;
    _hasGrayscaleBackground = YES;
    _verticalProgress = YES;
}

#pragma mark - Custom Accessor
- (void)setProgress:(float)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)setHasGrayscaleBackground:(BOOL)hasGrayscaleBackground
{
    _hasGrayscaleBackground = hasGrayscaleBackground;
    [self setNeedsDisplay];
}

- (void)setVerticalProgress:(BOOL)verticalProgress
{
    _verticalProgress = verticalProgress;
    [self setNeedsDisplay];
}

#pragma mark - drawing
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
