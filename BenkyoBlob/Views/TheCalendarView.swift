//
//  TheCalendarView.swift
//  BenkyoBlob
//
//  Created by John Burke on 11/15/22.
//

import SwiftUI

struct datePick : View {
    @State var selectedDate : Date
    var body : some View {
        DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
            .padding(.horizontal)
            .datePickerStyle(.graphical)
            .font(.custom("FFF Forward", size: 1))
    }
}

struct TheCalendarView: View {
    
    @EnvironmentObject var VM: ViewModel
    
    @Binding var modeSelect: Int?
    
    @State var selectedDate: Date = Date()
    
    @State var currentExamDate : ExamDate?
    
    @State var selectedID : UUID?
    
    @State var showDate : Bool = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Button {
                    modeSelect = nil
                } label: {
                    Image("back-button-lrg")
                        .resizable()
                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                        .padding()
                }.offset(x: geo.size.width / -2.5)
                List(VM.allExams.allExams) { exam in
                    VStack {
                        HStack {
                            Text("\(exam.title)")
                                .font(.custom("FFF Forward", size: geo.size.width / 25))
                            
                            Button {
                                if (showDate && selectedID != exam.id) {
                                    selectedID = exam.id
                                    showDate = true
                                }
                                else {
                                    showDate = false
                                }
                            } label: {
                                Text("\(exam.dateStr)")
                                    .font(.custom("FFF Forward", size: geo.size.width / 30))
                            }
                            
                            
                        }
                        if (showDate && selectedID == exam.id) {
                            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                                .padding(.horizontal)
                                .datePickerStyle(.graphical)
                                .font(.custom("FFF Forward", size: 1))
                        }
                    }
                }
                
            }
        }.navigationBarHidden(true)
    }
}

struct TheCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        TheCalendarView(modeSelect: .constant(4))
            .environmentObject(ViewModel())
    }
}
