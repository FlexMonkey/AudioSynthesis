//
//  AKVariableDelay.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** An interpolating variable time delay.

 
 */

@interface AKVariableDelay : AKAudio
/// Instantiates the variable delay with all values
/// @param input Input signal. [Default Value: ]
/// @param delayTime Current value of delay in seconds. Note that linear functions have no pitch change effects. Fast changing values will cause discontinuities in the waveform resulting noise. [Default Value: 0]
/// @param maximumDelayTime Maximum value of delay in seconds. [Default Value: 5]
- (instancetype)initWithInput:(AKParameter *)input
                    delayTime:(AKParameter *)delayTime
             maximumDelayTime:(AKConstant *)maximumDelayTime;

/// Instantiates the variable delay with default values
/// @param input Input signal.
- (instancetype)initWithInput:(AKParameter *)input;

/// Instantiates the variable delay with default values
/// @param input Input signal.
+ (instancetype)delayWithInput:(AKParameter *)input;

/// Current value of delay in seconds. Note that linear functions have no pitch change effects. Fast changing values will cause discontinuities in the waveform resulting noise. [Default Value: 0]
@property AKParameter *delayTime;

/// Set an optional delay time
/// @param delayTime Current value of delay in seconds. Note that linear functions have no pitch change effects. Fast changing values will cause discontinuities in the waveform resulting noise. [Default Value: 0]
- (void)setOptionalDelayTime:(AKParameter *)delayTime;

/// Maximum value of delay in seconds. [Default Value: 5]
@property AKConstant *maximumDelayTime;

/// Set an optional maximum delay time
/// @param maximumDelayTime Maximum value of delay in seconds. [Default Value: 5]
- (void)setOptionalMaximumDelayTime:(AKConstant *)maximumDelayTime;



@end
