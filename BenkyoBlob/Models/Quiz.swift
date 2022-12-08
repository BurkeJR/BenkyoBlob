//
//  Quiz.swift
//  BenkyoBlob
//
//  Created by John Burke on 11/14/22.
//

import Foundation


struct AllQuizes: Decodable {
    var quizes: [Quiz]
}

struct Quiz: Decodable, Identifiable {
    var id: Int
    var name: String
    var questions: [Question]
    
    mutating func addQuestion(question: Question) {
        let index = question.index
        questions.insert(question, at: index)
        for i in (index..<questions.count) {
            questions[i].index += 1
        }
    }
    
    mutating func removeQuestion(question: Question) {
        let index = question.index
        questions.remove(at: index)
        for i in (index..<questions.count) {
            questions[i].index -= 1
        }
    }
}

struct Question: Decodable, Identifiable {
    var id: UUID?
    var index: Int
    var question: String
    var choices: [String]
    var answer: Int
    
    
}

