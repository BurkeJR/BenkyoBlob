//
//  FlashcardsView.swift
//  Benkyou Blob (iOS)
//
//  Created by Daniel Li on 11/12/22.
//

import SwiftUI

struct CardView: View {
    
    var deck : Deck
    @State var showAnswer : Bool
    @State var cardIndex = 0;
    @State var editCard : Bool = false
    @State var randomizer : Int = 0
    @Binding var selectedDeck : Int?
    @EnvironmentObject var DM : ViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Button {
                        selectedDeck = nil
                    } label: {
                        Image("back-button-lrg")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                    }
                    Spacer()
                    Button {
                        editCard = !editCard
                    } label: {
                        Image("edit-lrg")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                    }
                    //.offset(y: -geo.size.height / 3.5)
                    
                }
                if deck.deck.count > 0 {
                    Text(deck.name)
                        .font(.custom("FFF Forward", size: 20))
                    ZStack {
                        Button {
                            showAnswer = !showAnswer
                        } label: {
                            ZStack {
                                Image("flashcard-lrg")
                                    .resizable()
                                    .frame(width: geo.size.width / 1.1, height: geo.size.height / 4)
                                    .border(.black)
                                    .foregroundColor(.white)
                                if (!editCard) {
                                    if (!showAnswer) {
                                        Text(deck.deck[cardIndex].question)
                                            .frame(width: geo.size.width / 1.3, height: geo.size.height / 5)
                                            .font(.custom("FFF Forward", size: geo.size.height / 45))
                                    }
                                    else {
                                        Text(deck.deck[cardIndex].answer)
                                            .frame(width: geo.size.width / 1.3, height: geo.size.height / 5)
                                            .font(.custom("FFF Forward", size: geo.size.height / 45))
                                    }
                                    
                                }
                                else {
                                    Text("")
                                }
                            }
                            
                            
                        }
                        if editCard {
                            VStack {
                                
                                FieldView(name: Binding<String>(get: {
                                    deck.deck[cardIndex].question
                                }, set: { newValue in
                                    DM.allCurrDecks.allDecks[deck.id].deck[cardIndex].question = newValue
                                }))
                                .frame(width: geo.size.width / 1.3, height: geo.size.height / 8)
                                
                                FieldView(name: Binding<String>(get: {
                                    deck.deck[cardIndex].answer
                                }, set: { newValue in
                                    DM.allCurrDecks.allDecks[deck.id].deck[cardIndex].answer = newValue
                                }))
                                .frame(width: geo.size.width / 1.3, height: geo.size.height / 8)
                                
                            }
                            
                        }
                        
                    }
                    .navigationBarHidden(true)
                    if (deck.deck.count > 1) {
                        HStack {
                            Button {
                                if (cardIndex <= 0) {
                                    cardIndex = deck.deck.count - 1
                                } else {
                                    cardIndex -= 1
                                }
                                randomizer = Int.random(in: 0...1000)
                                
                            } label: {
                                Image("prev-button-lrg")
                                    .resizable()
                                    .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            }
                            Button {
                                if (cardIndex >= deck.deck.count - 1) {
                                    cardIndex = 0
                                } else {
                                    cardIndex += 1
                                }
                                showAnswer = false
                                randomizer = Int.random(in: 0...1000)
                                
                            } label: {
                                Image("next-button-lrg")
                                    .resizable()
                                    .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            }
                        }
                        
                    }
                    if editCard {
                        HStack {
                            Button {
                                if selectedDeck != nil {
                                    let newCard = Flashcard(id: UUID(), index: cardIndex, question: "Question", answer: "Answer")
                                    DM.allCurrDecks.allDecks[selectedDeck!].addCard(card: newCard)
                                }
                                
                                
                            } label: {
                                ZStack {
                                    Image("add-icon-lrg")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                                }
                            }
                            Button {
                                if selectedDeck != nil {
                                    DM.allCurrDecks.allDecks[selectedDeck!].removeCard(card: DM.allCurrDecks.allDecks[selectedDeck!].deck[cardIndex])
                                    if (cardIndex < 0) {
                                        cardIndex = DM.allCurrDecks.allDecks[selectedDeck!].deck.count - 1
                                    }
                                    if (cardIndex >= deck.deck.count - 1) {
                                        cardIndex = 0
                                    }
                                }
                                
                                
                            } label: {
                                ZStack {
                                    Image("delete-icon-lrg")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                                }
                            }
                        }
                    }
                }
                else {
                    VStack {
                        Text("No cards here!  Click the + button to add a card!")
                            .font(.custom("FFF Forward", size: geo.size.height / 45))
                            .foregroundColor(.gray)
                        Button {
                            editCard = true
                            if selectedDeck != nil {
                                let newCard = Flashcard(id: UUID(), index: cardIndex, question: "Question", answer: "Answer")
                                DM.allCurrDecks.allDecks[selectedDeck!].addCard(card: newCard)
                            }
                            
                            
                        } label: {
                            ZStack {
                                Image("add-icon-lrg")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                            }
                        }
                    }
                    .navigationBarHidden(true)
                    
                }
            }
        }
    }
    
}

