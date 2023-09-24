//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by OmarAssidi on 24/09/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let correctAnswer: String
    init(q: String, a: String) {
        questionText = q
        correctAnswer = a
    }
}
