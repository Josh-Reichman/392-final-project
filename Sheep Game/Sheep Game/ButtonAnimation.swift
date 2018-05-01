//
//  PulseButton.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 4/30/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

    extension UIButton {
        //pulse animation
        func pulsate() {
            
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.5
            pulse.fromValue = 0.95
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 2
            pulse.initialVelocity = 0.5
            pulse.damping = 1.0
            
            layer.add(pulse, forKey: "pulse")
        }
        
        //flashing animation
        func flash() {
            let flash = CABasicAnimation(keyPath: "opacity")
            flash.duration = 0.5
            flash.fromValue = 1
            flash.toValue = 0.1
            flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            flash.autoreverses = true
            flash.repeatCount = 3
            
            layer.add(flash, forKey: nil)
        }
    }
