//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Omar Assidi on 24/11/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

struct Question {
    var text: String
    var answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
