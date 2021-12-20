//
//  BlockMapView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct PaneMapView: View {
    @ObservedObject var selection: SelectionController;
    @Binding var nodes: [NodeModel];

    var body: some View {
        ZStack {
            ForEach(nodes) { node in
                BlockView(
                    block_color: Color.indigo,
                    node: node,
                    selection: selection
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
    static let node1 = NodeModel(
        id: NodeID(),
        position: CGPoint(x: -100, y: -30)
    );
    static let node2 = NodeModel(
        id: NodeID(),
        position: CGPoint(x: 100, y: 30)
    );
    @State static var nodes = [node1, node2];

    static var previews: some View {
        let selection = SelectionController();
        
        return PaneMapView(
            selection: selection,
            nodes: $nodes
        );
    }
}
