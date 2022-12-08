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
        GeometryReader { geo in
            VStack {
                DatePicker("Select Date", selection: $selectedDate)
                    .padding()
                    .datePickerStyle(.graphical)
                    .font(.custom("FFF Forward", size: 1))
            }
        }
    }
}

struct TheCalendarView: View {
    
    @EnvironmentObject var VM: ViewModel
    
    @Binding var modeSelect: Int?
    
    @State var selectedDate: Date = Date()
    
    @State var currentExamDate : ExamDate?
    
    @State var selectedID : UUID?
    
    @State var showDate : Bool = false
    
    @State var editDates : Bool = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Button {
                        modeSelect = nil
                    } label: {
                        Image("back-button-lrg")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                        
                    }
                    Spacer()
                    Button {
                        editDates = !editDates
                        showDate = false
                    } label: {
                        Image("edit-lrg")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                    }
                }
                List {
                    ForEach (VM.allExams.allExams) { exam in
                        VStack {
                            HStack {
                                Text("\(exam.title)")
                                    .font(.custom("FFF Forward", size: geo.size.width / 25))
                                Spacer()
                                Button {
                                    if (!showDate || (showDate && selectedID != exam.id)) {
                                        selectedDate = exam.date
                                        currentExamDate = exam
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
                        }
                    }
                    .onDelete { indexSet in
                        showDate = false
                        VM.allExams.allExams.remove(atOffsets: indexSet)
                    }
                    if (showDate) {
                        Text(currentExamDate!.title)
                            .font(.custom("FFF Forward", size: geo.size.width / 20))
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                            .padding(.horizontal)
                            .datePickerStyle(.graphical)
                            .font(.custom("FFF Forward", size: 1))
                        Button {
                            for i in (0..<VM.allExams.allExams.count) {
                                if (VM.allExams.allExams[i].id == selectedID) {
                                    VM.allExams.allExams[i].date = selectedDate
                                }
                            }
                        } label: {
                            Image("done-lrg")
                                .resizable()
                                .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                        }
                    }
                }
                if (editDates) {
                    Button {
                        var newDate = ExamDate(id: UUID(), date: Date(), title: "Exam")
                        VM.allExams.allExams.append(newDate)
                        
                    } label: {
                        Image("add-icon-lrg")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: geo.size.width / 4, height: geo.size.width / 4)
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
