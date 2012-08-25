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
- (void)updateMasking;  // use layer masking to display only portion of image
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
    [self updateMasking];
}

- (void)setHasGrayscaleBackground:(BOOL)hasGrayscaleBackground
{
    _hasGrayscaleBackground = hasGrayscaleBackground;
}

- (void)setVerticalProgress:(BOOL)verticalProgress
{
    _verticalProgress = verticalProgress;
    [self updateMasking];
}

#pragma mark - drawing
- (void)updateMasking
{
    // Create a mask layer and the frame to determine what will be visible in the view.
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGRect maskRect;
    if (_verticalProgress) {
        maskRect = CGRectMake(0, self.bounds.size.height * (1.f - _progress), self.bounds.size.width, self.bounds.size.height * _progress);
    }else {
        maskRect = CGRectMake(0, 0, self.bounds.size.width * _progress, self.bounds.size.height);
    }
    
    // Create a path and add the rectangle in it.
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, maskRect);
    
    // Set the path to the mask layer.
    [maskLayer setPath:path];
    
    // Release the path since it's not covered by ARC.
    CGPathRelease(path);
    
    // Set the mask of the view.
    self.layer.mask = maskLayer;
}

@end
