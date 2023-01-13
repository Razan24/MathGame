//
//  Dividation.swift
//  MathGame
//
//  Created by Razan Aldossari on 16/06/1444 AH.
//

import SwiftUI

struct Dividation: View {
    @State private var correctA = 0
    @State private var choice : [Int] = [0, 1, 2, 3]
    @State private var firstnum = 0
    @State private var secondnum = 1
    @State private var difficulty = 80
    @State private var score = 0
    @State private var QN = 1
    var device = UIDevice.current.userInterfaceIdiom
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let local = Locale(identifier: "en")
    var body: some View {
        ZStack{
            Back()
        VStack{
            if device == .pad {
                HStack{
                    Text("\(firstnum)")
                        .font(.system(size: 150))
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Image(systemName: "divide")
                    .accessibilityLabel("Divided At")
                    .font(.system(size: 120))
                    .fontWeight(.bold)
                    .padding(.bottom,10)
                    Text("\(secondnum)")
                        .font(.system(size: 150))
                        .fontWeight(.bold)
                        .padding(.bottom)
                }.padding(.bottom,-20)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                    self.mode.wrappedValue.dismiss()
                }){
                    HStack{
                        Image("arr")
                            .resizable()
                            .frame(width: 50, height: 45)
                        Text("Back")
                    }
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                }
                    .padding(.top,50)
                )
                
            }else {
                HStack{
                    Text("\(firstnum)")
                        .font(.system(size: 90))
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Image(systemName: "divide")
                    .accessibilityLabel("Divided At")
                    .font(.system(size: 70))
                    .fontWeight(.bold)
                    .padding(.bottom,10)
                    Text("\(secondnum)")
                        .font(.system(size: 90))
                        .fontWeight(.bold)
                        .padding(.bottom)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                    self.mode.wrappedValue.dismiss()
                }){
                    HStack{
                        Image("arr")
                            .resizable()
                            .frame(width: 40, height: 35)
                        Text("Back")
                    }
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                }
                    .padding(.top,20)
                    .padding([.leading,.trailing])
                )
            }
            
            if device == .pad {
                HStack{
                    ForEach(0..<2) { index in
                        Button {
                            answerIsCorrect(answer: (choice[index]))
                            division()
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
                HStack{
                    ForEach(2..<4) { index in
                        Button {
                            answerIsCorrect(answer: (choice[index]))
                            division()
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
            }//if
            else if heightSizeClass == .compact && device == .phone {
                HStack(){
                    
                    ForEach(0..<4) { index in
                        Button {
                            answerIsCorrect(answer: (choice[index]))
                            division()
                            
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
                .padding(.top,-20)
                .padding(.bottom,-20)
            }//else if
            else if heightSizeClass == .regular && device == .phone {
                HStack(spacing: -10){
                    ForEach(0..<2) { index in
                        Button {
                            answerIsCorrect(answer: (choice[index]))
                            division()
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
                .padding(.bottom,-20)
                HStack(spacing: -10){
                    ForEach(2..<4) { index in
                        Button {
                            answerIsCorrect(answer: (choice[index]))
                            division()
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
            }
            
            if device == .pad {
                VStack(alignment: .leading,spacing: 10){
                    Text("Question: \(QN)")
                        .font(.system(size: 90))
                        .fontWeight(.bold)
                    Text("Score: \(score)")
                        .font(.system(size: 90))
                        .fontWeight(.bold)
                }
            }
            
            else if heightSizeClass == .compact && device == .phone{
                HStack(spacing: 100){
                    Text("Question: \(QN)")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                    Text("Score: \(score)")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                }
            }
            else{
                VStack(alignment: .leading,spacing: 30){
                    Text("Question: \(QN)")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                    Text("Score: \(score)")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        
                }
            }
        }//V
        .foregroundColor(.white)
            
        }
    }
    func answerIsCorrect(answer: Int){
        let isCorrect = answer == correctA ? true : false
        
        if isCorrect{
            self.score += 1
            self.QN += 1
        }
        else{self.QN += 1}
    }
    
        func division(){
            firstnum = Int.random(in: 0...(difficulty/2))
            secondnum = Int.random(in: 1...(difficulty/2))
            var answerList = [Int]()
    
            correctA = firstnum / secondnum
    
            for i in 0...2 {
                answerList.append(Int.random(in: 0...Int(difficulty)))
            }
    
            answerList.append(Int(correctA))
    
            choice = answerList.shuffled()
        }
    
}

struct Dividation_Previews: PreviewProvider {
    static var previews: some View {
        Dividation()
    }
}
