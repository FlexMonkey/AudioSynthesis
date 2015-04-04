//
//  Sleighbells.m
//  AudioKitPlayground
//
//  Created by Nicholas Arner on 3/21/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "Sleighbells.h"

@implementation Sleighbells

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Note Properties
        SleighbellsNote *note = [[SleighbellsNote alloc] init];

        // Instrument Properties
        _amplitude = [self createPropertyWithValue:1.0 minimum:0.0 maximum:1.0];

        // Instrument Definition
        AKSleighbells *sleighBells = [AKSleighbells sleighbells];
        sleighBells.intensity = note.intensity;
        sleighBells.amplitude = note.amplitude;
        sleighBells.dampingFactor = note.dampingFactor;
        sleighBells.mainResonantFrequency = note.mainResonantFrequency;
        sleighBells.firstResonantFrequency = note.firstResonantFrequency;
        sleighBells.secondResonantFrequency = note.secondResonantFrequency;
        

        [self setAudioOutput:[sleighBells scaledBy:_amplitude]];

        // Output to global effects processing (choose mono or stereo accordingly)
        _auxilliaryOutput = [AKAudio globalParameter];
        [self assignOutput:_auxilliaryOutput to:sleighBells];
    }
    return self;
}
@end

// -----------------------------------------------------------------------------
#  pragma mark - Sleighbells Note
// -----------------------------------------------------------------------------


@implementation SleighbellsNote

- (instancetype)init
{
    self = [super init];
    if (self) {
        _intensity = [self createPropertyWithValue:32 minimum:10 maximum:60];
        _intensity.isContinuous = NO;
        _dampingFactor = [self createPropertyWithValue:0.2 minimum:0 maximum:1];
        _dampingFactor.isContinuous = NO;
        _mainResonantFrequency = [self createPropertyWithValue:2500 minimum:0 maximum:5000];
        _mainResonantFrequency.isContinuous = NO;
        _firstResonantFrequency = [self createPropertyWithValue:5300 minimum:0 maximum:10000];
        _firstResonantFrequency.isContinuous = NO;
        _secondResonantFrequency = [self createPropertyWithValue:6500 minimum:0 maximum:10000];
        _secondResonantFrequency.isContinuous = NO;
        _amplitude = [self createPropertyWithValue:1 minimum:0 maximum:1];
        _amplitude.isContinuous = NO;


        // Optionally set a default note duration
        self.duration.value = 1.0;
    }
    return self;
}



@end
