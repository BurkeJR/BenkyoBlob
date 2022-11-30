//
//  Blob.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/29/22.
//

import Foundation

struct Blob : Decodable {
    var happiness : Int
    var maxHappiness : Int
    var EXP : Int
    var maxEXP : Int
    
    mutating func decrementHappiness() {
        if happiness > 0 {
            happiness -= 1
        }
    }
    mutating func incrementHappiness() {
        if happiness < maxHappiness {
            happiness += 1
        }
    }
}
