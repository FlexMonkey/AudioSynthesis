//
//  Tambourine.h
//  AudioKit
//
//  Created by Aurelius Prochazka on 2/15/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKFoundation.h"

/// An instrument that wraps the tambourine physical model
@interface Tambourine : AKInstrument
@property AKInstrumentProperty *amplitude;
@end

@interface TambourineNote : AKNote

// Note properties
@property AKNoteProperty *dampingFactor;
@property AKNoteProperty *mainResonantFrequency;
@property AKNoteProperty *firstResonantFrequency;
@property AKNoteProperty *secondResonantFrequency;
@end
