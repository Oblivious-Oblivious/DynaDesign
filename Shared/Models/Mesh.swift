//
//  Mesh.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import Foundation
import CoreGraphics

class Mesh: ObservableObject {
    let root_node_id: NodeID;
    @Published var nodes: [Node] = [];
    
    private func replace(_ node: Node, with replacement: Node) {
        var new_set = self.nodes.filter {
            $0.id != node.id;
        };
        new_set.append(replacement);
        self.nodes = new_set;
    }
    
    private func position_node(_ node: Node, position: CGPoint) {
        var moved_node = node;
        moved_node.position = position;
        replace(node, with: moved_node);
    }
    
    init() {
        let root = Node();
        self.root_node_id = root.id;
        nodes.append(root);
    }
    
    func add_node(at point: CGPoint) {
        let node = Node(position: point);
        nodes.append(node);
    }
    
    func node_with_id(_ node_id: NodeID) -> Node? {
        return self.nodes.filter({
            $0.id == node_id;
        }).first;
    }

    func process_node_translation(_ translation: CGSize, nodes: [DragInfo]) {
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
