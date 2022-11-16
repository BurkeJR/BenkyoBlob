//
//  TheCalendarView.swift
//  BenkyoBlob
//
//  Created by John Burke on 11/15/22.
//

import SwiftUI

import SwiftUICalendar

struct TheCalendarView: View {
    
    @EnvironmentObject var VM: ViewModel
    
    @Binding var modeSelect: Int?
    
    @ObservedObject var controller: CalendarController = CalendarController(orientation: .vertical)
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Button {
                        modeSelect = nil
                    } label: {
                        Image("back-button-lrg")
                            .resizable()
                            .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                            .padding()
                    }.offset(x: geometry.size.width / -6)
                    
                    Text("\(controller.yearMonth.monthShortString), \(String(controller.yearMonth.year))")
                        .font(.custom("FFF Forward", size: geometry.size.height / 25))
                        .offset(x: geometry.size.width / -10)
                }
                
                HStack(alignment: .center, spacing: geometry.size.width / 11) {
                    Text("Sun")
                    Text("Mon")
                    Text("Tues")
                    Text("Thurs")
                    Text("Fri")
                    Text("Sat")
                }.font(.custom("FFF Forward", size: geometry.size.height / 55))
                
                CalendarView(controller) { date in
                    GeometryReader { geo in
                        ZStack(alignment: .center) {
                            if date.isToday {
                                Circle()
                                    .padding(4)
                                    .foregroundColor(Color(red: 1, green: 0, blue: 0.5))
                                Text("\(date.day)")
                                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                                    .font(.custom("FFF Forward", size: 12))
                                    .foregroundColor(.white)
                            } else {
                                Text("\(date.day)")
                                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                                    .font(.custom("FFF Forward", size: geo.size.height / 5))
                                    .foregroundColor(getColor(day: date))
                            }
                        }
                    }
                    
                }
            }
        }.navigationBarHidden(true)
    }
    
    func getColor(day: YearMonthDay) -> Color {
        if day.dayOfWeek.shortString == "Sun" {
            return .green
        }
        if day.dayOfWeek.shortString == "Sat" {
            return .blue
        }
        return .black
    }
}

struct TheCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        TheCalendarView(modeSelect: .constant(4))
            .environmentObject(ViewModel())
    }
}
