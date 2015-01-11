//
//  AKMultitapDelay.h
//  AudioKit
//
//  Auto-generated on 12/27/14.
//  Customized by Aurelius Prochazka on 12/27/14.
//
//  Copyright (c) 2014 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Multitap delay line implementation.

 
 */

@interface AKMultitapDelay : AKAudio
/// Instantiates the multitap delay
/// @param input Input signal to be delayed. [Default Value: ]
/// @param firstEchoTime Time in seconds to delay the firsted delayed playback. [Default Value: ]
/// @param firstEchoGain The relative amplitude of the first echo. [Default Value: ]
- (instancetype)initWithInput:(AKParameter *)input
                firstEchoTime:(AKConstant *)firstEchoTime
                firstEchoGain:(AKConstant *)firstEchoGain;

/// Instantiates the multitap delay
/// @param input Input signal to be delayed.
/// @param firstEchoTime Time in seconds to delay the firsted delayed playback.
/// @param firstEchoGain The relative amplitude of the first echo.
+ (instancetype)delayWithInput:(AKParameter *)input
                 firstEchoTime:(AKConstant *)firstEchoTime
                 firstEchoGain:(AKConstant *)firstEchoGain;

/// Adds an echo or tap to the multi-tap delay line
/// @param time Time in seconds to delay the firsted delayed playback.
/// @param gain The relative amplitude of the first echo.
- (void)addEchoAtTime:(AKConstant *)time gain:(AKConstant *)gain;

@end
