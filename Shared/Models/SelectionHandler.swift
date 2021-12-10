//
//  SelectionHandler.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import Foundation
import CoreGraphics

class SelectionHandler: ObservableObject {
    @Published var dragging_nodes: [DragInfo] = [];
    @Published private(set) var selected_node_ids: [NodeID] = [];
    
    func select_node(_ node: Node) {
        self.selected_node_ids = [node.id];
    }
    
    func is_node_selected(_ node: Node) -> Bool {
        return self.selected_node_ids.contains(node.id);
    }
    
    func selected_nodes(in mesh: Mesh) -> [Node] {
        return self.selected_node_ids.compactMap {
            mesh.node_with_id($0);
        };
    }
    
    func only_selected_node(in mesh: Mesh) -> Node? {
        let curr_nodes = selected_nodes(in: mesh);
        
        if curr_nodes.count == 1 {
            return curr_nodes.first;
        }
        
        return nil;
    }
}

/* SelectionHandler+Dragging */
extension SelectionHandler {
    func start_dragging(_ mesh: Mesh) {
        self.dragging_nodes = selected_nodes(in: mesh).map {
            DragInfo(id: $0.id, original_position: $0.position);
        };
    }
    
    func stop_dragging(_ mesh: Mesh) {
        self.dragging_nodes = [];
    }
}
