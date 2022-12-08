//
//  QuizView.swift
//  BenkyoBlob
//
//  Created by John Burke on 11/14/22.
//

import SwiftUI

struct EditQuizView: View {
    var quiz: Quiz
    
    @EnvironmentObject var VM: ViewModel
    
    @Binding var selectedQuiz: Int?
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                // back button
                Button {
                    selectedQuiz = nil
                } label: {
                    Image("back-button-lrg")
                        .resizable()
                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                        .padding()
                }
                
                // quiz name
                Text("Quiz Name:")
                    .padding(.horizontal)
                FieldView(name: Binding<String>(get: {
                    quiz.name
                }, set: { newValue in
                    VM.quizes[quiz.id].name = newValue
                }))
                .padding(.horizontal)
                
                
                // add question
                List {
                    ForEach(quiz.questions) { question in
                        
                        HStack {
                            // question label
                            Text("Question:")
                            // remove question button
                            Button {
                                // remove question
                                VM.quizes[quiz.id].removeQuestion(question: question)
                            } label: {
                                Image("delete-icon-lrg")
                                    .resizable()
                                    .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            }.offset(x: geo.size.width / 2.2)
                        }
                        // edit question
                        FieldView(name: Binding<String>(get: {
                            question.question
                        }, set: { newValue in
                            VM.quizes[quiz.id].questions[question.index].question = newValue
                        }))
                        
                        HStack {
                            // answers label
                            Text("Answers:")
                            // add answer button
                            Button {
                                VM.quizes[quiz.id].questions[question.index].choices.append("New Answer")
                            } label: {
                                Image("add-icon-lrg")
                                    .resizable()
                                    .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                            }.offset(x: geo.size.width / 2.2)
                        }.padding(.top)
                        
                        // edit answers
                        ForEach(Array(zip(question.choices.indices, question.choices)), id: \.1) { index, choice in
                            HStack {
                                // answer edit box
                                FieldView(name: Binding<String>(get: {
                                    choice
                                }, set: { newValue in
                                    VM.quizes[quiz.id].questions[question.index].choices[index] = newValue
                                }))
                                // answer remove button
                                Button {
                                    // remove answer
                                    VM.quizes[quiz.id].questions[question.index].choices.remove(at: index)
                                } label: {
                                    Image("delete-icon-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                }
                            }
                        }
                        
                        // correct answer
                        Text("Correct Answer (the number it is in the list of choices)")
                            .padding(.top)
                        FieldView(name: Binding<String>(get: {
                            String(question.answer)
                        }, set: { newValue in
                            VM.quizes[quiz.id].questions[question.index].answer = Int(newValue) ?? 0
                        }))
                        
                        Divider()
                            .frame(height: 4)
                            .overlay(.pink)
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}

struct QuizView: View {
    
    var quiz: Quiz
    
    @State var quesitonIndex = 0
    @State var showNextQuestion = false
    
    @Binding var selectedQuiz: Int?
    
    var body: some View {
        let question = quiz.questions[quesitonIndex]
        GeometryReader { geo in
            VStack {
                // back button
                Button {
                    selectedQuiz = nil
                } label: {
                    Image("back-button-lrg")
                        .resizable()
                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                        .padding()
                }.offset(x: geo.size.width / -2.5)
                
                // question number
                Text("Question \(quesitonIndex + 1)")
                    .font(.custom("FFF Forward", size: geo.size.height / 15))
                
                // question
                Text(question.question)
                    .font(.custom("FFF Forward", size: geo.size.height / 25))
                
                // list of choices
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
                
                // if the question was answered correctly, display button that goes to next question or ends the quiz
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
    @State var renameQuizMode: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    Text("")
                        .frame(width: geo.size.width / 6, height: geo.size.width / 6)
                        .toolbar {
                            ToolbarItem(placement: .navigation) {
                                Button {
                                    modeSelect = nil
                                } label: {
                                    Image("back-button-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            ToolbarItem(placement: .primaryAction) {
                                Button {
                                    renameQuizMode = !renameQuizMode
                                } label: {
                                    Image("edit-lrg")
                                        .resizable()
                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            
                        }
                    
                    ScrollView {
                        ForEach(VM.quizes) { quiz in
                            ZStack {
                                NavigationLink(tag: quiz.id, selection: $selectedQuiz) {
                                    if (renameQuizMode) {
                                        EditQuizView(quiz: quiz, selectedQuiz: $selectedQuiz)
                                    } else {
                                        QuizView(quiz: quiz, selectedQuiz: $selectedQuiz)
                                    }
                                } label: {
                                    ZStack {
                                        Image("flashcard-lrg")
                                            .resizable()
                                            .frame(width: geo.size.width / 1.5, height: geo.size.height / 8)
                                        HStack {
                                            if renameQuizMode {
                                                Image("edit-lrg")
                                                        .resizable()
                                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                            }
                                            Text(quiz.name)
                                                .font(.custom("FFF Forward", size: geo.size.height / 30))
                                            if renameQuizMode {
                                                Button {
                                                    // remove quiz
                                                    let id = quiz.id
                                                    VM.quizes.remove(at: quiz.id)
                                                    for i in (id..<VM.quizes.count) {
                                                        VM.quizes[i].id -= 1
                                                    }
                                                } label: {
                                                    Image("delete-icon-lrg")
                                                        .resizable()
                                                        .frame(width: geo.size.width / 10, height: geo.size.width / 10)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }.offset(y: -geo.size.height / 10)
                    
                    Button {
                        var questions = [Question]()
                        questions.append(Question(id: UUID(), index: 0, question: "Question", choices: ["Choice 1"], answer: 0))
                        
                        var newQuizId = 0
                        if VM.quizes.count > 0 {
                            newQuizId = VM.quizes[VM.quizes.count - 1].id + 1
                        }
                        
                        let newQuiz = Quiz(id: newQuizId, name: "New Quiz \(VM.quizes.count + 1)", questions: questions)
                        VM.quizes.append(newQuiz)
                        
                    } label: {
                        ZStack {
                            Image("add-icon-lrg")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                        }
                    }
                    
                    .offset(x: geo.size.width / 4, y: -geo.size.height / 10)
                }
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
