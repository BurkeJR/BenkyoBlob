//
//  ExamDates.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 12/8/22.
//

import Foundation

struct AllExams : Decodable {
    var allExams : [ExamDate]
}

struct ExamDate : Identifiable, Decodable {
    var id : UUID
    var date : Date
    var title : String
    var dateStr : String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = .current
            dateFormatter.timeZone = .current
            dateFormatter.dateFormat = "MMM d, YYYY h:mm a"
            return dateFormatter.string(from: date)
        }
    }
}
