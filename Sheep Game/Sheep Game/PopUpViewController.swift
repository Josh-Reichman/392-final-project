//
//  PopUpViewController.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 4/30/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var timeUsed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.5) 
        
        //get the time directly from viewController
        timeUsed.text = "Time Used: \(ViewController.time)s"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //if player clicked tryAgain, go back to menu
    @IBAction func toMenu(_ sender: Any) {
        performSegue(withIdentifier: "congratsToMenu", sender: self)
    }
    
    //should change in later. notleaderboard, but name recorder
    @IBAction func toLeaderBoard(_ sender: Any) {
        performSegue(withIdentifier: "congratsToLeaderboard", sender: self)
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
