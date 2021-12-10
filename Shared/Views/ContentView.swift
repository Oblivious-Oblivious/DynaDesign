//
//  ContentView.swift
//  Shared
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let mesh = Mesh.sample_mesh();
        let selection = SelectionHandler();
        
        Pane(
            mesh: mesh,
            selection: selection,
            pane_color: Color("PaneColor")
        )
        .onAppear() {
            /* Remove all scroll indicators */
            UITableView.appearance().showsVerticalScrollIndicator = false;
            UITableView.appearance().showsHorizontalScrollIndicator = false;
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
