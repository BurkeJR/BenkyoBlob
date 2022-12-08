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
    var starter : String
    var evoLine : [String] {
        switch(starter) {
        case "slimepet-pink":
            return ["slimepet-pink", "ruby", "lily", "nadeshiko"]
        case "slimepet-blue":
            return ["slimepet-blue", "sappho", "neb", "orbulus"]
        case "slimepet-yellow":
            return ["slimepet-yellow", "goldie", "wickle", "hafesto"]
        default:
            return ["slimepet-pink", "ruby", "lily", "nadeshiko"]
        }
    }
    var mood : String {
        if (happiness < 4) {
            return "sad"
        }
        if (happiness >= 4 && happiness < 7) {
            return "normal"
        }
        return "happy"
    }
    var level : Int
    var stage : Int {
        if (level >= 5 && level < 14) {
            return 1
        }
        else if (level >= 14 && level < 21) {
            return 2
        }
        else if (level >= 21) {
            return 3
        }
        else {
            return 0
        }
    }
    var currSprite : String {
        return evoLine[stage]
    }
    
    
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
    
    mutating func setEXP(gainedEXP: Int) {
        if (gainedEXP >= maxEXP) {
            let exp = gainedEXP - maxEXP
            onLevelUp()
            setEXP(gainedEXP: exp)
        }
        else {
            EXP += gainedEXP
            if (EXP >= maxEXP) {
                setEXP(gainedEXP: EXP)
            }
        }
    }
    
    mutating func onLevelUp() {
        level += 1
        maxEXP += (maxEXP / 3)
        EXP = 0
    }
}
