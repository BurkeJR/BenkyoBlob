//
//  StudyTimeView.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/14/22.
//

import SwiftUI

enum mode {
    case running
    case stopped
}

class TimeManager: ObservableObject {
    var timer = Timer()
    
    @Published var status : mode = .stopped
    
    @Published var tenMilliseconds = 0
    
    init() {
        //start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.tenMilliseconds += 1
        }
    }
    
    func stop() {
        timer.invalidate()
    }
}

struct StudyTimeView: View {
    @ObservedObject var TM = TimeManager()
    @Binding var modeSelect : Int?
    var formattedString : String {
        let total_seconds = TM.tenMilliseconds / 100
        let hours = total_seconds / (60 * 60)
        let minutes = total_seconds / 60
        let seconds = total_seconds % 60
        
        return String(format: "%.2i:%.2i:%.2i", hours, minutes, seconds)
        
    }
    
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
                 }
                
                Text(formattedString)
                    .font(.custom("FFF Forward", size: geo.size.width / 15))
                    .offset(x: geo.size.width / 3.25)
                HStack {
                    Button {
                        if TM.status == .stopped {
                            TM.start()
                            TM.status = .running
                        }
                        else {
                            TM.stop()
                            TM.status = .stopped
                        }
                    } label: {
                        if (TM.status == .stopped) {
                            Image("play-button-lrg")
                                .resizable()
                                .frame(width:30, height:30)
                        }
                        else {
                            Image("pause-button-lrg")
                                .resizable()
                                .frame(width:30, height:30)
                        }
                        
                        
                        
                    }
                    Button {
                        TM.tenMilliseconds = 0
                    } label: {
                        Text("Reset")
                            .font(.custom("FFF Forward", size: 20))
                    }
                }
                .offset(x: geo.size.width / 3.25)
                
                Button {
                    modeSelect = nil
                } label: {
                    Image("done-lrg")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .offset(x: geo.size.width / 3.25)
            }.navigationBarHidden(true)
        }
    }
}

struct StudyTimeView_Previews: PreviewProvider {
    static var previews: some View {
        StudyTimeView(modeSelect: .constant(1))
    }
}
