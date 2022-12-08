//
//  QuizView.swift
//  BenkyoBlob
//
//  Created by John Burke on 11/14/22.
//

import SwiftUI



struct QuizView: View {
    
    var quiz: Quiz
    
    @State var quesitonIndex = 0
    @State var showNextQuestion = false
    
    @Binding var selectedQuiz: Int?
    
    var body: some View {
        let question = quiz.questions[quesitonIndex]
        GeometryReader { geo in
            VStack {
                Button {
                    selectedQuiz = nil
                } label: {
                    Image("back-button-lrg")
                        .resizable()
                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                        .padding()
                }.offset(x: geo.size.width / -3.25)
                
                Text("Question \(quesitonIndex + 1)")
                    .font(.custom("FFF Forward", size: geo.size.height / 15))
                
                Text(question.question)
                    .font(.custom("FFF Forward", size: geo.size.height / 25))
                
                ForEach(Array(zip(question.choices.indices, question.choices)), id: \.1) { index, choice in
                    Button {
                        if question.answer == index {
                            showNextQuestion = true
                        }
                    } label: {
                        ZStack {
                            Image("flashcard-lrg")
                                .resizable()
                                .frame(width: geo.size.width / 1.5, height: geo.size.height / 8)
                            Text(choice)
                                .font(.custom("FFF Forward", size: geo.size.height / 30))
                        }
                    }
                }
                
                if showNextQuestion {
                    Button {
                        if quesitonIndex < quiz.questions.count - 1 {
                            quesitonIndex += 1
                            showNextQuestion = false
                        } else {
                            selectedQuiz = nil
                        }
                    } label: {
                        ZStack {
                            Image("flashcard-lrg")
                                .resizable()
                                .frame(width: geo.size.width / 1.5, height: geo.size.height / 8)
                            if quesitonIndex < quiz.questions.count - 1 {
                                Text("Next Question")
                                    .font(.custom("FFF Forward", size: geo.size.height / 30))
                            } else {
                                Text("Finish")
                                    .font(.custom("FFF Forward", size: geo.size.height / 30))
                            }
                            
                        }
                    }
                }
                
            }.offset(x: geo.size.width / 10)
        }.navigationBarHidden(true)
    }
}

struct QuizesView: View {
    
    @EnvironmentObject var VM: ViewModel
    
    @Binding var modeSelect: Int?
    
    @State var selectedQuiz: Int?
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    Button {
                        modeSelect = nil
                    } label: {
                        Image("back-button-lrg")
                            .resizable()
                            .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            .padding()
                    }.offset(x: geo.size.width / -3.25)
                    ScrollView {
                        ForEach(VM.quizes) { quiz in
                            NavigationLink(tag: quiz.id, selection: $selectedQuiz) {
                                QuizView(quiz: quiz, selectedQuiz: $selectedQuiz)
                            } label: {
                                ZStack {
                                    Image("flashcard-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 8)
                                    Text(quiz.name)
                                        .font(.custom("FFF Forward", size: geo.size.height / 30))
                                }
                            }
                        }
                    }
                }.navigationBarHidden(true)
            }
        }.navigationBarHidden(true)
    }
}

struct QuizViewes_Previews: PreviewProvider {
    static var previews: some View {
        QuizesView(modeSelect: .constant(2))
            .environmentObject(ViewModel())
    }
}

//struct QuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizView(quiz: ViewModel().quizes[0])
//    }
//}
