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
    
    init() {
        let root = Node();
        self.root_node_id = root.id;
        add_node(root);
    }
}

extension Mesh {
    func root_node() -> Node {
        guard let root = self.nodes.filter({
            $0.id == self.root_node_id
        }).first else {
            fatalError("mesh is invalid - no root");
        };

        return root;
    }
    
    func node_with_id(_ node_id: NodeID) -> Node? {
        return self.nodes.filter({
            $0.id == node_id;
        }).first;
    }
    
    func replace(_ node: Node, with replacement: Node) {
        var new_set = self.nodes.filter {
            $0.id != node.id;
        };
        new_set.append(replacement);
        self.nodes = new_set;
    }
}
