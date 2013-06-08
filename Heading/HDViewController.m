//
//  HDViewController.m
//  Heading
//
//  Created by Jon Como on 6/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "HDViewController.h"
#import "HDTracker.h"
#import "HDTrackerView.h"

@interface HDViewController ()
{
    HDTracker *tracker;
    __weak IBOutlet HDTrackerView *trackerView;
    __weak IBOutlet UILabel *labelLocation;
}

@end

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    tracker = [[HDTracker alloc] init];
    
    trackerView.tracker = tracker;
    
    [tracker startTrackingWithUpdates:^{
        labelLocation.text = [NSString stringWithFormat:@"x: %f y:%f", tracker.currentLocation.coordinate.latitude, tracker.currentLocation.coordinate.longitude];
        [trackerView setNeedsDisplay];
    }];
    
    [trackerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:tracker action:@selector(reset)]];
}

- (IBAction)slider:(UISlider *)sender
{
    trackerView.scale = sender.value;
    
    [trackerView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
