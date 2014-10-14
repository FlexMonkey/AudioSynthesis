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
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        addSubview(toneDial)
        addSubview(velocityDial)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow()
    {
        toneDial.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        velocityDial.frame = CGRect(x: 0, y: 250, width: 250, height: 250)
        
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
