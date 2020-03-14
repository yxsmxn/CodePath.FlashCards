//
//  ViewController.swift
//  FlashCards
//
//  Created by Yasmin Hernandez on 2/20/20.
//  Copyright © 2020 Yasmin Hernandez. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    
}

class ViewController: UIViewController {

    @IBOutlet weak var AnswerBackLabel: UILabel!
    @IBOutlet weak var QuestionFrontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readSavedFlashcards()
        
        if flashcards.count == 0{
            updateFlashcard(question:"What is a polygon with four unequal sides called?", answer: "Quadrilateral")
        }else{
            updateLabels()
            updateNextPrevButton()
        }
        
        AnswerBackLabel.layer.cornerRadius = 20.0
        QuestionFrontLabel.layer.cornerRadius = 20.0
        ///card layers
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
        
        updateFlashcard(question:"What is a polygon with four unequal sides called?", answer: "Quadrilateral")
        
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
    
    func updateFlashcard(question: String, answer: String){
        let flashcard = Flashcard(question: question, answer: answer)
        AnswerBackLabel.text = flashcard.answer
        QuestionFrontLabel.text = flashcard.question
        
        flashcards.append(flashcard)
        // writing code here
        
        print("Added New Flashcard")
        print("Now we have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButton()
        
        updateLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.FlashCardsController = self
    }

    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButton()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButton()
    }
    
    func updateNextPrevButton(){
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        } else{
            nextButton.isEnabled = true
        }
    }
    
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
        QuestionFrontLabel.text = currentFlashcard.question
        AnswerBackLabel.text = currentFlashcard.answer
        }
    
    func saveAllFlashcardstoDisk(){
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer]
            }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            let savedCards = dictionaryArray.map{ dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
                
            }
            
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    }
