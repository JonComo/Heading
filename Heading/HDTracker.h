//
//  HDTracker.h
//  Heading
//
//  Created by Jon Como on 6/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^UpdateBlock)(void);

@interface HDTracker : NSObject

@property (nonatomic, strong) NSMutableArray *locations;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLLocation *initialLocation;

-(void)startTrackingWithUpdates:(UpdateBlock)block;
-(void)endTracking;

-(void)reset;

@end