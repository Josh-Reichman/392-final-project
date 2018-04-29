//
//  ViewController.swift
//  Sheep Game
//
//  Created by Josh Reichman on 4/28/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var exit: UIImageView!
    @IBOutlet weak var sheep: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var tapping = false
    var target = CGPoint(x: 0,y: 0)
    var time = 0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            self.update()
        })
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.async{
            self.wander()
        }
    }
    
    func wander(){
        if (sheep.frame.intersects(exit.frame)){
            timer.invalidate()
            let alert = UIAlertController(title: "Congratulations", message: "Sheep out of barn in "+String(time)+" seconds.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true, completion: nil)
            tapping = true
        }
        if (!tapping){
            var rotation = CGFloat(drand48()) * 2 * CGFloat.pi
            target = CGPoint(x:self.sheep.center.x + cos(rotation) * 50,y:self.sheep.center.y + sin(rotation) * 50)
            while (target.x < 0 || target.x > UIScreen.main.bounds.width || target.y < 0 || target.y > UIScreen.main.bounds.height){
                rotation = CGFloat(drand48()) * 2 * CGFloat.pi
                target = CGPoint(x:self.sheep.center.x + cos(rotation) * 50,y:self.sheep.center.y + sin(rotation) * 50)
            }
            sheep.transform = CGAffineTransform(rotationAngle: rotation)
            UIView.animate(withDuration: 1, delay: 0.5, options:[.allowUserInteraction], animations: {
                self.sheep.center = self.target
            }, completion: {_ in
                self.wander()
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        time += 1
        timerLabel.text = String(time) + "s"
    }
    
    @IBAction func tapOnSheep(_ sender: Any) {
        sheep.layer.removeAllAnimations()
        tapping = true
        let rotation = CGFloat(atan2f(Float(-sheep.transform.b), Float(-sheep.transform.a)))
        target = CGPoint(x:self.sheep.center.x + cos(rotation) * 50,y:self.sheep.center.y + sin(rotation) * 50)
        sheep.transform = CGAffineTransform(rotationAngle: rotation)
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.sheep.center = self.target
        }, completion: {_ in
            self.tapping = false
            self.wander()
        })
    }


}

