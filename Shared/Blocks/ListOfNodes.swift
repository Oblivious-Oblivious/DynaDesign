//
//  ListOfNodes.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct ListOfNodes: View {
    @Binding var nodes: [NodeModel];
    @State var mesh: MeshController;

    var body: some View {
        ZStack {
            ForEach($nodes) { node in
                NodeView(
                    block_color: Color.indigo,
                    node: node,
                    mesh: mesh
                )
            }
        }
    }
}

struct ListOfNodes_Previews: PreviewProvider {
    static var previews: some View {
        ListOfNodes(
            nodes: .constant(MeshController.sample_mesh().nodes),
            mesh: MeshController.sample_mesh()
        )
    }
}
