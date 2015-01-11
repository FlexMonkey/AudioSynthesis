//
//  AKSleighbells.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Semi-physical model of a sleighbell sound.

 This is one of the PhISEM percussion opcodes. PhISEM (Physically Informed Stochastic Event Modeling) is an algorithmic approach for simulating collisions of multiple independent sound producing objects.
 */

@interface AKSleighbells : AKAudio
/// Instantiates the sleighbells with all values
/// @param intensity The intensity of the bell sound. [Default Value: 32]
/// @param dampingFactor Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.2]
/// @param mainResonantFrequency The main resonant frequency. [Default Value: 2500]
/// @param firstResonantFrequency The first resonant frequency. [Default Value: 5300]
/// @param secondResonantFrequency The second resonant frequency. [Default Value: 6500]
/// @param amplitude Amplitude of output. Since these instruments are stochastic this is only an approximation. [Default Value: 1]
- (instancetype)initWithIntensity:(AKConstant *)intensity
                    dampingFactor:(AKConstant *)dampingFactor
            mainResonantFrequency:(AKConstant *)mainResonantFrequency
           firstResonantFrequency:(AKConstant *)firstResonantFrequency
          secondResonantFrequency:(AKConstant *)secondResonantFrequency
                        amplitude:(AKConstant *)amplitude;

/// Instantiates the sleighbells with default values
- (instancetype)init;

/// Instantiates the sleighbells with default values
+ (instancetype)sleighbells;


/// The intensity of the bell sound. [Default Value: 32]
@property AKConstant *intensity;

/// Set an optional intensity
/// @param intensity The intensity of the bell sound. [Default Value: 32]
- (void)setOptionalIntensity:(AKConstant *)intensity;

/// Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.2]
@property AKConstant *dampingFactor;

/// Set an optional damping factor
/// @param dampingFactor Damping factor where 0 is no damping and 1 is fully damped. [Default Value: 0.2]
- (void)setOptionalDampingFactor:(AKConstant *)dampingFactor;

/// The main resonant frequency. [Default Value: 2500]
@property AKConstant *mainResonantFrequency;

/// Set an optional main resonant frequency
/// @param mainResonantFrequency The main resonant frequency. [Default Value: 2500]
- (void)setOptionalMainResonantFrequency:(AKConstant *)mainResonantFrequency;

/// The first resonant frequency. [Default Value: 5300]
@property AKConstant *firstResonantFrequency;

/// Set an optional first resonant frequency
/// @param firstResonantFrequency The first resonant frequency. [Default Value: 5300]
- (void)setOptionalFirstResonantFrequency:(AKConstant *)firstResonantFrequency;

/// The second resonant frequency. [Default Value: 6500]
@property AKConstant *secondResonantFrequency;

/// Set an optional second resonant frequency
/// @param secondResonantFrequency The second resonant frequency. [Default Value: 6500]
- (void)setOptionalSecondResonantFrequency:(AKConstant *)secondResonantFrequency;

/// Amplitude of output. Since these instruments are stochastic this is only an approximation. [Default Value: 1]
@property AKConstant *amplitude;

/// Set an optional amplitude
/// @param amplitude Amplitude of output. Since these instruments are stochastic this is only an approximation. [Default Value: 1]
- (void)setOptionalAmplitude:(AKConstant *)amplitude;



@end
