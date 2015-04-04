//
//  Marimba.m
//  AudioKit
//
//  Created by Nicholas Arner on 3/20/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "Marimba.h"

@implementation Marimba

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Note Properties
        MarimbaNote *note = [[MarimbaNote alloc] init];

        // Instrument Properties
        _amplitude = [self createPropertyWithValue:1.0 minimum:0.0 maximum:1.0];
        _vibratoFrequency = [self createPropertyWithValue:0.0 minimum:0.0 maximum:12.0];
        _vibratoAmplitude = [self createPropertyWithValue:0.0 minimum:0.0 maximum:1.0];
        
        // Instrument Definition
        AKMarimba *marimba = [AKMarimba marimba];
        marimba.frequency = note.frequency;
        marimba.amplitude = note.amplitude;
        marimba.stickHardness = note.stickHardness;
        marimba.strikePosition = note.strikePosition;
        marimba.vibratoFrequency = _vibratoFrequency;
        marimba.vibratoAmplitude = _vibratoAmplitude;
    
        [self setAudioOutput:[marimba scaledBy:_amplitude]];

        // Output to global effects processing (choose mono or stereo accordingly)
        _auxilliaryOutput = [AKAudio globalParameter];
        //_auxilliaryOutput = [AKStereoAudio globalParameter];
        [self assignOutput:_auxilliaryOutput to:marimba];
    }
    return self;
}
@end

// -----------------------------------------------------------------------------
#  pragma mark - Marimba Note
// -----------------------------------------------------------------------------


@implementation MarimbaNote

- (instancetype)init
{
    self = [super init];
    if (self) {
        _frequency = [self createPropertyWithValue:440 minimum:100 maximum:1000];
        _frequency.isContinuous = NO;
        _amplitude = [self createPropertyWithValue:0.5 minimum:0 maximum:1];
        _amplitude.isContinuous = NO;
        _stickHardness = [self createPropertyWithValue:0.5 minimum:0 maximum:1];
        _stickHardness.isContinuous = NO;
        _strikePosition = [self createPropertyWithValue:0.2 minimum:0 maximum:1];
        _strikePosition.isContinuous = NO;
        
        // Optionally set a default note duration
        self.duration.value = 1.0;
    }
    return self;
}



@end
