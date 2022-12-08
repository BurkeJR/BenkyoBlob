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
    
    @Published var allUnlockables = AllUnlockables()
    
    @Published var quizes = [Quiz]()
    
    @Published var allNotes = AllNotes(notes: [Note]())
    
    @Published var pet = Blob(happiness: 0, maxHappiness: 10, EXP: 0, maxEXP: 10, starter: "slimepet-pink", level: 1)
    
    @Published var allExams = AllExams(allExams: [ExamDate]())
    
    @Published var usedBefore = false
    
    
    
    init() {
        defaultDeck.addCard(card: Flashcard(id: UUID(), index: 0, question: "Who lives in a pineapple under the sea?", answer: "SPONGEBOB SQUAREPANTS"))
        defaultDeck.addCard(card: Flashcard(id: UUID(), index: 1, question: "The lead singer of this band went to see a marching band when he was a young boy", answer: "My Chemical Romance"))
        defaultDeck.addCard(card: Flashcard(id: UUID(), index: 2, question: "Is Ace Attorney accurate?", answer: "No, the point of Ace Attorney is to show that the system is so broken that you have to break all laws and bring back the dead to find the truth."))
        
        allCurrDecks.allDecks.append(defaultDeck)
        
        var questions = [Question]()
        let yesNoChoices = [Choice(id: UUID(), index: 0, text: "Yes"), Choice(id: UUID(), index: 1, text: "No")]
        let otherChoices = [Choice(id: UUID(), index: 0, text: "True"), Choice(id: UUID(), index: 1, text: "False"),
        Choice(id: UUID(), index: 2, text: "OK")]
        
        questions.append(Question(id: UUID(), index: 0, question: "Is this a question?", choices: ["Yes", "No"], answer: 0))
        questions.append(Question(id: UUID(), index: 1, question: "Is the cake a lie?", choices: ["Yes", "No"], answer: 0))
        questions.append(Question(id: UUID(), index: 2, question: "True or False: This sentence is a lie.", choices: ["True", "False", "OK"], answer: 2))
        
        quizes.append(Quiz(id: 0, name: "Sample Quiz", questions: questions))
        
//        allUnlockables.treasure.append(Unlockable(id: 0, name: "Takoyaki", description: "Takoyaki is a delicious Japanese dish that is basically described as deep-fried octopus pieces drizzled with a savory sauce and often topped with seaweed flakes and dried fish flakes."))
//        allUnlockables.treasure.append(Unlockable(id: 1, name: "Sushi", description: "Sushi, while a great dish, isn't for everyone.  People either love or hate sushi, but it depends on what kind you try."))
//        allUnlockables.treasure.append(Unlockable(id: 2, name: "Egg", description: "You can never go wrong with eggs.  Eggs can be cooked in so many different ways!"))
//        allUnlockables.treasure.append(Unlockable(id: 3, name: "", description: ""))
//        allUnlockables.treasure.append(Unlockable(id: 4, name: "", description: ""))
//        allUnlockables.treasure.append(Unlockable(id: 5, name: "", description: ""))
//        allUnlockables.treasure.append(Unlockable(id: 6, name: "", description: ""))
        
        //allNotes.notes.append(Note(id: 0, content: "If you're reading this note, you just lost the game."))
        
        allExams.allExams.append(ExamDate(id: UUID(), date: Date(), title: "Computer Architecture Final"))
        allExams.allExams.append(ExamDate(id: UUID(), date: Date(), title: "Spanish 1 Final"))
        
        
        
        
    }
    
    
    
}
