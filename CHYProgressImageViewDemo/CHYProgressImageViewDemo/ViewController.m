//
//  ViewController.m
//  CHYProgressImageViewDemo
//
//  Created by Chen Chris on 8/25/12.
//  Copyright (c) 2012 ciderstudios.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _progressImageView.progress = _progressSlider.value;
    _progressImageView.verticalProgress = _verticalProgressSwitch.on;
    _progressImageView.hasGrayscaleBackground = _grayscaleBackgroundSwitch.on;
}

- (void)viewDidUnload
{
    _progressImageView = nil;
    _progressSlider = nil;
    _verticalProgressSwitch = nil;
    _grayscaleBackgroundSwitch = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)progressValueChanged:(id)sender {
    _progressImageView.progress = _progressSlider.value;
}

- (IBAction)verticalProgressToggled:(id)sender {
    _progressImageView.verticalProgress = _verticalProgressSwitch.on;
}

- (IBAction)grayscaleBackgroundToggled:(id)sender {
    _progressImageView.hasGrayscaleBackground = _grayscaleBackgroundSwitch.on;
}
@end
