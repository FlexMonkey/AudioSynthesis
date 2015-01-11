//
//  AKFlatFrequencyResponseReverb.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Reverberates an input signal with a flat frequency response.

 This filter reiterates the input with an echo density determined by loop time. The attenuation rate is independent and is determined by the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude).  Output will begin to appear immediately.
 */

@interface AKFlatFrequencyResponseReverb : AKAudio
/// Instantiates the flat frequency response reverb with all values
/// @param input The input signal to be reverberated. [Default Value: ]
/// @param reverbDuration The duration in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude. Updated at Control-rate. [Default Value: 0.5]
/// @param loopDuration The loop duration in seconds, which determines the “echo density” of the reverberation. [Default Value: 0.1]
- (instancetype)initWithInput:(AKParameter *)input
               reverbDuration:(AKParameter *)reverbDuration
                 loopDuration:(AKConstant *)loopDuration;

/// Instantiates the flat frequency response reverb with default values
/// @param input The input signal to be reverberated.
- (instancetype)initWithInput:(AKParameter *)input;

/// Instantiates the flat frequency response reverb with default values
/// @param input The input signal to be reverberated.
+ (instancetype)reverbWithInput:(AKParameter *)input;

/// The duration in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude. [Default Value: 0.5]
@property AKParameter *reverbDuration;

/// Set an optional reverb duration
/// @param reverbDuration The duration in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude. Updated at Control-rate. [Default Value: 0.5]
- (void)setOptionalReverbDuration:(AKParameter *)reverbDuration;

/// The loop duration in seconds, which determines the “echo density” of the reverberation. [Default Value: 0.1]
@property AKConstant *loopDuration;

/// Set an optional loop duration
/// @param loopDuration The loop duration in seconds, which determines the “echo density” of the reverberation. [Default Value: 0.1]
- (void)setOptionalLoopDuration:(AKConstant *)loopDuration;



@end
