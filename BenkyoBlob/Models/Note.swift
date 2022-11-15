//
//  Note.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/14/22.
//

import Foundation

struct Notes : Decodable {
    var notes : [Note]
}

struct Note : Identifiable, Decodable {
    var id : Int
    var content : String
}
