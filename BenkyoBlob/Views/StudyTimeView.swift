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
    @State var editNotes : Bool = false
    @Binding var modeSelect : Int?
    @State var outsideStudyHours : Int = 0
    @State var unnamedNoteNumber = 0
    @EnvironmentObject var VM : ViewModel
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
                HStack {
                    Button {
                        modeSelect = nil
                    } label: {
                        Image("back-button-lrg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                    }
                    Spacer()
                    Button {
                        editNotes = !editNotes
                    } label: {
                        Image("edit-lrg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                    }
                }
                
                Text(formattedString)
                    .font(.custom("FFF Forward", size: geo.size.width / 15))
                //.offset(x: geo.size.width / 3.25)
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
                            .font(.custom("FFF Forward", size: geo.size.height / 50))
                    }
                }
                //.offset(x: geo.size.width / 3.25)
                
                HStack {
                    Button {
                        VM.pet.setEXP(gainedEXP: (((TM.tenMilliseconds / 100) / (60 * 60)) * 20) + outsideStudyHours * 20)
                        for _ in (0..<((TM.tenMilliseconds / 100) / (60 * 60) + outsideStudyHours) * 2) {
                            if (VM.pet.happiness < VM.pet.maxHappiness) {
                                VM.pet.happiness += 1
                            }
                        }
                        modeSelect = nil
                    } label: {
                        Image("done-lrg")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                    }
                    Button {
                        VM.allNotes.notes.append(Note(id: VM.allNotes.notes.count, content:"Note \(unnamedNoteNumber)"))
                        unnamedNoteNumber += 1
                    } label: {
                        ZStack {
                            Image("note-lrg")
                                .resizable()
                                .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            Image("add-icon-lrg")
                                .resizable()
                                .frame(width: geo.size.width / 20, height: geo.size.width / 20)
                                .offset(x: geo.size.width / 25, y: geo.size.height / 50)
                        }
                        
                    }
                    
                }
                
                Text("Extra Hours Studied:")
                    .font(.custom("FFF Forward", size: 20))
                HStack {
                    Button {
                        outsideStudyHours -= 1
                    } label: {
                        Image("delete-icon-lrg")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                    }
                    Text("\(outsideStudyHours)")
                        .font(.custom("FFF Forward", size: 20))
                    Button {
                        outsideStudyHours += 1
                    } label: {
                        Image("add-icon-lrg")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                        
                    }
                    
                }
                
                Text("EXP: \((((TM.tenMilliseconds / 100) / (60 * 60)) * 20) + outsideStudyHours * 20)")
                    .font(.custom("FFF Forward", size: 20))
                
                
                
                ScrollView {
                    VStack {
                        ForEach(VM.allNotes.notes) { note in
                            ZStack {
                                Image("note-lrg")
                                    .resizable()
                                    .frame(width: geo.size.width / 2, height: geo.size.width / 2)
                                if (!editNotes) {
                                    Text(note.content)
                                        .frame(width: geo.size.width / 2.5, height: geo.size.width / 2.5)
                                        .font(.custom("FFF Forward", size: geo.size.width / 30))
                                }
                                else {
                                    FieldView(name: Binding<String>(get: {
                                        note.content
                                    }, set: { newValue in
                                        VM.allNotes.notes[note.id].content = newValue
                                    }))
                                    .frame(width: geo.size.width / 2.5)
                                    if (editNotes) {
                                        Button {
                                            VM.allNotes.deleteNote(note: note)
                                        } label: {
                                            Image("delete-icon-lrg")
                                                .resizable()
                                                .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                        }
                                        .offset(x: geo.size.width / 3)
                                    }
                                }
                                
                                
                                
                            }
                            .padding(geo.size.width / 7.5)
                            
                        }
                    }
                }
                
                
                //.offset(x: geo.size.width / 3.25)
            }.navigationBarHidden(true)
        }
    }
}

struct StudyTimeView_Previews: PreviewProvider {
    static var previews: some View {
        StudyTimeView(modeSelect: .constant(1))
            .environmentObject(ViewModel())
    }
}
