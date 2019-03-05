//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Salvador Garcia on 3/3/19.
//  Copyright © 2019 Salvador Garcia. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    var questionIndex = 0
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
