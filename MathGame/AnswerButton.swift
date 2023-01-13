//
//  AnswerButton.swift
//  RTLandLTR
//
//  Created by Razan Aldossari on 12/06/1444 AH.
//

import SwiftUI

struct AnswerButton: View {
    var number : Int
    var device = UIDevice.current.userInterfaceIdiom
    var body: some View {
        if device == .pad {
            Text("\(number)")
                .frame(width: 260, height: 260)
                .font(.system(size: 140))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(Color("Button"))
                .cornerRadius(15)
                .padding()
        }
        else{
            Text("\(number)")
                .frame(width: 150, height: 150)
                .font(.system(size: 70))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(Color("Button"))
                .cornerRadius(15)
                .padding()
        }
    }
    
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(number: 100)
    }
}
