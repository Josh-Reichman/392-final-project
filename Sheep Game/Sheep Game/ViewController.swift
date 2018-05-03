//
//  ViewController.swift
//  Sheep Game
//
//  Created by Josh Reichman on 4/28/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var exitImage: UIImageView!
    @IBOutlet weak var sheepImage: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var tapping = false
    var target = CGPoint(x: 0,y: 0)
    static var time = 0  //Jiakai Chen: change it to static for leaderboard and congrats message
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.time = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            self.update()
        })
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.async{
            self.wander()
        }
    }
    
    fileprivate func checkIfSheepExited() {
        if (sheepImage.frame.intersects(exitImage.frame)){
            timer.invalidate()
            /*let alert = UIAlertController(title: "Congratulations", message: "Sheep out of barn in "+String(time)+" seconds.", preferredStyle: UIAlertControllerStyle.alert) //TODO: Put return to title screen or start again once it's all implimented.
            self.present(alert, animated: true, completion: nil)*/
            
            //Jiakai Chen: popUp congrats message
            let popOverVC = UIStoryboard(name:"Main", bundle:
                nil).instantiateViewController(withIdentifier:"CongratsVC") as! PopUpViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
 
            tapping = true
        }
    }
    
    func wander(){
        checkIfSheepExited()
        if (!tapping){
            var rotation = CGFloat(drand48()) * 2 * CGFloat.pi
            target = CGPoint(x:self.sheepImage.center.x + cos(rotation) * 50,y:self.sheepImage.center.y + sin(rotation) * 50)
            while (target.x < 0 || target.x > UIScreen.main.bounds.width || target.y < 0 || target.y > UIScreen.main.bounds.height){
                rotation = CGFloat(drand48()) * 2 * CGFloat.pi
                target = CGPoint(x:self.sheepImage.center.x + cos(rotation) * 50,y:self.sheepImage.center.y + sin(rotation) * 50)
            }
            sheepImage.transform = CGAffineTransform(rotationAngle: rotation)
            UIView.animate(withDuration: 1, delay: 0.5, options:[.allowUserInteraction], animations: {
                self.sheepImage.center = self.target
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
        //Jiakai Chen: match the static variable.
        ViewController.time += 1
        timerLabel.text = String(ViewController.time) + "s"
    }
    
    @IBAction func tapOnSheep(_ sender: Any) {
        sheepImage.layer.removeAllAnimations()
        tapping = true
        let rotation = CGFloat(atan2f(Float(-sheepImage.transform.b), Float(-sheepImage.transform.a)))
        target = CGPoint(x:self.sheepImage.center.x + cos(rotation) * 50,y:self.sheepImage.center.y + sin(rotation) * 50)
        sheepImage.transform = CGAffineTransform(rotationAngle: rotation)
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.sheepImage.center = self.target
        }, completion: {_ in
            self.tapping = false
            self.wander()
        })
    }

    @IBAction func backToMenu(_ sender: Any) {
        performSegue(withIdentifier: "gameToMenu", sender: self)
    }
}

