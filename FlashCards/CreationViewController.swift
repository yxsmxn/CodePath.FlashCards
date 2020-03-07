//
//  CreationViewController.swift
//  FlashCards
//
//  Created by Yasmin Hernandez on 3/6/20.
//  Copyright © 2020 Yasmin Hernandez. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var FlashCardsController: ViewController!
    @IBOutlet weak var QuestionTextField: UITextField!
    
    @IBOutlet weak var AnswerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTaponDone(_ sender: Any) {
        
        let questionText = QuestionTextField.text
        let answerText = AnswerTextField.text
        
        FlashCardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
