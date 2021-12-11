//
//  SelectionHandler.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import Foundation
import CoreGraphics

/* SelectionHandler+Dragging */
class SelectionHandler: ObservableObject {
    @Published var dragging_nodes: [DragInfo] = [];
    @Published private(set) var selected_node_ids: [NodeID] = [];
    
    private func selected_nodes(in mesh: Mesh) -> [Node] {
        return self.selected_node_ids.compactMap {
            mesh.node_with_id($0);
        };
    }
    
    func start_dragging(_ mesh: Mesh) {
        self.dragging_nodes = selected_nodes(in: mesh).map {
            DragInfo(id: $0.id, original_position: $0.position);
        };
    }
    
    func stop_dragging(_ mesh: Mesh) {
        self.dragging_nodes = [];
    }
}
