//
//  AKFlute.h
//  AudioKit
//
//  Auto-generated on 3/2/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** A physical model of a flute

 Audio output is a tone similar to a flute, using a physical model developed from Perry Cook
 */

@interface AKFlute : AKAudio
/// Instantiates the flute with all values
/// @param frequency Frequency of the note. Updated at Control-rate. [Default Value: 440]
/// @param attackTime Time in seconds to reach full blowing pressure. [Default Value: 0.1]
/// @param releaseTime Time in seconds taken to stop blowing. [Default Value: 0.1]
/// @param airJetPressure a parameter controlling the air jet. Values should be positive, and the useful range is approximately 0.08 to 0.56. Updated at Control-rate. [Default Value: 0.2]
/// @param jetrf Amount of reflection in the breath jet that powers the flute. [Default Value: 0.5]
/// @param endrf Reflection coefficient of the breath jet. [Default Value: 0.5]
/// @param noiseAmplitude Amplitude of the noise component, about 0 to 0.5 Updated at Control-rate. [Default Value: 0.15]
/// @param amplitude Amplitude of the note, up to but not including 1. Updated at Control-rate. [Default Value: 0.5]
/// @param vibratoShape Table defining the shape of the vibrato. [Default Value: sine]
/// @param vibratoAmplitude Amplitude of the vibrato. Updated at Control-rate. [Default Value: 0]
/// @param vibratoFrequency Frequency of vibrato in Hertz. Suggested range is 0 to 12 Updated at Control-rate. [Default Value: 0]
- (instancetype)initWithFrequency:(AKParameter *)frequency
                       attackTime:(AKConstant *)attackTime
                      releaseTime:(AKConstant *)releaseTime
                   airJetPressure:(AKParameter *)airJetPressure
                            jetrf:(AKConstant *)jetrf
                            endrf:(AKConstant *)endrf
                   noiseAmplitude:(AKParameter *)noiseAmplitude
                        amplitude:(AKParameter *)amplitude
                     vibratoShape:(AKTable *)vibratoShape
                 vibratoAmplitude:(AKParameter *)vibratoAmplitude
                 vibratoFrequency:(AKParameter *)vibratoFrequency;

/// Instantiates the flute with default values
- (instancetype)init;

/// Instantiates the flute with default values
+ (instancetype)flute;


/// Frequency of the note. [Default Value: 440]
@property (nonatomic) AKParameter *frequency;

/// Set an optional frequency
/// @param frequency Frequency of the note. Updated at Control-rate. [Default Value: 440]
- (void)setOptionalFrequency:(AKParameter *)frequency;

/// Time in seconds to reach full blowing pressure. [Default Value: 0.1]
@property (nonatomic) AKConstant *attackTime;

/// Set an optional attack time
/// @param attackTime Time in seconds to reach full blowing pressure. [Default Value: 0.1]
- (void)setOptionalAttackTime:(AKConstant *)attackTime;

/// Time in seconds taken to stop blowing. [Default Value: 0.1]
@property (nonatomic) AKConstant *releaseTime;

/// Set an optional release time
/// @param releaseTime Time in seconds taken to stop blowing. [Default Value: 0.1]
- (void)setOptionalReleaseTime:(AKConstant *)releaseTime;

/// a parameter controlling the air jet. Values should be positive, and the useful range is approximately 0.08 to 0.56. [Default Value: 0.2]
@property (nonatomic) AKParameter *airJetPressure;

/// Set an optional air jet pressure
/// @param airJetPressure a parameter controlling the air jet. Values should be positive, and the useful range is approximately 0.08 to 0.56. Updated at Control-rate. [Default Value: 0.2]
- (void)setOptionalAirJetPressure:(AKParameter *)airJetPressure;

/// Amount of reflection in the breath jet that powers the flute. [Default Value: 0.5]
@property (nonatomic) AKConstant *jetrf;

/// Set an optional jetrf
/// @param jetrf Amount of reflection in the breath jet that powers the flute. [Default Value: 0.5]
- (void)setOptionalJetrf:(AKConstant *)jetrf;

/// Reflection coefficient of the breath jet. [Default Value: 0.5]
@property (nonatomic) AKConstant *endrf;

/// Set an optional endrf
/// @param endrf Reflection coefficient of the breath jet. [Default Value: 0.5]
- (void)setOptionalEndrf:(AKConstant *)endrf;

/// Amplitude of the noise component, about 0 to 0.5 [Default Value: 0.15]
@property (nonatomic) AKParameter *noiseAmplitude;

/// Set an optional noise amplitude
/// @param noiseAmplitude Amplitude of the noise component, about 0 to 0.5 Updated at Control-rate. [Default Value: 0.15]
- (void)setOptionalNoiseAmplitude:(AKParameter *)noiseAmplitude;

/// Amplitude of the note, up to but not including 1. [Default Value: 0.5]
@property (nonatomic) AKParameter *amplitude;

/// Set an optional amplitude
/// @param amplitude Amplitude of the note, up to but not including 1. Updated at Control-rate. [Default Value: 0.5]
- (void)setOptionalAmplitude:(AKParameter *)amplitude;

/// Table defining the shape of the vibrato. [Default Value: sine]
@property (nonatomic) AKTable *vibratoShape;

/// Set an optional vibrato shape
/// @param vibratoShape Table defining the shape of the vibrato. [Default Value: sine]
- (void)setOptionalVibratoShape:(AKTable *)vibratoShape;

/// Amplitude of the vibrato. [Default Value: 0]
@property (nonatomic) AKParameter *vibratoAmplitude;

/// Set an optional vibrato amplitude
/// @param vibratoAmplitude Amplitude of the vibrato. Updated at Control-rate. [Default Value: 0]
- (void)setOptionalVibratoAmplitude:(AKParameter *)vibratoAmplitude;

/// Frequency of vibrato in Hertz. Suggested range is 0 to 12 [Default Value: 0]
@property (nonatomic) AKParameter *vibratoFrequency;

/// Set an optional vibrato frequency
/// @param vibratoFrequency Frequency of vibrato in Hertz. Suggested range is 0 to 12 Updated at Control-rate. [Default Value: 0]
- (void)setOptionalVibratoFrequency:(AKParameter *)vibratoFrequency;



@end
