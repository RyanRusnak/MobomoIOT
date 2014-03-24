//
//  ViewController.m
//  rfduinoBlink
//
//  Created by Ryan Rusnak on 3/18/14.
//  Copyright (c) 2014 Ryan Rusnak. All rights reserved.
//

#import "AppViewController.h"

@interface AppViewController ()

@end

@implementation AppViewController

@synthesize rfduino;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    rfduino.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchedBlink:(id)sender {
    if (toggle == 0){
        toggle = 255;
    }else{
        toggle = 0;
    }
    uint8_t tx[3] = {toggle};
    NSData *data = [NSData dataWithBytes:(void*)&tx length:3];
    
    [rfduino send:data];
}
@end
