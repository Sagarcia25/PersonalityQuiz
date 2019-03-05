//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Salvador Garcia on 3/3/19.
//  Copyright © 2019 Salvador Garcia. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

   
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var multipleLabel2: UILabel!
    @IBOutlet weak var multipleLabel3: UILabel!
    @IBOutlet weak var multipleLabel4: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedLabel3: UILabel!
    @IBOutlet weak var rangedLabel4: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // Do any additional setup after loading the view.
    }
   
   var answerChosen:[Answer] = []
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = question[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answerChosen.append(currentAnswers[0])
        case singleButton2:
            answerChosen.append(currentAnswers[1])
        case singleButton3:
            answerChosen.append(currentAnswers[2])
        case singleButton4:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = question[questionIndex].answers
        
        if multiSwitch1.isOn{
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answerChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answerChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answerChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    
    
    
    
    var questionIndex = 0
    
    func  updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = question[questionIndex]
        let currentAnswer = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(question.count)
        
        questionLabel.text = currentQuestion.text
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswer)
        case .multiple:
            updateMultipleStack(using: currentAnswer)
        case .ranged:
            updateRangedStack(using: currentAnswer)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers[1].text
        rangedLabel3.text = answers[2].text
        rangedLabel4.text = answers.last?.text
        
    }
    
    
    var question: [Question] = [
        Question(text: "Which word describes you best?", type: .single, answers: [
            Answer(text: "Outgoing", type: .ironman),
            Answer(text: "Intelligent", type: .spiderman),
            Answer(text: "Strong", type: .hulk),
            Answer(text: "Honorable", type: .thor)
            ]),
        Question(text: "Which activities do you enjoy", type: .multiple, answers: [
            Answer(text: "Building or creating", type: .ironman),
            Answer(text: "Learning new skills", type: .spiderman),
            Answer(text: "Working out", type: .hulk),
            Answer(text: "Sports with friends", type: .thor)
            ]),
        Question(text: "How social are you", type: .ranged, answers: [
            Answer(text: "Main attraction", type: .ironman),
            Answer(text: "Love being apart of the group", type: .thor),
            Answer(text: "I don't mind ", type: .spiderman),
            Answer(text: "I want to be alone", type: .hulk)
            ])
    
    ]
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
