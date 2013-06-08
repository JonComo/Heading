//
//  HDTrackerView.m
//  Heading
//
//  Created by Jon Como on 6/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "HDTrackerView.h"
#import "HDTracker.h"

@implementation HDTrackerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        //init
        [self setup];
    }
    
    return self;
}

-(void)setup
{
    self.scale = 1;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    double long initLat = self.tracker.initialLocation.coordinate.latitude;
    double long initLong = self.tracker.initialLocation.coordinate.longitude;
    
    double long latDiff;
    double long longDiff;
    
    CGRect bounds = self.frame;
    
    CGContextSetStrokeColorWithColor(ref, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ref, 1);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(bounds.size.width/2, bounds.size.height/2)];
    
    for (CLLocation *location in self.tracker.locations)
    {
        latDiff = (initLat - location.coordinate.latitude) * 500000 * self.scale;
        longDiff = (initLong - location.coordinate.longitude) * 500000 * self.scale;
        
        CGPoint newPoint = CGPointMake(bounds.size.width/2 + latDiff, bounds.size.height/2 + longDiff); 
        
        [path addLineToPoint:newPoint];
    }
    
    [path moveToPoint:CGPointZero];
    
    [path stroke];
}


@end
