//
//  LeaderboardViewController.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 4/30/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit
import SpriteKit
class LeaderboardViewController: UIViewController {

    //check how many player are recorded
    static var recordedNumber = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        //Right now only recorded the score.

        
    }
    
    // not working right now. can only record the recent player
    //try to find a way to add label without deleting the previous.
    func addLabel(){
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 180, y: 200 + (LeaderboardViewController.recordedNumber * 25))
        label.text = " Player: \(NameRecordViewController.nameRecord) TimeUsed: \(ViewController.time)"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        //checkRecordedNumber += 1
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
