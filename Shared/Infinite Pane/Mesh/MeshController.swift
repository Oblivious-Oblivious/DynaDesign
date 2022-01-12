//
//  MeshController.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

class MeshController: ObservableObject {
    @Published var blocks: [BlockModel] = [];
    
    static let `default` = MeshController.sample_mesh();
    
    private func replace(_ block: BlockModel, with replacement: BlockModel) {
        var new_set = self.blocks.filter {
            $0.id != block.id;
        };
        new_set.append(replacement);
        self.blocks = new_set;
    }
    
    private func position_block(_ block: BlockModel, position: CGPoint) {
        var moved_block = block;
        moved_block.position = position;
        replace(block, with: moved_block);
    }
    
    func add_block(at point: CGPoint) {
        blocks.append(BlockModel(position: point));
    }
    
    func block_with_id(_ block_id: BlockID) -> BlockModel? {
        return self.blocks.filter({
            $0.id == block_id;
        }).first;
    }

    func process_block_translation(_ translation: CGSize, blocks: [DragModel]) {
        blocks.forEach { draginfo in
            if let block = block_with_id(draginfo.id) {
                let next_position = draginfo.original_position
                    .translated_by(
                        x: translation.width,
                        y: translation.height
                    );
                position_block(block, position: next_position);
            }
        }
    }
}
