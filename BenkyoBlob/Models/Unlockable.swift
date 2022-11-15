//
//  Unlockable.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/14/22.
//

import Foundation

struct AllUnlockables : Decodable {
    var treasure : [Unlockable]
}

struct Unlockable : Identifiable, Decodable {
    var id : Int
    var name : String
    var description : String
}
