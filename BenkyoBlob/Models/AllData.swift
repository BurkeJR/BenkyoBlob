//
//  AllData.swift
//  BenkyoBlob
//
//  Created by John Burke on 12/8/22.
//

import Foundation


struct AllData: Decodable {
    var quizes: [Quiz]
    var allDecks: [Deck]
//    var allNotes: AllNotes
//    var pet: Blob
}
