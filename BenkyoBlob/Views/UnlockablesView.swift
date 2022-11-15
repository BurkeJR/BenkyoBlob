//
//  UnlockablesView.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/14/22.
//

import SwiftUI

struct UnlockablesView: View {
    @Binding var modeSelect : Int?
    var n = 20
    
    @EnvironmentObject var VM : ViewModel
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                Button {
                    modeSelect = nil
                } label: {
                    Image("back-button-lrg")
                        .resizable()
                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                        .padding()
                }
                ScrollView {
                    HStack {
                        VStack {
                            ForEach(VM.allUnlockables.treasure) { item in
                                VStack {
                                    if (item.id % 4 == 0) {
                                        Rectangle()
                                            .frame(width: 50, height: 50)
                                            .padding()
                                    }
                                }
                                
                            }
                            
                        }
                        VStack {
                            ForEach(VM.allUnlockables.treasure) { item in
                                VStack {
                                    if (item.id % 4 == 1) {
                                        Rectangle()
                                            .frame(width: 50, height: 50)
                                            .padding()
                                    }
                                }
                                
                            }
                        }
                        VStack {
                            ForEach(VM.allUnlockables.treasure) { item in
                                VStack {
                                    if (item.id % 4 == 2) {
                                        Rectangle()
                                            .frame(width: 50, height: 50)
                                            .padding()
                                    }
                                }
                                
                            }
                        }
                        VStack {
                            ForEach(VM.allUnlockables.treasure) { item in
                                VStack {
                                    if (item.id % 4 == 3) {
                                        Rectangle()
                                            .frame(width: 50, height: 50)
                                            .padding()
                                    }
                                }
                                
                            }
                        }
                        
                    }
                }
            }
            .navigationBarHidden(true)
            
        }
        
        
    }
}

struct UnlockablesView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockablesView(modeSelect: .constant(3))
            .environmentObject(ViewModel())
    }
}
