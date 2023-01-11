//
//  DepartmentButton.swift
//  MathGame
//
//  Created by Razan Aldossari on 17/06/1444 AH.
//

import SwiftUI

struct DepartmentButton: View {
    var di : Image
   
    var de : String
    var device = UIDevice.current.userInterfaceIdiom
    var body: some View {
        if device == .pad {
            VStack{
            Text("\(di)")
                .font(.system(size: 90))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,25)
            Text("\(de)")
                .foregroundColor(Color("Button"))
        }
            .frame(width: 250, height: 250)
            .background(Color("Button"))
            .cornerRadius(15)
        }
        else{
            VStack{
                Text("\(di)")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top,25)
                Text("\(de)")
                    .foregroundColor(Color("Button"))
            }
            .frame(width: 150, height: 150)
            .background(Color("Button"))
            .cornerRadius(15)
        }
    }
}

struct DepartmentButton_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentButton(di: Image(systemName: "divide"), de: "Addition")
    }
}
