//
//  ViewController.h
//  rfduinoBlink
//
//  Created by Ryan Rusnak on 3/18/14.
//  Copyright (c) 2014 Ryan Rusnak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UNIRest.h"
#import "RFduinoDelegate.h"
#import "RFduino.h"

@interface AppViewController : UIViewController<RFduinoDelegate>{
    int toggle;
}

@property(nonatomic, strong) RFduino *rfduino;

- (IBAction)touchedBlink:(id)sender;
@end
