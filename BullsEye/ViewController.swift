//
//  ViewController.swift
//  BullsEye
//
//  Created by Flatiron TTP on 1/17/18.
//  Copyright © 2018 Alberto Franco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetNumberLabel: UILabel!
    @IBOutlet weak var valueSlider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var currentScore: Int = 0
    var targetNumber : Int = 0
    var roundNumber : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setTargetAndLabel()
        setRoundNumber()
        setScoreLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hitMeButton(_ sender: UIButton) {
        print(valueSlider.value)
        if (Int(valueSlider.value) == targetNumber) {
            winAlertMessage()
        } else {
            loseAlertMessage()
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        currentScore = 0
        setScoreLabel()
        roundNumber = 1
        setRoundNumber()
        setTargetAndLabel()
    }
    
    func setRandomTarget() {
        targetNumber = Int(arc4random_uniform(101))
    }
    
    func setTargetAndLabel() {
        setRandomTarget()
        let message = "Put the Bull's eye as close as you can to: "
        targetNumberLabel.text = "\(message)\(targetNumber)"
        targetNumberLabel.sizeToFit()
    }
    
    func setRoundNumber() {
        let label = "Round: "
        roundLabel.text = "\(label)\(roundNumber)"
        roundLabel.sizeToFit()
    }
    
    func winAlertMessage() {
        let winMessage = UIAlertController(title: "Winner!", message: "You guessed correctly! Score increased!", preferredStyle: .alert)
        winMessage.addAction(UIAlertAction(title: "Next Round!", style: .default, handler: nil))
        self.present(winMessage, animated: true)
        roundNumber = roundNumber + 1
        increaseScore()
        setRoundNumber()
        setTargetAndLabel()
    }
    
    @IBAction func aboutButton(_ sender: UIButton) {
        let bodyContent = "My name is Alberto! See the code for this project under my GitHub @afranco07"
        let aboutMessage = UIAlertController(title: "About Alberto", message: bodyContent, preferredStyle: .alert)
        aboutMessage.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(aboutMessage, animated: true)
    }
    
    func loseAlertMessage() {
        let loseMessage = UIAlertController(title: "Loser!", message: "Wrong! You guessed \(Int(valueSlider.value))", preferredStyle: .alert)
        loseMessage.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        loseMessage.addAction(UIAlertAction(title: "New Game", style: .default, handler: nil))
        self.present(loseMessage, animated: true)
        decreaseScore()
        setTargetAndLabel()
    }
    
    func setScoreLabel() {
        let label = "Score: "
        scoreLabel.text = "\(label)\(currentScore)"
        scoreLabel.sizeToFit()
    }
    
    func increaseScore() {
        currentScore = currentScore + 10
        setScoreLabel()
    }
    
    func decreaseScore() {
        currentScore = currentScore - 10
        setScoreLabel()
    }


}

