//
//  UnlockablesView.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/14/22.
//

import SwiftUI

struct collectionTableView : View {
    @EnvironmentObject var VM : ViewModel
    @State var itemSelect : Int?
    var body: some View {
        GeometryReader { geo in
            VStack {
                ForEach (VM.allUnlockables.treasure) { item in
                    if (!item.isUnlocked) {
                        HStack {
                            Image("collectibles-box-lrg")
                                .resizable()
                                .frame(width: geo.size.width / 8, height: geo.size.width / 8)
                                .padding()
                            Text("??????????????")
                                .font(.custom("FFF Forward", size: geo.size.width / 20))
                        }
                    }
                    else {
                        NavigationLink(tag: item.id, selection: $itemSelect) {
                            VStack {
                                Button {
                                    itemSelect = nil
                                } label: {
                                    Image("back-button-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                        .padding()
                                }
                                .offset(x: -geo.size.width / 2.5)
                                Image(item.sprite)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                ScrollView {
                                    Text(item.name)
                                        .font(.custom("FFF Forward", size: 25))
                                    Text(item.description)
                                        .font(.custom("FFF Forward", size: 15))
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                }
                            }
                            .navigationBarHidden(true)
                        } label: {
                            HStack {
                                Image(item.sprite)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text(item.name)
                                    .font(.custom("FFF Forward", size: geo.size.width / 20))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.green)
                                    .offset(x: geo.size.width / 15)
                            }
                            .offset(x: -geo.size.width / 6)
                            
                        }
                    }
                    
                }
            }
        }
        
    }
}

struct UnlockablesView: View {
    @Binding var modeSelect : Int?
    var n = 20
    
    @EnvironmentObject var VM : ViewModel
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                
                VStack {
                    Text("")
                        .toolbar {
                            ToolbarItem(placement: .navigation) {
                                Button {
                                    modeSelect = nil
                                } label: {
                                    Image("back-button-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                        .padding()
                                }
                            }
                        }
                    
                    ScrollView {
                        collectionTableView()
                            .environmentObject(VM)
                        //                        HStack {
                        //
                        //                            VStack {
                        //                                ForEach(VM.allUnlockables.treasure) { item in
                        //                                    VStack {
                        
                        //                                    }
                        //
                        //                                }
                        //                                Spacer()
                        //
                        //                            }
                        //                            VStack {
                        //                                ForEach(VM.allUnlockables.treasure) { item in
                        //                                    VStack {
                        //                                        if (item.id % 4 == 1) {
                        //                                            ZStack {
                        //                                                Image("collectibles-box-lrg")
                        //                                                    .resizable()
                        //                                                    .frame(width: 50, height: 50)
                        //                                                    .padding()
                        //                                                if (item.isUnlocked) {
                        //                                                    Image(item.sprite)
                        //                                                        .resizable()
                        //                                                        .frame(width: 30, height: 30)
                        //                                                }
                        //                                            }
                        //                                        }
                        //                                    }
                        //
                        //                                }
                        //                                Spacer()
                        //                            }
                        //                            VStack {
                        //                                ForEach(VM.allUnlockables.treasure) { item in
                        //                                    VStack {
                        //                                        if (item.id % 4 == 2) {
                        //                                            ZStack {
                        //                                                Image("collectibles-box-lrg")
                        //                                                    .resizable()
                        //                                                    .frame(width: 50, height: 50)
                        //                                                    .padding()
                        //                                                if (item.isUnlocked) {
                        //                                                    Image(item.sprite)
                        //                                                        .resizable()
                        //                                                        .frame(width: 30, height: 30)
                        //                                                }
                        //                                            }
                        //                                        }
                        //                                    }
                        //
                        //                                }
                        //                                Spacer()
                        //                            }
                        //                            VStack {
                        //                                ForEach(VM.allUnlockables.treasure) { item in
                        //                                    VStack {
                        //                                        if (item.id % 4 == 3) {
                        //                                            ZStack {
                        //                                                Image("collectibles-box-lrg")
                        //                                                    .resizable()
                        //                                                    .frame(width: 50, height: 50)
                        //                                                    .padding()
                        //                                                if (item.isUnlocked) {
                        //                                                    Image(item.sprite)
                        //                                                        .resizable()
                        //                                                        .frame(width: 30, height: 30)
                        //                                                }
                        //                                            }
                        //                                        }
                        //                                    }
                        //
                        //                                }
                        //                                Spacer()
                        //                            }
                        //
                        //                        }
                    }
                }
                //.navigationBarHidden(true)
                
            }
        }
        
        
    }
}

struct UnlockablesView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockablesView(modeSelect: .constant(3))
            .environmentObject(ViewModel())
    }
}
