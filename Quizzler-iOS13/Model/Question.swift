//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Slava Pashaliuk on 3/27/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: String
    init(q: String, a: String){
        self.question = q
        self.answer = a
    }
}
