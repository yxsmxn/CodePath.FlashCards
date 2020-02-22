//
//  ViewController.swift
//  FlashCards
//
//  Created by Yasmin Hernandez on 2/20/20.
//  Copyright © 2020 Yasmin Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AnswerBackLabel: UILabel!
    @IBOutlet weak var QuestionFrontLabel: UILabel!
    
    @IBOutlet weak var card: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnswerBackLabel.layer.cornerRadius = 20.0
        QuestionFrontLabel.layer.cornerRadius = 20.0
        
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        AnswerBackLabel.layer.shadowRadius = 15.0
        AnswerBackLabel.layer.shadowOpacity = 0.2
        
        QuestionFrontLabel.layer.shadowRadius = 15.0
        QuestionFrontLabel.layer.shadowOpacity = 0.2
        
        AnswerBackLabel.clipsToBounds = true
        QuestionFrontLabel.clipsToBounds = true
        // Do any additional setup after loading the view.
        
    }

    @IBAction func TappedonFlashcard(_ sender: Any) {
        if(AnswerBackLabel.isHidden == false){
            AnswerBackLabel.isHidden = true
            QuestionFrontLabel.isHidden = false;
        }
        
        else if(QuestionFrontLabel.isHidden == true){
            QuestionFrontLabel.isHidden = false
            AnswerBackLabel.isHidden = true;
        }
        else if(QuestionFrontLabel.isHidden == false){
            QuestionFrontLabel.isHidden = true
            AnswerBackLabel.isHidden = false;
        }
        else if(AnswerBackLabel.isHidden == true){
            AnswerBackLabel.isHidden = false
            QuestionFrontLabel.isHidden = true;
        }
    }
    
}
