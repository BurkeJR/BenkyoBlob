//
//  TheCalendarView.swift
//  BenkyoBlob
//
//  Created by John Burke on 11/15/22.
//

import SwiftUI


struct TheCalendarView: View {
    
    @EnvironmentObject var VM: ViewModel
    
    @Binding var modeSelect: Int?
    
    @State var selectedDate: Date = Date()
    
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
                
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .padding(.horizontal)
                    .datePickerStyle(.graphical)
                    .font(.custom("FFF Forward", size: 1))
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
