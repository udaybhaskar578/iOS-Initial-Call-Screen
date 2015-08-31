//
//  ViewController.m
//  Animated Label
//  Author : Sai Uday Bhaskar Mudivarty
//  Created by macmini on 8/31/15.
//  Copyright (c) 2015 macmini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self playAudio];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0),
                   ^{
                       while(true)
                       {
                       [self animateLabelShowText:@"...." characterDelay:0.15];
                       }
                       // when your condition matches stop ringing
                       //[_player stop];
                   });
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) playAudio
{
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/Ring.mp4"];
    NSLog(@"Path to play: %@", resourcePath);
    NSError* err;
    
    //Initialize our player pointing to the path to our resource
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:
               [NSURL fileURLWithPath:resourcePath] error:&err];
    
    if( err ){
        
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    else{
        //set our delegate and begin playback
        _player.delegate = self;
        [_player play];
        _player.numberOfLoops = -1;
        _player.currentTime = 0;
        _player.volume = 1.0;
    }
}

- (void)animateLabelShowText:(NSString*)newText characterDelay:(NSTimeInterval)delay
{
    [self.myLabel setText:@""];
    
    for (int i=0; i<newText.length; i++)
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [self.myLabel setText:[NSString stringWithFormat:@"%@%C", self.myLabel.text, [newText characterAtIndex:i]]];
                       });
        
        [NSThread sleepForTimeInterval:delay];
    }
    [self.myLabel setText:@""];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
