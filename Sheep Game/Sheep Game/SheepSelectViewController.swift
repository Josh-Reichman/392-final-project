//
//  SheepSelectViewController.swift
//  Sheep Game
//
//  Created by Jiakai Chen on 4/30/18.
//  Copyright © 2018 Sheep Squad. All rights reserved.
//

import UIKit

class SheepSelectViewController: UIViewController {

    @IBOutlet weak var sheepNumber: UITextField!
    
    @IBOutlet weak var sheepAskingLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        sheepAskingLabel.center.x -= view.bounds.width
        sheepNumber.center.x -= view.bounds.width
        playButton.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [],
                       animations: {
                        self.sheepAskingLabel.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        
        UIView.animate(withDuration: 0.5, delay: 1, options: [],
                       animations: {
                        self.sheepNumber.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        
        UIView.animate(withDuration: 0.5, delay: 1, options: [],
                       animations: {
                        self.playButton.center.x += self.view.bounds.width
        },
                       completion: nil
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playGame(_ sender: Any) {
        playButton.flash()
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "StartPlaying", sender: self)
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
