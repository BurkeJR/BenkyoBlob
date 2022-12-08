//
//  BenkyoBlobApp.swift
//  BenkyoBlob
//
//  Created by John Burke on 11/13/22.
//

import SwiftUI

@main
struct BenkyoBlobApp: App {
    var VM = ViewModel()
    var body: some Scene {
        WindowGroup {
            if (VM.usedBefore) {
                MainBlobView()
                    .environmentObject(ViewModel())
            }
            else {
                SelectBlobView()
                    .environmentObject(ViewModel())
            }
            
        }
    }
}
