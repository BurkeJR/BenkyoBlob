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
}

struct Question: Decodable, Identifiable {
    var id: Int
    var question: String
    var choices: [String]
    var answer: Int
}
