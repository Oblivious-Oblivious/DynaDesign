//
//  Mesh+Editing.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension Mesh {
    private func position_node(_ node: Node, position: CGPoint) {
        var moved_node = node;
        moved_node.position = position;
        replace(node, with: moved_node);
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
