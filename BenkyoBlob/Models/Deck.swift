//
//  Deck.swift
//  Benkyou Blob (iOS)
//
//  Created by Daniel Li on 11/12/22.
//

import Foundation

struct AllDecks : Decodable {
    var allDecks : [Deck] = [Deck]()
    mutating func removeDeck(deck: Deck) {
        let id = deck.id
        allDecks.remove(at: deck.id)
        //if id < allDecks.count {
            for i in (id..<allDecks.count) {
                allDecks[i].id -= 1
            }
        //}
    }
}

struct Deck : Decodable, Identifiable {
    var id : Int
    var name : String
    var deck : [Flashcard] = [Flashcard]()
    mutating func removeCard(card: Flashcard) {
        let index = card.index
        deck.remove(at: index)
        for i in (index..<deck.count) {
            deck[i].index -= 1
        }
    }
    mutating func addCard(card: Flashcard) {
        let index = card.index
        deck.insert(card, at: index)
        if (index + 1 < deck.count - 1) {
            for i in (index + 1..<deck.count) {
                deck[i].index += 1
            }
        }
        
    }
}

struct Flashcard : Identifiable, Decodable {
    var id : UUID?
    var index : Int
    var question : String
    var answer : String
}
