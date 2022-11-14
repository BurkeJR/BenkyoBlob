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
    
    var body: some View {
        let question = quiz.questions[quesitonIndex]
        VStack {
            Text("Question \(quesitonIndex + 1)")
                .font(.largeTitle)
            
            Text(question.question)
                .font(.title)
            ForEach(question.choices, id: \.self) { choice in
                Button {
                    showNextQuestion = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 100, height: 30)
                            .foregroundColor(.white)
                            .shadow(radius: 20)
                            .padding(.vertical, 5)
                        Text(choice)
                            .foregroundColor(.black)
                    }
                }
            }
            
            if showNextQuestion {
                Button {
                    quesitonIndex += 1
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 280, height: 30)
                        .foregroundColor(.green)
                        .shadow(radius: 20)
                        .padding(.vertical, 5)
                    Text("Next Question")
                        .foregroundColor(.black)
                }
            }
            
        }
    }
}

struct QuizesView: View {
    
    @EnvironmentObject var VM: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(VM.quizes) { quiz in
                        NavigationLink {
                            QuizView(quiz: quiz)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 280, height: 30)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                                    .padding()
                                Text(quiz.name)
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }.navigationTitle("Quizes")
        }
    }
}

struct QuizViewes_Previews: PreviewProvider {
    static var previews: some View {
        QuizesView()
            .environmentObject(ViewModel())
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quiz: ViewModel().quizes[0])
    }
}
