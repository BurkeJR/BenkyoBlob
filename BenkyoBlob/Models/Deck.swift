//
//  Deck.swift
//  Benkyou Blob (iOS)
//
//  Created by Daniel Li on 11/12/22.
//

import Foundation

struct AllDecks : Decodable {
    var allDecks : [Deck] = [Deck]()
}

struct Deck : Decodable, Identifiable {
    var id : Int
    var name : String
    var deck : [Flashcard] = [Flashcard]()
}

struct Flashcard : Identifiable, Decodable {
    var id : UUID
    var question : String
    var answer : String
}
