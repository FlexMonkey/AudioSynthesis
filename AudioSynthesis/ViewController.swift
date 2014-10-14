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

    let toneWidget = ToneWidget(frame: CGRectZero)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(toneWidget)
    }

    override func viewDidLayoutSubviews()
    {
        toneWidget.frame = CGRect(x: topLayoutGuide.length, y: topLayoutGuide.length, width: 250, height: 500)
    }
    
    override func supportedInterfaceOrientations() -> Int
    {
        return Int(UIInterfaceOrientationMask.Landscape.toRaw())
    }

}

