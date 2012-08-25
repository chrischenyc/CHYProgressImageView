//
//  ViewController.h
//  CHYProgressImageViewDemo
//
//  Created by Chen Chris on 8/25/12.
//  Copyright (c) 2012 ciderstudios.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHYPorgressImageView.h"

@interface ViewController : UIViewController {
    __weak IBOutlet CHYPorgressImageView *_progressImageView;
    __weak IBOutlet UISlider *_progressSlider;
    __weak IBOutlet UISwitch *_verticalProgressSwitch;
    __weak IBOutlet UISwitch *_grayscaleBackgroundSwitch;
}

- (IBAction)progressValueChanged:(id)sender;
- (IBAction)verticalProgressToggled:(id)sender;
- (IBAction)grayscaleBackgroundToggled:(id)sender;
@end
