//
//  FrequencyVelocityPair.swift
//  AudioSynthesis
//
//  Created by Simon Gladman on 15/10/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import Foundation

struct FrequencyVelocityPair
{
    var frequency: Int
    var velocity: Int
    
    init (frequency: Int, velocity: Int)
    {
        self.frequency = frequency
        self.velocity = velocity
    }
}