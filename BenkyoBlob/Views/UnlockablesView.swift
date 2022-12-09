//
//  UnlockablesView.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/14/22.
//

import SwiftUI
import WebKit

struct MyWebView : UIViewRepresentable{
    
    let request : URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}

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
                            NavigationView {
                                VStack {
                                    Text("")
                                        .toolbar {
                                            ToolbarItem(placement: .navigation) {
                                                Button {
                                                    itemSelect = nil
                                                } label: {
                                                    Image("back-button-lrg")
                                                        .resizable()
                                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                                        .padding()
                                                }
                                            }
                                        }
                                        
                                    //.offset(x: -geo.size.width / 2.5)
                                    Image(item.sprite)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                    ScrollView {
                                        Text(item.name)
                                            .font(.custom("FFF Forward", size: geo.size.width / 15))
                                        Text(item.description)
                                            .font(.custom("FFF Forward", size: geo.size.width / 25))
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                        NavigationLink {
                                            let url_add = URL(string: item.urlInfo)
                                            MyWebView(request: URLRequest(url: url_add!))
                                                .navigationBarHidden(true)
                                        } label: {
                                            Text(item.clickPrompt)
                                                .font(.custom("FFF Forward", size: geo.size.width / 25))
                                        }
                                        .navigationBarHidden(true)
                                    }
                                }
                                //.navigationBarHidden(true)
                            }
                            
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
                    }
                }
                
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
