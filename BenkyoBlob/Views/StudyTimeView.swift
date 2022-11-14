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
    var formattedString : String {
        
        let total_seconds = TM.tenMilliseconds / 100
        let hours = total_seconds / (60 * 60)
        let minutes = total_seconds / 60
        let seconds = total_seconds % 60
        
        return String(format: "%.2i:%.2i:%.2i", hours, minutes, seconds)
        
    }
    
    var body: some View {
        VStack {
            
            
            Text(formattedString)
                .font(.custom("FFF Forward", size: 20))
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
            Button {
                
            } label: {
                Image("done-lrg")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }.navigationBarHidden(true)
    }
}

struct StudyTimeView_Previews: PreviewProvider {
    static var previews: some View {
        StudyTimeView()
    }
}
