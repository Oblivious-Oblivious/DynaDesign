//
//  ListOfNodes.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct ListOfNodes: View {
    @State var mesh: MeshController;

    var body: some View {
        ZStack {
            ForEach(mesh.nodes) { node in
                NodeView(
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

struct ListOfNodes_Previews: PreviewProvider {
    static var previews: some View {
        return ListOfNodes(mesh: MeshController.default)
    }
}