struct FlashcardsView: View {
    @EnvironmentObject var DM : ViewModel
    @State var currentDeck : String?
    @State var renameDeckMode : Bool = false
    @Binding var modeSelect : Int?
    @State var selectedDeck : Int?
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    Text("")
                        .frame(width: geo.size.width / 6, height: geo.size.width / 6)
                        .toolbar {
                            ToolbarItem(placement: .navigation) {
                                Button {
                                    modeSelect = nil
                                } label: {
                                    Image("back-button-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            ToolbarItem(placement: .primaryAction) {
                                Button {
                                    renameDeckMode = !renameDeckMode
                                } label: {
                                    Image("edit-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            
                        }
                    ScrollView {
                        ForEach(DM.allCurrDecks.allDecks) { deck in
                            
                            ZStack {
                                NavigationLink(tag: deck.id, selection: $selectedDeck) {
                                    CardView(deck: deck, showAnswer: false, selectedDeck: $selectedDeck)
                                        .environmentObject(DM)
                                } label: {
                                    
                                    ZStack {
                                        Image("flashcard-lrg")
                                            .resizable()
                                            .frame(width: geo.size.width / 1.5, height: geo.size.height / 8)
                                        if (!renameDeckMode) {
                                            Text(deck.name)
                                                .font(.custom("FFF Forward", size: geo.size.height / 30))
                                        } else {
                                            Text("");
                                        }
                                        
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                if renameDeckMode {
                                    FieldView(name: Binding<String>(get: {
                                        deck.name
                                    }, set: { newValue in
                                        DM.allCurrDecks.allDecks[deck.id].name = newValue
                                    }))
                                    .frame(width: geo.size.width / 1.7, height: geo.size.height / 8)
                                    
                                    Button {
                                        DM.allCurrDecks.removeDeck(deck: deck)
                                    } label: {
                                        Image("delete-icon-lrg")
                                            .resizable()
                                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                    }
                                    .offset(x: geo.size.width / 4)
                                    
                                }
                                
                                
                                
                                
                                
                                
                            }
                            
                        }
                    }
                    .offset(y: -geo.size.height / 10)
                    Button {
                        var newDeck = Deck(id: DM.allCurrDecks.allDecks.count, name: "New Deck \(DM.allCurrDecks.allDecks.count)", deck: [Flashcard]())
                        newDeck.deck.append(Flashcard(id: UUID(), index: 0, question: "Question 1", answer: "Answer 1"))
                        DM.allCurrDecks.allDecks.append(newDeck)
                        
                    } label: {
                        ZStack {
                            Image("add-icon-lrg")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                        }
                    }
                    
                    .offset(x: geo.size.width / 4, y: -geo.size.height / 10)
                }
                
                
                
            }.navigationBarHidden(true)
        }
    }
    
}

struct FieldView: View {
    
    @Binding var name : String
    
    var body : some View {
        TextField("Enter here", text: $name)
            .font(.custom("FFF Forward", size: 15))
            .border(.black)
        
    }
    
}

struct FlashcardsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardsView(modeSelect: .constant(5))
            .environmentObject(ViewModel())
    }
}
