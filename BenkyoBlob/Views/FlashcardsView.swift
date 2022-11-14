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
    @Binding var selectedDeck : Int?
    @EnvironmentObject var DM : DeckModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Button {
                        selectedDeck = nil
                    } label: {
                        Image(systemName: "arrow.left.circle")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                    }
                    Spacer()
                    Button {
                        editCard = !editCard
                    } label: {
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                    }
                    //.offset(y: -geo.size.height / 3.5)
                    
                }
                
                Text(deck.name)
                    .font(.custom("FFF Forward", size: 20))
                ZStack {
                    Button {
                        showAnswer = !showAnswer
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: geo.size.width / 1.3, height: geo.size.height / 5)
                                .border(.black)
                                .foregroundColor(.white)
                            if (!editCard) {
                                if (!showAnswer) {
                                    Text(deck.deck[cardIndex].question)
                                        .frame(width: geo.size.width / 1.3, height: geo.size.height / 5)
                                        .font(.custom("FFF Forward", size: 13))
                                }
                                else {
                                    Text(deck.deck[cardIndex].answer)
                                        .frame(width: geo.size.width / 1.3, height: geo.size.height / 5)
                                        .font(.custom("FFF Forward", size: 13))
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
                            .frame(width: geo.size.width / 1.3, height: geo.size.height / 4)
                            
                            FieldView(name: Binding<String>(get: {
                                deck.deck[cardIndex].answer
                            }, set: { newValue in
                                DM.allCurrDecks.allDecks[deck.id].deck[cardIndex].answer = newValue
                            }))
                            .frame(width: geo.size.width / 1.3, height: geo.size.height / 4)
                            
                        }
                        
                    }
                    
                }
                .navigationBarHidden(true)
                if (deck.deck.count > 1) {
                    Button {
                        if (cardIndex >= deck.deck.count - 1) {
                            cardIndex = 0
                        } else {
                            cardIndex += 1
                        }
                        showAnswer = false
                        
                        
                    } label: {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                    }
                }
            }
        }
    }
    
}

struct FlashcardsView: View {
    @EnvironmentObject var DM : DeckModel
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
                                    Image(systemName: "arrow.left.circle")
                                        .resizable()
                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            ToolbarItem(placement: .primaryAction) {
                                Button {
                                    renameDeckMode = !renameDeckMode
                                } label: {
                                    Image(systemName: "pencil.circle")
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
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .border(.black)
                                            .frame(width: geo.size.width / 1.5, height: geo.size.height / 8)
                                        if (!renameDeckMode) {
                                            Text(deck.name)
                                                .font(.custom("FFF Forward", size: 20))
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
                                    .frame(width: geo.size.width / 1.5, height: geo.size.height / 8)
                                }
                                
                                
                            }
                        }
                    }
                    .offset(y: -geo.size.height / 10)
                    Button {
                        var newDeck = Deck(id: DM.allCurrDecks.allDecks.count, name: "New Deck \(DM.allCurrDecks.allDecks.count)", deck: [Flashcard]())
                        newDeck.deck.append(Flashcard(id: UUID(), question: "Question 1", answer: "Answer 1"))
                        DM.allCurrDecks.allDecks.append(newDeck)
                        
                    } label: {
                        ZStack {
                            Circle()
                                .frame(height: geo.size.height / 10)
                                .foregroundColor(.blue)
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: geo.size.width / 8, height: geo.size.width / 8)
                        }
                    }
                    .offset(x: geo.size.width / 4)
                }
                
                
                
            }.navigationBarHidden(true)
        }
    }
    
}

struct FieldView: View {
    
    @Binding var name : String
    
    var body : some View {
        TextField("Deck Name", text: $name)
    }
    
}

struct FlashcardsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardsView(modeSelect: .constant(3))
            .environmentObject(DeckModel())
    }
}