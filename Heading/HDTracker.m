//
//  HDTracker.m
//  Heading
//
//  Created by Jon Como on 6/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "HDTracker.h"

@interface HDTracker () <CLLocationManagerDelegate>

@end

@implementation HDTracker
{
    CLLocationManager *manager;
    UpdateBlock updateBlock;
}

-(id)init
{
    if (self = [super init]) {
        //init
        
        manager = [[CLLocationManager alloc] init];
        [manager setActivityType:CLActivityTypeFitness];
        manager.delegate = self;
        
        _locations = [NSMutableArray array];
    }
    
    return self;
}

-(void)startTrackingWithUpdates:(void (^)(void))block
{
    updateBlock = block;
    [manager startUpdatingLocation];
}

-(void)endTracking
{
    [manager stopUpdatingLocation];
}

-(void)reset
{
    [self.locations removeAllObjects];
    self.initialLocation = nil;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations[0];
    
    if (!self.initialLocation)
        self.initialLocation = [location copy];
    
    if (location){
        
        self.currentLocation = location;
        
        [self.locations addObject:location];
        
        if (self.locations.count > 2000)
            [self.locations removeObjectAtIndex:0];
    }
    
    if (updateBlock) updateBlock();
}

@end
