//
//  NameRecordViewController.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 4/30/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class NameRecordViewController: UIViewController {

    @IBOutlet weak  var nameField: UITextField!
    
    static var nameRecord = "";
    static var updateStats:Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //background color should be the same as the menu
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Requried Player to type his/her name to go to leaderboard. Otherwise, shake the textfield
    @IBAction func toLeaderboard(_ sender: Any) {
        if(nameField.text == ""){
            nameField.shake()
        }
        else{
            NameRecordViewController.updateStats = true;
            NameRecordViewController.nameRecord = nameField.text!
            performSegue(withIdentifier: "NameRecordToLeaderboard", sender: self)
            //add recorded player variable in leaderboardViewController
            NameRecordViewController.updateStats = true;
        }
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
