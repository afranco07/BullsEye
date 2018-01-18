//
//  ViewController.swift
//  BullsEye
//
//  Created by Flatiron TTP on 1/17/18.
//  Copyright © 2018 Alberto Franco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetNumberLabel: UILabel!
    var targetNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setTargetAndLabel();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTargetAndLabel() {
        targetNumber = Int(arc4random_uniform(101));
        let message = "Put the Bull's eye as close as you can to: "
        targetNumberLabel.text = "\(message)\(targetNumber)"
    }


}

