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
    let toneDial = NumericDial(frame: CGRectZero)
    let velocityDial = NumericDial(frame: CGRectZero)
    let sineWaveRenderer = SineWaveRenderer(frame: CGRectZero)
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        addSubview(sineWaveRenderer)
        addSubview(toneDial)
        addSubview(velocityDial)
        
        toneDial.addTarget(self, action: "dialChangeHander", forControlEvents: UIControlEvents.ValueChanged)
        velocityDial.addTarget(self, action: "dialChangeHander", forControlEvents: UIControlEvents.ValueChanged)
        
        toneDial.currentValue = 0.5
        velocityDial.currentValue = 0.5
        
        dialChangeHander()
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dialChangeHander()
    {
        sineWaveRenderer.setValues(frequency: toneDial.currentValue, velocity: velocityDial.currentValue)
    }
    
    override func didMoveToWindow()
    {
        sineWaveRenderer.frame = CGRect(x: 0, y: 0, width: 250, height: 125)
        toneDial.frame = CGRect(x: 0, y: 135, width: 250, height: 250)
        velocityDial.frame = CGRect(x: 0, y: 355, width: 250, height: 250)
        
        toneDial.labelFunction = labelFunction("Tone")
        velocityDial.labelFunction = labelFunction("Velocity")
    }
    
    func labelFunction(label: String) -> ((Double) -> String)
    {
        func lblFn(value: Double) -> String
        {
            return "\(label)\n\(Int(value * 128))"
        }
        
        return lblFn
    }
}
