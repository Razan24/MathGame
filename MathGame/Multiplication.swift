//
//  Multiplication.swift
//  MathGame
//
//  Created by Razan Aldossari on 16/06/1444 AH.
//

import SwiftUI

struct Multiplication: View {
    
    @State private var correctA = 0
    @State private var choice : [Int] = [0, 1, 2, 3]
  
    @State private var firstnum = 0
    @State private var secondnum = 0
    @State private var difficulty = 60
    @State private var score = 0
    var device = UIDevice.current.userInterfaceIdiom
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    var di = Image(systemName: "multiply")
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Back()
        VStack{
            if device == .pad {
                HStack{
                    Text("\(firstnum)")
                        .font(.system(size: 170))
                        .fontWeight(.bold)
                        .padding(.bottom)
                    VStack(spacing: -30){
                        Text("Multiply")
                            .foregroundColor(Color("Back"))
                        Text("\(di)")
                            .font(.system(size: 140))
                            .fontWeight(.bold)
                            .padding(.bottom)
                        
                    }
                    Text("\(secondnum)")
                        .font(.system(size: 170))
                        .fontWeight(.bold)
                        .padding(.bottom)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                    self.mode.wrappedValue.dismiss()
                }){
                    HStack{
                        Image(systemName: "arrow.left")
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
                    VStack(spacing: -30){
                        Text("Multiply")
                            .foregroundColor(Color("Back"))
                        Text("\(di)")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding(.bottom,-1)
                        
                    }
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
                        Image(systemName: "arrow.left")
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
                            answerIsCorrect(answer: choice[index])
                            multi()
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
                HStack{
                    ForEach(2..<4) { index in
                        Button {
                            answerIsCorrect(answer: choice[index])
                            multi()
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
            }//if
            else if heightSizeClass == .compact && device == .phone {
                HStack{
                    ForEach(0..<4) { index in
                        Button {
                            answerIsCorrect(answer: choice[index])
                            multi()
                            
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
            }//else if
            else if heightSizeClass == .regular && device == .phone {
                HStack{
                    ForEach(0..<2) { index in
                        Button {
                            answerIsCorrect(answer: choice[index])
                            multi()
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
                HStack{
                    ForEach(2..<4) { index in
                        Button {
                            answerIsCorrect(answer: choice[index])
                            multi()
                        }//button
                    label: {
                        AnswerButton(number: choice[index])
                    }//label
                    }//for
                }//H
            }
            
            if device == .pad {
                Text("Score: \(score)")
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                
            }
            
            else{
                Text("Score: \(score)")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
            }
            
            
        }//V
        .foregroundColor(.white)
    }
    }
    func answerIsCorrect(answer: Int){
        let isCorrect = answer == correctA ? true : false
        
        if isCorrect{
            self.score += 1
        } else {
            self.score -= 1
        }
    }
        func multi(){
            firstnum = Int.random(in: 0...(difficulty/2))
            secondnum = Int.random(in: 0...(difficulty/2))
            var answerList = [Int]()
            
            correctA = firstnum * secondnum
            
            for i in 0...2 {
                answerList.append(Int.random(in: 0...difficulty))
            }
            
            answerList.append(correctA)
            
            choice = answerList.shuffled()
        }
}

struct Multiplication_Previews: PreviewProvider {
    static var previews: some View {
        Multiplication()
    }
}
