//
//  HDTrackerView.h
//  Heading
//
//  Created by Jon Como on 6/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HDTracker;

@interface HDTrackerView : UIView

@property (nonatomic, weak) HDTracker *tracker;
@property float scale;

@end
