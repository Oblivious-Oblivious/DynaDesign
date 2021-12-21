//
//  MeshController.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

class MeshController: ObservableObject {
    @Published var nodes: [NodeModel] = [];
    
    private func replace(_ node: NodeModel, with replacement: NodeModel) {
        var new_set = self.nodes.filter {
            $0.id != node.id;
        };
        new_set.append(replacement);
        self.nodes = new_set;
    }
    
    private func position_node(_ node: NodeModel, position: CGPoint) {
        var moved_node = node;
        moved_node.position = position;
        replace(node, with: moved_node);
    }
    
    func add_node(at point: CGPoint) {
        let node = NodeModel(position: point);
        nodes.append(node);
    }
    
    func node_with_id(_ node_id: NodeID) -> NodeModel? {
        return self.nodes.filter({
            $0.id == node_id;
        }).first;
    }

    func process_node_translation(_ translation: CGSize, nodes: [DragModel]) {
        nodes.forEach { draginfo in
            if let node = node_with_id(draginfo.id) {
                let next_position = draginfo.original_position
                    .translated_by(
                        x: translation.width,
                        y: translation.height
                    );
                position_node(node, position: next_position);
            }
        }
    }
}
