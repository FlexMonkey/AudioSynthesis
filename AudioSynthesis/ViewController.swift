//
//  ViewController.swift
//  AudioSynthesis
//
//  Created by Simon Gladman on 14/10/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var toneWidgets = [ToneWidget]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        for i in 0 ... 3
        {
            let toneWidget = ToneWidget(frame: CGRectZero)
            
            toneWidgets.append(toneWidget)
            view.addSubview(toneWidget)
        }
    }

    override func viewDidLayoutSubviews()
    {
        let columWidth = view.frame.width / 4
        let targetY = view.frame.height - 625
        
        for (i: Int, toneWidget: ToneWidget) in enumerate(toneWidgets)
        {
            let targetX = CGFloat(i) * columWidth + (columWidth / 2) - CGFloat(Constants.width / 2)
            
            toneWidget.frame = CGRect(x: targetX, y: targetY, width: CGFloat(Constants.width), height: 625)
        }
        
        
    }
    
    override func supportedInterfaceOrientations() -> Int
    {
        return Int(UIInterfaceOrientationMask.Landscape.toRaw())
    }

}

struct Constants
{
    static let width = 220
}

