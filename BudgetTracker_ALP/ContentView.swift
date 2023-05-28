//
//  ContentView.swift
//  BudgetTracker_ALP
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
