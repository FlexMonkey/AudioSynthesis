//
//  NumericDialBackground.swift
//  NumericDial
//
//  Created by Simon Gladman on 05/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class NumericDialBackground: CAShapeLayer
{
    
    final func drawBackgroundCurve()
    {
        strokeColor = UIColor.lightGrayColor().CGColor
        lineWidth = 40
        fillColor = nil
        self.lineCap = "round"
  
        let centre = min(frame.width, frame.height) / 2.0
        let radius = centre - 20
        
        let valuePath = UIBezierPath(arcCenter: CGPoint(x: centre, y: centre), radius: radius, startAngle: 135 * CGFloat(M_PI)/180, endAngle: 45 * CGFloat(M_PI)/180, clockwise: true)
        
        path = valuePath.CGPath
    }
}

