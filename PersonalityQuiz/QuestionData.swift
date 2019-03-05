//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Salvador Garcia on 3/3/19.
//  Copyright © 2019 Salvador Garcia. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: HeroType
}

enum HeroType: String {
    case ironman = "Iron Man", spiderman = "Spider Man", hulk = "Hulk", thor = "Thor"
    
    var definition: String{
        switch self {
        case .ironman:
            return "You have strong leadership skills. Your strengths are confidence and being assertive. However, Be careful with your big pride as that can give you issue among those that care for you most"
        case .spiderman:
            return "You are very smart and calculative. You know your values and you stand by them firmly. However, you struggle with managing your time. Its ok to keep thriving but sometimes step back and spend some time with your family"
        case .hulk:
            return "You are very strong and emotional person. You will not stop until you get what you want. However, you must learn to control your emotions as it can blur reason and cause you to make irrational decisions"
        case .thor:
            return "You are very honorable and loved. You love order and fight for righteousnous. However, sometimes you can be naive when people are trying to decieve you. You must continue your ways but be very cautious about who to trust"
        }
    }
}
