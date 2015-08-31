//
//  ViewController.h
//  Animated Label
//  Author : Sai Uday Bhaskar Mudivarty
//  Created by macmini on 8/31/15.
//  Copyright (c) 2015 macmini. All rights reserved.
//


// Ring Screen for a video call with animated text
#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"


@interface ViewController : UIViewController<AVAudioPlayerDelegate>
{
    
}
@property (strong, nonatomic) IBOutlet UILabel *myLabel;
@property (nonatomic, retain) AVAudioPlayer *player;


@end

