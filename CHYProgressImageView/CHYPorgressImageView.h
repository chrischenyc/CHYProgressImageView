//
//  CHYPorgressImageView.h
//  Version 0.1
//  CHYProgressImageViewDemo
//
//  Created by Chen Chris on 8/25/12.
//  Copyright (c) 2012 ciderstudios.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHYPorgressImageView : UIImageView {
    UIImage *_originalImage;
    BOOL _internalUpdating;
}

@property (nonatomic) float progress;                                       // default 0.0. The image will be partially displayed in proportion to this value.
@property (nonatomic) BOOL hasGrayscaleBackground;                          // default YES. If set, a duplicated image will be displayed in grayscale in the background, providing viwer an indication of how far the progress has gone.
@property (nonatomic, getter = isVerticalProgress) BOOL verticalProgress;   // default YES. If set, the portion display of image will start from the bottom to the top; otherwise, left to right.
@end
