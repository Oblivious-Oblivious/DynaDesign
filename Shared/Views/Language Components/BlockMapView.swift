//
//  BlockMapView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct BlockMapView: View {
    @ObservedObject var selection: SelectionHandler;
    @Binding var nodes: [Node];

    var body: some View {
        ZStack {
            ForEach(nodes) { node in
                Block(
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

struct BlockMapView_Previews: PreviewProvider {
    static let node1 = Node(
        id: NodeID(),
        position: CGPoint(x: -100, y: -30)
    );
    static let node2 = Node(
        id: NodeID(),
        position: CGPoint(x: 100, y: 30)
    );
    @State static var nodes = [node1, node2];

    static var previews: some View {
        let selection = SelectionHandler();
        
        return BlockMapView(
            selection: selection,
            nodes: $nodes
        );
    }
}
