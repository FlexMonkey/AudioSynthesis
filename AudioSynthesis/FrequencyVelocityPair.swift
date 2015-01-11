//
//  FrequencyVelocityPair.swift
//  AudioSynthesis
//
//  Created by Simon Gladman on 15/10/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import Foundation

struct FrequencyAmplitudePair
{
    var frequency: Float
    var amplitude: Float
    
    init (frequency: Float, amplitude: Float)
    {
        self.frequency = frequency
        self.amplitude = amplitude
    }
}