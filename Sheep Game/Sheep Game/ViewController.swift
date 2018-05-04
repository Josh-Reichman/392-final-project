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
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet var fences: [UIView]!
    
    let directions:[Int] = [0, 45, 90, 135, 180, 225, 270, 315]
    var target = CGPoint(x: 0,y: 0)
    var sheepLeft = 1
    static var time = 0  //Jiakai Chen: change it to static for leaderboard and congrats message
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sheepLeft = LeaderboardViewController.gameMode
        ViewController.time = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            self.update()
        })
        for _ in 1...LeaderboardViewController.gameMode{
            let imageName = "pixel_sheep.png"
            let image = UIImage(named: imageName)
            let sheepView = UIImageView(image: image!)
            sheepView.frame = CGRect(x: 0, y: 0, width: 60, height: 50)
            sheepView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
            sheepView.tag = 0
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnSheep))
            sheepView.isUserInteractionEnabled = true
            sheepView.addGestureRecognizer(tapGestureRecognizer)
            view.addSubview(sheepView)
            DispatchQueue.main.async{
                self.wander(sheep: sheepView)
            }
        }
    }
    @IBOutlet weak var temp: UILabel!
    
    fileprivate func checkIfSheepExited(sheep: UIImageView) {
        if (sheep.frame.intersects(exitImage.frame)){
            sheep.isUserInteractionEnabled = false
            sheep.layer.removeAllAnimations()
            sheep.removeFromSuperview()
        }
        if view.subviews.count == 11{   //all sheep exited
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
        }
    }
    
    func wander(sheep: UIImageView){
        checkIfSheepExited(sheep: sheep)
        if (sheep.tag == 0){
            var rotation = CGFloat(drand48()) * CGFloat.pi * 2
            target = CGPoint(x:sheep.center.x + cos(rotation) * 30,y:sheep.center.y + sin(rotation) * 30)
            while outOfFence(target: target){
                rotation = CGFloat(drand48()) * CGFloat.pi * 2
                target = CGPoint(x:sheep.center.x + cos(rotation) * 30,y:sheep.center.y + sin(rotation) * 30)
            }
            sheep.transform = CGAffineTransform(rotationAngle: rotation)
            UIView.animate(withDuration: 0.8, delay: 0.2, options:[.allowUserInteraction], animations: {
                sheep.center = self.target
            }, completion: {_ in
                self.wander(sheep: sheep)
            })
        }
    }
    
    func outOfFence(target: CGPoint) -> Bool{
        for fence in fences{
            if fence.frame.contains(target)
            {
                return true
            }
        }
        return false
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
    
    @objc func tapOnSheep(gestureRecognizer: UITapGestureRecognizer) {
        var sheep = gestureRecognizer.view!
        sheep.layer.removeAllAnimations()
        sheep.tag = 1
        let rotation = CGFloat(atan2f(Float(-sheep.transform.b), Float(-sheep.transform.a)))
        target = CGPoint(x:sheep.center.x + cos(rotation) * 30,y:sheep.center.y + sin(rotation) * 30)
        sheep.transform = CGAffineTransform(rotationAngle: rotation)
        UIView.animate(withDuration: 0.8, delay: 0, animations: {
            sheep.center = self.target
        }, completion: {_ in
            sheep.tag = 0
            self.wander(sheep: sheep as! UIImageView)
        })
    }

    @IBAction func backToMenu(_ sender: Any) {
        performSegue(withIdentifier: "gameToMenu", sender: self)
    }
}

