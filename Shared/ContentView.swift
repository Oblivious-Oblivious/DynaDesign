//
//  ContentView.swift
//  Shared
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let mesh = MeshController.sample_mesh();
        let selection = SelectionController();
        
        PaneView(
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
