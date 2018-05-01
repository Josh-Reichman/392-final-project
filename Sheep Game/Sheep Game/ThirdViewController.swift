//
//  ThirdViewController.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 4/30/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    //Menu ViewController
    //GameName
    @IBOutlet weak var gameName: UILabel!
    //StartGame Button
    @IBOutlet weak var startGameButton: UIButton!
    //option Button
    @IBOutlet weak var optionButton: UIButton!
    //leaderboard button
    @IBOutlet weak var leaderboardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //move the text out of the VC
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        gameName.center.x -= view.bounds.width
        startGameButton.center.x -= view.bounds.width
        optionButton.center.x -= view.bounds.width
        leaderboardButton.center.x -= view.bounds.width
    }
    
    //move back the text into the VC with animation
    override func viewDidAppear(_ animated: Bool) {
        //animation gameName apper
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.gameName.center.x += self.view.bounds.width
        },
        completion:{ finished in
            if finished{
                //after finished appear animation, wait 2s and then start wandering
                _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
                    self.gameName.shake()
                }
                
            }
        })
        
        //animation startGameButton
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
                       animations: {
                        self.startGameButton.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        
        //animation leaderboardButton
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [],
                       animations: {
                        self.leaderboardButton.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        
        //animation optionButton
        UIView.animate(withDuration: 0.5, delay: 0.7, options: [],
                       animations: {
                        self.optionButton.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        

        
    }
    //start game button animation
    @IBAction func startGame(_ sender: Any) {
        startGameButton.pulsate()
        _ = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "StartGame", sender: self)
            }
    }
    //to option button animation
    @IBAction func toOption(_ sender: Any) {
        optionButton.flash()
        _ = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "menuToOption", sender: self)
        }
    }
    // to leaderboard button animation
    @IBAction func toLeaderboard(_ sender: Any) {
        leaderboardButton.flash()
        _ = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "menuToLeaderboard", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
