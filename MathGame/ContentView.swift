//
//  ContentView.swift
//  MathGame
//
//  Created by Razan Aldossari on 16/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            Department()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, Locale(identifier: "en"))
            .environment(\.locale, Locale(identifier: "ar"))
    }
}
