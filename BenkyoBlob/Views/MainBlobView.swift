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
                        .offset(y: geo.size.width / geo.size.height > CGFloat(0.58) ? -geo.size.height / 4 : 0)
                    VStack {
                        HStack {
                            NavigationLink {
                                
                            } label: {
                                Image("ui-01-study-time-light-lrg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }
                            .padding()
                            
                            Spacer()
                            
                            NavigationLink {
                                
                            } label: {
                                Image("ui-03-quiz-light-lrg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)

                            }
                            .padding()
                            
                            Spacer()
                            
                            NavigationLink(tag: 3, selection: $modeSelect) {
                                FlashcardsView(modeSelect: $modeSelect)
                            } label: {
                                Image("ui-02-flashcard-light-lrg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }
                            .padding()
                        }
                        .offset(y: -geo.size.height / 3)
                        //Spacer()
                        
                        Image("slimepet-01-pink-02-sad-lrg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(y: geo.size.width / geo.size.height > CGFloat(0.51) ? -geo.size.height / 10: geo.size.height / 16)
                        
                    }
                    
                    
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
