//
//  ToneWidget.swift
//  AudioSynthesis
//
//  Created by Simon Gladman on 14/10/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ToneWidget: UIControl
{
    private let frequencyDial = NumericDial(frame: CGRectZero)
    private let velocityDial = NumericDial(frame: CGRectZero)
    private let sineWaveRenderer = SineWaveRenderer(frame: CGRectZero)
    
    private let index: Int
    
    required init(index: Int, frame: CGRect)
    {
        self.index = index
        
        super.init(frame: frame)
        
        addSubview(sineWaveRenderer)
        addSubview(frequencyDial)
        addSubview(velocityDial)
        
        frequencyDial.addTarget(self, action: "dialChangeHander", forControlEvents: UIControlEvents.ValueChanged)
        velocityDial.addTarget(self, action: "dialChangeHander", forControlEvents: UIControlEvents.ValueChanged)
        
        frequencyDial.currentValue = 0.25 * Double(index % 4 + 1)
        velocityDial.currentValue = 0.25 * Double(4 - index % 4)
        
        dialChangeHander()
    }

    func getIndex() -> Int
    {
        return index
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getFrequencyVelocityPair() -> FrequencyVelocityPair
    {
        return FrequencyVelocityPair(frequency: Int(frequencyDial.currentValue * 127), velocity: Int(velocityDial.currentValue * 127))
    }
    
    func dialChangeHander()
    {
        sineWaveRenderer.setFrequencyVelocityPairs([getFrequencyVelocityPair()])
        
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    override func didMoveToWindow()
    {
        sineWaveRenderer.frame = CGRect(x: 0, y: 0, width: Constants.width, height: 125)
        frequencyDial.frame = CGRect(x: 0, y: 145, width: Constants.width, height: Constants.width)
        velocityDial.frame = CGRect(x: 0, y: 355, width: Constants.width, height: Constants.width)
        
        frequencyDial.labelFunction = labelFunction("Frequency")
        velocityDial.labelFunction = labelFunction("Velocity")
        
        sineWaveRenderer.setFrequencyVelocityPairs([getFrequencyVelocityPair()])
    }
    
    func labelFunction(label: String) -> ((Double) -> String)
    {
        func lblFn(value: Double) -> String
        {
            return "\(label)\n\(Int(value * 127 + 1))"
        }
        
        return lblFn
    }
}
