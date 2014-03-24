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
    
    NSDictionary* headers = @{@"accept": @"application/json"};
    NSDictionary* parameters = @{@"q": @"23javascript"};
    
    [[UNIRest post:^(UNISimpleRequest* request) {
        [request setUrl:@"https://api.twitter.com/1.1/search/tweets.json"];
        [request setHeaders:headers];
        [request setParameters:parameters];
    }] asJsonAsync:^(UNIHTTPJsonResponse* response, NSError *error) {
        // This is the asyncronous callback block
        NSInteger* code = [response code];
        NSDictionary* responseHeaders = [response headers];
        UNIJsonNode* body = [response body];
        NSData* rawBody = [response rawBody];
    }];
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
