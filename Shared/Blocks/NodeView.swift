//
//  NodeView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct NodeView: View {
    var block_color: Color;
    @Binding var node: NodeModel;
    @State var mesh: MeshController;

    @State var animate = false;

    var body: some View {
        NandGate(size: 50, color: self.block_color)
            .scaleEffect(scale_amount())
            .opacity(opacity_amount())
            .position(node.position)
            .gesture(drag_gesture_animation());
    }
}

struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(
            block_color: Color.blue,
            node: .constant(NodeModel(position: .zero)),
            mesh: MeshController.sample_mesh()
        );
    }
}
