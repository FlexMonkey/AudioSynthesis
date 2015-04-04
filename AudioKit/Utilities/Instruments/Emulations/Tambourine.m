//
//  Tambourine.m
//  AudioKit
//
//  Created by Aurelius Prochazka on 2/15/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "Tambourine.h"

@implementation Tambourine

- (instancetype)init
{
    self = [super init];
    if (self) {
        _amplitude = [self createPropertyWithValue:0.5 minimum:0.0 maximum:1.0];
        
        TambourineNote *note = [[TambourineNote alloc] init];
        AKTambourine *tambourine = [AKTambourine tambourine];
        tambourine.dampingFactor = note.dampingFactor;
        tambourine.mainResonantFrequency = note.mainResonantFrequency;
        tambourine.firstResonantFrequency = note.firstResonantFrequency;
        tambourine.secondResonantFrequency = note.secondResonantFrequency;
        [self setAudioOutput:[tambourine scaledBy:_amplitude]];
    }
    return self;
}
@end

// -----------------------------------------------------------------------------
#  pragma mark - Tambourine Note
// -----------------------------------------------------------------------------

@implementation TambourineNote

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dampingFactor = [self createPropertyWithValue:0.1 minimum:0 maximum:1];
        _dampingFactor.isContinuous = NO;
        _mainResonantFrequency = [self createPropertyWithValue:2300 minimum:0 maximum:10000];
        _mainResonantFrequency.isContinuous = NO;
        _firstResonantFrequency = [self createPropertyWithValue:5600 minimum:0 maximum:10000];
        _firstResonantFrequency.isContinuous = NO;
        _secondResonantFrequency = [self createPropertyWithValue:8100 minimum:0 maximum:10000];
        _secondResonantFrequency.isContinuous = NO;
        self.duration.value = 1.0;
    }
    return self;
}

@end
