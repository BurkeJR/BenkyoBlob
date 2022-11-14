//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Li on 11/11/22.
//

import SwiftUI

struct MainBlobView: View {
    @EnvironmentObject var DM : DeckModel
    @State var modeSelect : Int?
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
                                    NavigationLink {
                                        
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
                                ToolbarItem(placement: .principal) {
                                    
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        Image("ui-05-unlockables-light-with-colored-shadow-lrg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                        
                                    }
                                }
                                //.padding()
                                
                                ToolbarItem(placement: .primaryAction) {
                                    
                                    
                                    NavigationLink {
                                        
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
                            
                        } label : {
                            Image("slimepet-01-pink-02-sad-lrg")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .offset(y: geo.size.width / geo.size.height > CGFloat(0.59) ? -geo.size.height / 10: geo.size.height / 16)
                        }
                        
                        
                    }
                    HStack {
                        
                        //.padding()
                    }
                    .offset(y: -geo.size.height / 1.75)
                    
                    
                }
            }
        }
        
        
        
        
    }
}

struct MainBlobViewView_Previews: PreviewProvider {
    static var previews: some View {
        MainBlobView()
            .environmentObject(DeckModel())
    }
}
