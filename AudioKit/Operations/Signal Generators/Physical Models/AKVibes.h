//
//  AKVibes.h
//  AudioKit
//
//  Auto-generated on 1/3/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Physical model related to the striking of a metal block.

 Audio output is a tone related to the striking of a metal block as found in a vibraphone. The method is a physical model developed from Perry Cook, but re-coded for Csound.
 */

@interface AKVibes : AKAudio
/// Instantiates the vibes with all values
/// @param frequency Frequency of note played. Updated at Control-rate. [Default Value: 440]
/// @param amplitude Amplitude of note. Updated at Control-rate. [Default Value: 1.0]
/// @param stickHardness The hardness of the stick used in the strike. A range of 0 to 1 is used. 0.5 is a suitable value. [Default Value: 0.5]
/// @param strikePosition Where the block is hit, in the range 0 to 1. [Default Value: 0.2]
/// @param tremoloShapeTable Shape of tremolo, usually a sine table, created by a function [Default Value: sine]
/// @param tremoloFrequency Frequency of tremolo in Hertz. Suggested range is 0 to 12 Updated at Control-rate. [Default Value: 0]
/// @param tremoloAmplitude Amplitude of the tremolo Updated at Control-rate. [Default Value: 0]
- (instancetype)initWithFrequency:(AKParameter *)frequency
                        amplitude:(AKParameter *)amplitude
                    stickHardness:(AKConstant *)stickHardness
                   strikePosition:(AKConstant *)strikePosition
                tremoloShapeTable:(AKFunctionTable *)tremoloShapeTable
                 tremoloFrequency:(AKParameter *)tremoloFrequency
                 tremoloAmplitude:(AKParameter *)tremoloAmplitude;

/// Instantiates the vibes with default values
- (instancetype)init;

/// Instantiates the vibes with default values
+ (instancetype)vibes;


/// Frequency of note played. [Default Value: 440]
@property AKParameter *frequency;

/// Set an optional frequency
/// @param frequency Frequency of note played. Updated at Control-rate. [Default Value: 440]
- (void)setOptionalFrequency:(AKParameter *)frequency;

/// Amplitude of note. [Default Value: 1.0]
@property AKParameter *amplitude;

/// Set an optional amplitude
/// @param amplitude Amplitude of note. Updated at Control-rate. [Default Value: 1.0]
- (void)setOptionalAmplitude:(AKParameter *)amplitude;

/// The hardness of the stick used in the strike. A range of 0 to 1 is used. 0.5 is a suitable value. [Default Value: 0.5]
@property AKConstant *stickHardness;

/// Set an optional stick hardness
/// @param stickHardness The hardness of the stick used in the strike. A range of 0 to 1 is used. 0.5 is a suitable value. [Default Value: 0.5]
- (void)setOptionalStickHardness:(AKConstant *)stickHardness;

/// Where the block is hit, in the range 0 to 1. [Default Value: 0.2]
@property AKConstant *strikePosition;

/// Set an optional strike position
/// @param strikePosition Where the block is hit, in the range 0 to 1. [Default Value: 0.2]
- (void)setOptionalStrikePosition:(AKConstant *)strikePosition;

/// Shape of tremolo, usually a sine table, created by a function [Default Value: sine]
@property AKFunctionTable *tremoloShapeTable;

/// Set an optional tremolo shape table
/// @param tremoloShapeTable Shape of tremolo, usually a sine table, created by a function [Default Value: sine]
- (void)setOptionalTremoloShapeTable:(AKFunctionTable *)tremoloShapeTable;

/// Frequency of tremolo in Hertz. Suggested range is 0 to 12 [Default Value: 0]
@property AKParameter *tremoloFrequency;

/// Set an optional tremolo frequency
/// @param tremoloFrequency Frequency of tremolo in Hertz. Suggested range is 0 to 12 Updated at Control-rate. [Default Value: 0]
- (void)setOptionalTremoloFrequency:(AKParameter *)tremoloFrequency;

/// Amplitude of the tremolo [Default Value: 0]
@property AKParameter *tremoloAmplitude;

/// Set an optional tremolo amplitude
/// @param tremoloAmplitude Amplitude of the tremolo Updated at Control-rate. [Default Value: 0]
- (void)setOptionalTremoloAmplitude:(AKParameter *)tremoloAmplitude;



@end
