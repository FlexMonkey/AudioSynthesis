//
//  NumericDialTrack.swift
//  NumericDial
//
//  Created by Simon Gladman on 05/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class NumericDialTrack: CAShapeLayer
{
    weak var numericDial: NumericDial?

    final func drawValueCurve()
    {
        if let value = numericDial?.currentValue
        {
            strokeColor = UIColor.blueColor().CGColor
            lineWidth = 30
            fillColor = nil
            self.lineCap = "round"
            
            let angle : CGFloat = -135 + 270 * CGFloat(value)
            let centre = min(frame.width, frame.height) / 2.0
            let radius = centre - 20
            
            let valuePath = UIBezierPath(arcCenter: CGPoint(x: centre, y: centre), radius: radius, startAngle: 135 * CGFloat(M_PI)/180, endAngle: (angle - 90) * CGFloat(M_PI)/180, clockwise: true)
 
            path = valuePath.CGPath
  
        }
    }
}
