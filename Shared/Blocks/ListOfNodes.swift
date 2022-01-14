//
//  ListOfNodes.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct ListOfNodes: View {
    @Binding var nodes: [NodeModel];

    var body: some View {
        ZStack {
            ForEach(nodes) { node in
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
        return ListOfNodes(nodes: .constant(MeshController.default.nodes))
    }
}
