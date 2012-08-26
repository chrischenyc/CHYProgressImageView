//
//  CHYPorgressImageView.m
//  Version 0.1
//  CHYProgressImageViewDemo
//
//  Created by Chen Chris on 8/25/12.
//  Copyright (c) 2012 ciderstudios.com. All rights reserved.
//

#import "CHYPorgressImageView.h"

@interface UIImage (Grayscale)
/**
 *	@brief	Create a partially displayed image
 *
 *	@param 	percentage 	This defines the part to be displayed as original
 *	@param 	vertical 	If YES, the image is displayed bottom to top; otherwise left to right
 *	@param 	grayscaleRest 	If YES, the non-displaye part are in grayscale; otherwise in transparent
 *
 *	@return	A generated UIImage instance
 */
- (UIImage *) partialImageWithPercentage:(float)percentage vertical:(BOOL)vertical grayscaleRest:(BOOL)grayscaleRest;
@end

@implementation UIImage (Grayscale)
// Reference: http://stackoverflow.com/questions/1298867/convert-image-to-grayscale
- (UIImage *) partialImageWithPercentage:(float)percentage vertical:(BOOL)vertical grayscaleRest:(BOOL)grayscaleRest {
    const int ALPHA = 0;
    const int RED = 1;
    const int GREEN = 2;
    const int BLUE = 3;
    
    // Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, self.size.width * self.scale, self.size.height * self.scale);
    
    int width = imageRect.size.width;
    int height = imageRect.size.height;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace, 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [self CGImage]);
    
    int x_origin = vertical ? 0 : width * percentage;
    int y_to = vertical ? height * (1.f -percentage) : height;
    
    for(int y = 0; y < y_to; y++) {
        for(int x = x_origin; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            if (grayscaleRest) {
                // convert to grayscale using recommended method: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
                uint32_t gray = 0.3 * rgbaPixel[RED] + 0.59 * rgbaPixel[GREEN] + 0.11 * rgbaPixel[BLUE];
                
                // set the pixels to gray
                rgbaPixel[RED] = gray;
                rgbaPixel[GREEN] = gray;
                rgbaPixel[BLUE] = gray;
            }
            else {
                rgbaPixel[ALPHA] = 0;
                rgbaPixel[RED] = 0;
                rgbaPixel[GREEN] = 0;
                rgbaPixel[BLUE] = 0;
            }
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:image
                                                 scale:self.scale 
                                           orientation:UIImageOrientationUp];
    
    // we're done with image now too
    CGImageRelease(image);
    
    return resultUIImage;
}

@end

#pragma mark -
@interface CHYPorgressImageView ()
- (void)commonInit;
- (void)updateDrawing;  // re-draw image with given parameters
@end

@implementation CHYPorgressImageView
@synthesize progress = _progress;
@synthesize hasGrayscaleBackground = _hasGrayscaleBackground;
@synthesize verticalProgress = _verticalProgress;

#pragma mark - UIView lifecycle
- (void)dealloc
{
    _originalImage = nil;
}

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
    
    _originalImage = self.image;
}

#pragma mark - Custom Accessor
- (void)setImage:(UIImage *)image
{
    [super setImage:image];
    
    if (!_internalUpdating) {
        _originalImage = image;
        [self updateDrawing];
    }
    
    _internalUpdating = NO;
}

- (void)setProgress:(float)progress
{
    _progress = MIN(MAX(0.f, progress), 1.f);
    [self updateDrawing];
}

- (void)setHasGrayscaleBackground:(BOOL)hasGrayscaleBackground
{
    _hasGrayscaleBackground = hasGrayscaleBackground;
    [self updateDrawing];
}

- (void)setVerticalProgress:(BOOL)verticalProgress
{
    _verticalProgress = verticalProgress;
    [self updateDrawing];
}

#pragma mark - drawing
- (void)updateDrawing
{
    _internalUpdating = YES;
    self.image = [_originalImage partialImageWithPercentage:_progress vertical:_verticalProgress grayscaleRest:_hasGrayscaleBackground];
}

@end
