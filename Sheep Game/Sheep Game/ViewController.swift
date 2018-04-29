//
//  ViewController.swift
//  Sheep Game
//
//  Created by Josh Reichman on 4/28/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sheep: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.async{
            self.wander()
        }
    }
    
    func wander(){
        var rotation = CGFloat(drand48()) * 2 * CGFloat.pi
        var target = CGPoint(x:self.sheep.center.x + cos(rotation) * 50,y:self.sheep.center.y + sin(rotation) * 50)
        while (target.x < 0 || target.x > UIScreen.main.bounds.width || target.y < 0 || target.y > UIScreen.main.bounds.height){
            rotation = CGFloat(drand48()) * 2 * CGFloat.pi
            target = CGPoint(x:self.sheep.center.x + cos(rotation) * 50,y:self.sheep.center.y + sin(rotation) * 50)
        }
        sheep.transform = CGAffineTransform(rotationAngle: rotation)
        UIView.animate(withDuration: 1, delay: 0.5, options:[.allowUserInteraction], animations: {
            self.sheep.center = target
        }, completion: {_ in
            self.wander()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapOnSheep(_ sender: Any) {
        self.view.layer.removeAllAnimations()
        let rotation = CGFloat(atan2f(Float(-sheep.transform.b), Float(-sheep.transform.a)))
        let target = CGPoint(x:self.sheep.center.x + cos(rotation) * 50,y:self.sheep.center.y + sin(rotation) * 50)
        sheep.transform = CGAffineTransform(rotationAngle: rotation)
        UIView.animate(withDuration: 1, delay: 0, options:[.allowUserInteraction], animations: {
            self.sheep.center = target
        }, completion: {_ in
            self.wander()
        })
    }


}

