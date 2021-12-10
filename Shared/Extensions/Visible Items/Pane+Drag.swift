//
//  Pane+Drag.swift.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension Pane {
    private func process_node_translation(_ translation: CGSize) {
        guard !self.selection.dragging_nodes.isEmpty else { return };
        let scaled_translation = translation.scaled_down_to(self.zoom_scale);
        
        mesh.process_node_translation(
            scaled_translation,
            nodes: self.selection.dragging_nodes
        );
    }

    func process_drag_change(_ value: DragGesture.Value, container_size: CGSize) {
        if !self.is_dragging {
            self.is_dragging = true;
            self.is_dragging_mesh = true;
        }
        
        if self.is_dragging_mesh {
            drag_offset = value.translation;
        }
        else {
            process_node_translation(value.translation);
        }
    }
    
    func process_drag_end(_ value: DragGesture.Value) {
        self.is_dragging = false;
        self.drag_offset = .zero;
        
        if self.is_dragging_mesh {
            portal_position = CGPoint(
                x: portal_position.x + value.translation.width,
                y: portal_position.y + value.translation.height
            );
        }
        else {
            process_node_translation(value.translation);
            self.selection.stop_dragging(mesh);
        }
    }
}
