//
//  SelectionController.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

class SelectionController: ObservableObject {
    @Published var dragging_blocks: [DragModel] = [];
    @Published private(set) var selected_block_ids: [BlockID] = [];
    
    private func selected_blocks(in mesh: MeshController) -> [BlockModel] {
        return self.selected_block_ids.compactMap {
            mesh.block_with_id($0);
        };
    }
    
    func start_dragging(_ mesh: MeshController) {
        self.dragging_blocks = selected_blocks(in: mesh).map {
            DragModel(id: $0.id, original_position: $0.position);
        };
    }
    
    func stop_dragging(_ mesh: MeshController) {
        self.dragging_blocks = [];
    }
}
