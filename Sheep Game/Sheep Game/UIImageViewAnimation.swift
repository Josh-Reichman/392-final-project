//
//  UIImageViewAnimation.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 5/3/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

extension UIImageView {
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 3
        shake.repeatCount = .infinity
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: self.center.x, y: self.center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: self.center.x + 20, y: self.center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        self.layer.add(shake, forKey: "position")
    }
}
