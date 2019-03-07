//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Salvador Garcia on 3/3/19.
//  Copyright © 2019 Salvador Garcia. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    var responses: [Answer]!

    func calculatePersonalityResult(){
        var frequencyOfAnswers: [HeroType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
                ?? 0) + 1
        }
        
//        let frequencyAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in
//            return pair1.value > pair2.value
//        })
        let mostCommonAnswer = frequencyOfAnswers.sorted{$0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        switch mostCommonAnswer {
        case .ironman:
            resultImage.image = UIImage(named: "ironManResult")
        case .spiderman:
            resultImage.image = UIImage(named: "spiderManResult")
        case .hulk:
            resultImage.image = UIImage(named: "hulkResult")
        case .thor:
            resultImage.image = UIImage(named: "thorResult")
        }
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
