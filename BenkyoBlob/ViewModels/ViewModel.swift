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
    
    
    
    init() {
        defaultDeck.addCard(card: Flashcard(id: UUID(), index: 0, question: "Who lives in a pineapple under the sea?", answer: "SPONGEBOB SQUAREPANTS"))
        defaultDeck.addCard(card: Flashcard(id: UUID(), index: 1, question: "The lead singer of this band went to see a marching band when he was a young boy", answer: "My Chemical Romance"))
        defaultDeck.addCard(card: Flashcard(id: UUID(), index: 2, question: "Is Ace Attorney accurate?", answer: "No, the point of Ace Attorney is to show that the system is so broken that you have to break all laws and bring back the dead to find the truth."))
        
        allCurrDecks.allDecks.append(defaultDeck)
        
//        var questions = [Question]()
//
//        questions.append(Question(id: UUID(), index: 0, question: "Is this a question?", choices: ["Yes", "No"], answer: 0))
//        questions.append(Question(id: UUID(), index: 1, question: "Is the cake a lie?", choices: ["Yes", "No"], answer: 0))
//        questions.append(Question(id: UUID(), index: 2, question: "True or False: This sentence is a lie.", choices: ["True", "False", "OK"], answer: 2))
//
//        quizes.append(Quiz(id: 0, name: "Sample Quiz", questions: questions))
        
        readJSON()
        
        
        
//        allUnlockables.treasure.append(Unlockable(id: 0, name: "Takoyaki", description: "Takoyaki is a delicious Japanese dish that is basically described as deep-fried octopus pieces drizzled with a savory sauce and often topped with seaweed flakes and dried fish flakes."))
//        allUnlockables.treasure.append(Unlockable(id: 1, name: "Sushi", description: "Sushi, while a great dish, isn't for everyone.  People either love or hate sushi, but it depends on what kind you try."))
//        allUnlockables.treasure.append(Unlockable(id: 2, name: "Egg", description: "You can never go wrong with eggs.  Eggs can be cooked in so many different ways!"))
//        allUnlockables.treasure.append(Unlockable(id: 3, name: "", description: ""))
//        allUnlockables.treasure.append(Unlockable(id: 4, name: "", description: ""))
//        allUnlockables.treasure.append(Unlockable(id: 5, name: "", description: ""))
//        allUnlockables.treasure.append(Unlockable(id: 6, name: "", description: ""))
        
        allNotes.notes.append(Note(id: 0, content: "If you're reading this note, you just lost the game."))
    }
    
    func readJSON() {
        // 1. get the path to the file
        let pathName = Bundle.main.path(forResource: "benkyo", ofType: "json")
        
        // is an optional variable, so we have to check if it actually found the file
        if let path = pathName {
            // 2. create url object
            let url = URL(fileURLWithPath: path)
            
            do {
                // 3. fetch the data
                let data = try Data(contentsOf: url)
                
                // 4. create a json decoder
                let json_decoder = JSONDecoder()
                
                // 5. extract the data
                var json_data = try json_decoder.decode(AllData.self, from: data)
                
                for var quiz in json_data.quizes {
                    for index in 0..<quiz.questions.count {
                        quiz.questions[index].id = UUID()
                    }
                }
                

                
                quizes = json_data.quizes
                //allCurrDecks = json_data.allDecks
                //allNotes = json_data.allNotes
                //pet = json_data.pet
                
            } catch {
                print(error)
            }
        }
    }
    
    
}
