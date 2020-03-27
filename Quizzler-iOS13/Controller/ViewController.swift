//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var BtnOption1: UIButton!
    @IBOutlet weak var BtnOption2: UIButton!
    @IBOutlet weak var BtnOption3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizLogic = QuizLogic()
    @IBAction func qAnswered(_ sender: UIButton) {
        sender.layer.cornerRadius = 18
        sender.backgroundColor = quizLogic.checkAnswer(sender.currentTitle!) ? UIColor.green : UIColor.red
        quizLogic.updateQuestionNum()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func updateUI() {
        let buttons = [BtnOption1, BtnOption2, BtnOption3]
        var qOptions = quizLogic.getQuestionOptions()
        
        scoreLabel.text = "Score: \(quizLogic.getScore())"
        questionLabel.text = quizLogic.getQuestionText()
        progressBar.progress = quizLogic.getProgress()
        
        for i in 0..<buttons.count{
            buttons[i]!.backgroundColor = UIColor.clear
            buttons[i]!.setTitle(qOptions[i],for: .normal)
        }
    }
}

