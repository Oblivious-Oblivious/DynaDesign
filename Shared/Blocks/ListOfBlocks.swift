//
//  ListOfBlocks.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct ListOfBlocks: View {
    @State var mesh: MeshController;

    var body: some View {
        ZStack {
            ForEach(mesh.blocks) { node in
                BlockView(
                    block_color: Color.indigo,
                    node: node
                )
                .offset(
                    x: node.position.x,
                    y: node.position.y
                )
            }
        }
    }
}

struct PaneMapView_Previews: PreviewProvider {
    static var previews: some View {
        return ListOfBlocks(mesh: MeshController())
    }
}
