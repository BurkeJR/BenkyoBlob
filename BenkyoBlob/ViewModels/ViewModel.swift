//
//  DeckModel.swift
//  Benkyou Blob (iOS)
//
//  Created by Daniel Li on 11/12/22.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var allCurrDecks = AllDecks(allDecks: [Deck]())
    @Published var defaultDeck = Deck(id: 0, name: "Pop Culture", deck: [Flashcard]())
    
    @Published var quizes = [Quiz]()
    
    init() {
        defaultDeck.deck.append(Flashcard(id: UUID(), question: "Who lives in a pineapple under the sea?", answer: "SPONGEBOB SQUAREPANTS"))
        defaultDeck.deck.append(Flashcard(id: UUID(), question: "The lead singer of this band went to see a marching band when he was a young boy", answer: "My Chemical Romance"))
        defaultDeck.deck.append(Flashcard(id:UUID(), question: "Is Ace Attorney accurate?", answer: "No, the point of Ace Attorney is to show that the system is so broken that you have to break all laws and bring back the dead to find the truth."))
        allCurrDecks.allDecks.append(defaultDeck)
        
        var questions = [Question]()
        questions.append(Question(id: 1, question: "Is this a question?", choices: ["Yes", "No"], answer: 0))
        questions.append(Question(id: 2, question: "Is the cake a lie?", choices: ["Yes", "No"], answer: 0))
        questions.append(Question(id: 3, question: "True or False: This sentence is a lie.", choices: ["True", "False", "OK"], answer: 3))
        
        quizes.append(Quiz(id: 1, name: "Sample Quiz", questions: questions))
    }
    
}
