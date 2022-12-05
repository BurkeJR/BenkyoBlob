//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Li on 11/11/22.
//

import SwiftUI

struct MainBlobView: View {
    @EnvironmentObject var DM : ViewModel
    @State var showHealth = false
    @State var modeSelect : Int?
    @State var isAnimated : Bool = false
    @State var numFrames = 1
    @State var stage = 1
    @EnvironmentObject var VM : ViewModel
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                
                ZStack {
                    Image("blob-room-lrg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .offset(y: geo.size.width / geo.size.height > CGFloat(0.59) ? -geo.size.height / 4 : 0)
                    VStack {
                        Text("")
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    NavigationLink(tag: 1, selection: $modeSelect) {
                                        StudyTimeView(modeSelect: $modeSelect)
                                    } label: {
                                        Image("ui-01-study-time-light-with-colored-shadow-lrg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                    }
                                }
                                //.padding()
                                
                                //Spacer()
                                ToolbarItem(placement: .navigation) {
                                    NavigationLink(tag: 2, selection: $modeSelect) {
                                        QuizesView(modeSelect: $modeSelect)
                                    } label: {
                                        Image("ui-03-quiz-light-with-colored-shadow-lrg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                        
                                    }
                                    .offset(x: geo.size.width / 20)
                                }
                                //.padding()
                                
                                //Spacer()
                                ToolbarItem(placement: .primaryAction) {
                                    NavigationLink(tag: 3, selection: $modeSelect) {
                                        UnlockablesView(modeSelect: $modeSelect)
                                    } label: {
                                        Image("ui-05-unlockables-light-with-colored-shadow-lrg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                        
                                    }
                                    //.offset(x: geo.size.width / 50)
                                    .padding()
                                }
                                
                                
                                ToolbarItem(placement: .destructiveAction) {
                                    
                                    
                                    NavigationLink(tag: 4, selection: $modeSelect) {
                                        TheCalendarView(modeSelect: $modeSelect)
                                    } label: {
                                        Image("ui-04-calendar-light-with-colored-shadow-lrg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                        
                                    }
                                    .offset(x: -geo.size.width / 20)
                                }
                                //.padding()
                                
                                //Spacer()
                                
                                ToolbarItem(placement: .confirmationAction) {
                                    NavigationLink(tag: 5, selection: $modeSelect) {
                                        FlashcardsView(modeSelect: $modeSelect)
                                    } label: {
                                        Image("ui-02-flashcard-light-with-colored-shadow-lrg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                    }
                                }
                            }
                        //Spacer()
                        Button {
                            showHealth = !showHealth
                        } label : {
                            if (!isAnimated) {
                                Image("\(VM.pet.currSprite)-\(VM.pet.mood)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .offset(y: geo.size.width / geo.size.height > CGFloat(0.59) ? -geo.size.height / 10: geo.size.height / 16)
                            }
                            else {
                                
                            }
                            
                        }
                        
                        
                    }
                    
                    if (showHealth) {
                        ZStack {
                            Image("flashcard-lrg")
                                .resizable()
                                .frame(width: geo.size.width / 1.1, height: geo.size.width / 2.5)
                            VStack {
                                
                                
                                HStack {
                                    if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 0.1) {
                                        if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 0.2) {
                                            Image("health-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                        else {
                                            Image("health-half-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                    }
                                    else {
                                        Image("health-empty-lrg")
                                            .resizable()
                                            .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                    }
                                    if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 0.3) {
                                        if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 0.4) {
                                            Image("health-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                        else {
                                            Image("health-half-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                    }
                                    else {
                                        Image("health-empty-lrg")
                                            .resizable()
                                            .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                    }
                                    if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 0.5) {
                                        if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 0.6) {
                                            Image("health-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                        else {
                                            Image("health-half-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                    }
                                    else {
                                        Image("health-empty-lrg")
                                            .resizable()
                                            .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                    }
                                    if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 0.7) {
                                        if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 0.8) {
                                            Image("health-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                        else {
                                            Image("health-half-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                    }
                                    else {
                                        Image("health-empty-lrg")
                                            .resizable()
                                            .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                    }
                                    if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 09) {
                                        if (Double(VM.pet.happiness) / Double(VM.pet.maxHappiness) >= 1) {
                                            Image("health-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                        else {
                                            Image("health-half-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                        }
                                    }
                                    else {
                                        Image("health-empty-lrg")
                                            .resizable()
                                            .frame(width: geo.size.width / 7, height: geo.size.width / 7)
                                    }
                                }
                                //.offset(y: -geo.size.height / 20)
                                HStack {
                                    ZStack {
                                        Image("exp-star")
                                            .resizable()
                                            .frame(width: geo.size.width / 5.5, height: geo.size.width / 5.5)
                                        Text("\(VM.pet.level)")
                                            .font(.custom("FFF Forward", size: 20))
                                            .foregroundColor(.red)
                                    }
                                    Text("EXP: \(VM.pet.EXP)/\(VM.pet.maxEXP)")
                                        .font(.custom("FFF Forward", size: 20))
                                }
                            }
                        }
                        .offset(y: geo.size.width / geo.size.height > CGFloat(0.59) ? -geo.size.height / 1.6 : -geo.size.height / 2)
                    }
                    
                    
                }
            }
        }
        
        
        
        
    }
}

struct MainBlobViewView_Previews: PreviewProvider {
    static var previews: some View {
        MainBlobView()
            .environmentObject(ViewModel())
    }
}
