//
//  SelectBlobView.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 12/6/22.
//

import SwiftUI

struct SelectBlobView: View {
    @EnvironmentObject var VM : ViewModel
    @State var selected = [false, false, false]
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Text("Select a pet:")
                        .font(.custom("FFF Forward", size: 40))
                        .padding()
                    HStack {
                        Button {
                            selected[0] = true
                            selected[1] = false
                            selected[2] = false
                            VM.pet = Blob(happiness: 0, maxHappiness: 10, EXP: 0, maxEXP: 10, starter: "slimepet-pink", level: 1)
                            
                        } label: {
                            ZStack {
                                Image("slimepet-pink-normal")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                                if (selected[0]) {
                                    Image("collectibles-box-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                                }
                                
                            }
                        }
                        Button {
                            selected[0] = false
                            selected[1] = true
                            selected[2] = false
                            VM.pet = Blob(happiness: 0, maxHappiness: 10, EXP: 0, maxEXP: 10, starter: "slimepet-blue", level: 1)
                            
                        } label: {
                            ZStack {
                                
                                
                                Image("slimepet-blue-normal")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                                if (selected[1]) {
                                    Image("collectibles-box-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                                }
                            }
                        }
                        Button {
                            selected[0] = false
                            selected[1] = false
                            selected[2] = true
                            VM.pet = Blob(happiness: 0, maxHappiness: 10, EXP: 0, maxEXP: 10, starter: "slimepet-yellow", level: 1)
                            
                        } label: {
                            ZStack {
                                Image("slimepet-yellow-normal")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                                if (selected[2]) {
                                    Image("collectibles-box-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                                }
                            }
                        }
                    }
                    NavigationLink {
                        MainBlobView()
                            .navigationBarHidden(true)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: geo.size.width / 2, height: geo.size.height / 10)
                            Text("Start")
                                .font(.custom("FFF Forward", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                }
                .offset(x: geo.size.width / 10, y: geo.size.height / 5)
                
                
            }.navigationBarHidden(true)
            
        }
    }
}

struct SelectBlobView_Previews: PreviewProvider {
    static var previews: some View {
        SelectBlobView()
            .environmentObject(ViewModel())
    }
}
