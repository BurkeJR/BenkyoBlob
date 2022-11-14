//
//  BenkyoBlobApp.swift
//  BenkyoBlob
//
//  Created by John Burke on 11/13/22.
//

import SwiftUI

@main
struct BenkyoBlobApp: App {
    var body: some Scene {
        WindowGroup {
            MainBlobView()
                .environmentObject(DeckModel())
        }
    }
}
