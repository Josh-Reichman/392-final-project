//
//  SecondViewController.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 4/30/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var sheepNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sheepNumber.text = String(LeaderboardViewController.gameMode)
        // Do any additional setup after loading the view.
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
    
    @IBAction func ChooseOneSheep(_ sender: Any) {
        LeaderboardViewController.gameMode = 1
        sheepNumber.text = String(LeaderboardViewController.gameMode)
    }
    
    @IBAction func ChooseTwoSheep(_ sender: Any) {
        LeaderboardViewController.gameMode = 2
        sheepNumber.text = String(LeaderboardViewController.gameMode)
    }
    
    @IBAction func ChooseThreeSheep(_ sender: Any) {
        LeaderboardViewController.gameMode = 3
        sheepNumber.text = String(LeaderboardViewController.gameMode)
    }
    
    @IBAction func ChooseFourSheep(_ sender: Any) {
        LeaderboardViewController.gameMode = 4
        sheepNumber.text = String(LeaderboardViewController.gameMode)
    }
    @IBAction func backToMenu(_ sender: Any) {
        performSegue(withIdentifier: "optionToMenu", sender: self)
    }
    
}
