//
//  Note.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/14/22.
//

import Foundation

struct AllNotes : Decodable {
    var notes : [Note]
    mutating func deleteNote(note: Note) {
        let id = note.id
        notes.remove(at: id)
        for i in (id..<notes.count) {
            notes[i].id -= 1
        }
    }
}

struct Note : Identifiable, Decodable {
    var id : Int
    var content : String
}
