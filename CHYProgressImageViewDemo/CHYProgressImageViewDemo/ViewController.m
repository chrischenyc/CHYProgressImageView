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
}

- (void)viewDidUnload
{
    _progressImageView = nil;
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
    UISlider *progressSlider = sender;
    _progressImageView.progress = progressSlider.value;
}

- (IBAction)verticalProgressToggled:(id)sender {
    UISwitch *vertialProgressSwitch = sender;
    _progressImageView.verticalProgress = vertialProgressSwitch.on;
}

- (IBAction)grayscaleBackgroundToggled:(id)sender {
    UISwitch *grayscaleBgSwitch = sender;
    _progressImageView.hasGrayscaleBackground = grayscaleBgSwitch.on;
}
@end
