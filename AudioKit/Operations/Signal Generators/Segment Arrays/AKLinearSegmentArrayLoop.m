//
//  AKLinearSegmentArrayLoop.m
//  AudioKit
//
//  Created by Aurelius Prochazka on 1/14/15
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//
//  Implementation of Csound's loopseg:
//  http://www.csounds.com/manual/html/loopseg.html
//

#import "AKLinearSegmentArrayLoop.h"

@implementation AKLinearSegmentArrayLoop
{
    AKParameter *loopFrequency;
    NSMutableArray *segments;
}

- (instancetype)initWithFrequency:(AKParameter *)frequency
                     initialValue:(AKParameter *)initialValue;
{
    self = [super initWithString:[self operationName]];
    if (self) {
        loopFrequency = frequency;
        segments = [[NSMutableArray alloc] init];
        [segments addObject:initialValue];
    }
    return self;
}

- (void)addValue:(AKParameter *)value
   afterDuration:(AKParameter *)duration
{
    [segments addObject:duration];
    [segments addObject:value];
}

- (NSString *)stringForCSD {
    return [NSString stringWithFormat:
            @"%@ loopseg %@, 0, 0, %@",
            self,
            loopFrequency,
            [segments componentsJoinedByString:@", "]];
}

@end