//
//  ContentView.swift
//  Shared
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GridView();
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
