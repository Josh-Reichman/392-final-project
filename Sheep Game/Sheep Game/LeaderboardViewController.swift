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
    
    //var playerStats = [[String]](repeating: [String](repeating: "0", count: 0), count: 5)
    
    var nameOne:[String] = [];
    var nameTwo:[String] = [];
    var nameThree:[String] = [];
    var nameFour:[String] = [];
    
    var timeOne:[Int] = [];
    var timeTwo:[Int] = [];
    var timeThree:[Int] = [];
    var timeFour:[Int] = [];
    
    static var gamemode = 1;
    
    var minimumTime = 0;
    var twoSheepMinimumTime = 0;
    var threeSheepMinimumTime = 0;
    var fourSheepMinimumTime = 0;
    
    var minTimeLocation = 0;
    var twoSheepMinTimeLocation = 0;
    var threeSheepMinTimeLocation = 0;
    var fourSheepMinTimeLocation = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*adding name and time
         if (NameRecordViewController.updateStats == true){
         if(NameRecordViewController.nameRecord != ""){
         playerStats[SecondViewController.sheepNumber].append(NameRecordViewController.nameRecord)
         playerStats[SecondViewController.sheepNumber].append(String(ViewController.time))
         
         }
         }
         */
        
        if (NameRecordViewController.updateStats == true){
            if(NameRecordViewController.nameRecord != ""){
                if(LeaderboardViewController.gamemode == 1){
                    nameOne.append(NameRecordViewController.nameRecord)
                    timeOne.append(ViewController.time)
                }
                if(LeaderboardViewController.gamemode == 2){
                    nameTwo.append(NameRecordViewController.nameRecord)
                    timeTwo.append(ViewController.time)
                }
                if(LeaderboardViewController.gamemode == 3){
                    nameThree.append(NameRecordViewController.nameRecord)
                    timeThree.append(ViewController.time)
                }
                if(LeaderboardViewController.gamemode == 4){
                    nameFour.append(NameRecordViewController.nameRecord)
                    timeFour.append(ViewController.time)
                }
                NameRecordViewController.updateStats = false
            }
        }
        
        
        
        //compare one sheep
        if(timeOne.min() != nil){
            var array1 = timeOne.sorted()
            minimumTime = array1[0]
            minTimeLocation = timeOne.index(of: minimumTime)!
        }
        //compare two sheep
        if(timeTwo.min() != nil){
            var array2 = timeTwo.sorted()
            twoSheepMinimumTime = array2[0]
            twoSheepMinTimeLocation = timeTwo.index(of: twoSheepMinimumTime)!
        }
        //compare three sheep
        if(timeThree.min() != nil){
            var array3 = timeThree.sorted()
            threeSheepMinimumTime = array3[0]
            threeSheepMinTimeLocation = timeThree.index(of: threeSheepMinimumTime)!
        }
        //compare four sheep
        if(timeFour.min() != nil){
            var array4 = timeFour.sorted()
            fourSheepMinimumTime = array4[0]
            fourSheepMinTimeLocation = timeFour.index(of: fourSheepMinimumTime)!
        }
        addLabel()
        //Right now only recorded the score.
        
        
        
    }
    
    // not working right now. can only record the recent player
    //try to find a way to add label without deleting the previous.
    func addLabel(){
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label1.center = CGPoint(x: 180, y: 270)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label2.center = CGPoint(x: 180, y: 370)
        
        let label3 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label3.center = CGPoint(x: 180, y: 470)
        
        let label4 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label4.center = CGPoint(x: 180, y:570)
        
        //One sheep highest
        if(timeOne.min() != nil){
            label1.text = " Player: \(nameOne[minTimeLocation]) TimeUsed: \(minimumTime)"
        }
        else{
            label1.text = " Player: None TimeUsed: None"
        }
        //Two sheep highest
        if(timeTwo.min() != nil){
            label2.text = " Player: \(nameTwo[twoSheepMinTimeLocation]) TimeUsed: \(twoSheepMinimumTime)"
        }
        else{
            label2.text = " Player: None TimeUsed: None"
        }
        
        //Three sheep highest
        if(timeThree.min() != nil){
            label3.text = " Player: \(nameThree[threeSheepMinTimeLocation]) TimeUsed: \(threeSheepMinimumTime)"
        }
        else{
            label3.text = " Player: None TimeUsed: None"
        }
        
        //Four sheep highest
        if(timeFour.min() != nil){
            label4.text = " Player: \(nameFour[fourSheepMinTimeLocation]) TimeUsed: \(fourSheepMinimumTime)"
        }
        else{
            label4.text = " Player: None TimeUsed: None"
        }
        label1.textAlignment = .center
        label2.textAlignment = .center
        label3.textAlignment = .center
        label4.textAlignment = .center
        self.view.addSubview(label1)
        self.view.addSubview(label2)
        self.view.addSubview(label3)
        self.view.addSubview(label4)
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
