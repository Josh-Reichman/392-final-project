//
//  SecondViewController.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 4/30/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    static var sheepNumber = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        LeaderboardViewController.gamemode = 1
    }
    
    @IBAction func ChooseTwoSheep(_ sender: Any) {
        LeaderboardViewController.gamemode = 2
    }
    
    @IBAction func ChooseThreeSheep(_ sender: Any) {
        LeaderboardViewController.gamemode = 3
    }
    
    @IBAction func ChooseFourSheep(_ sender: Any) {
        LeaderboardViewController.gamemode = 4
    }
    @IBAction func backToMenu(_ sender: Any) {
        performSegue(withIdentifier: "optionToMenu", sender: self)
    }
    
}
