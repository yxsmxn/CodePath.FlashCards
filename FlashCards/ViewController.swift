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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func TappedonFlashcard(_ sender: Any) {
        QuestionFrontLabel.isHidden = true
        
    }
    
}

