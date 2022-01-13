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
    
    func add_block(at point: CGPoint) {
        blocks.append(BlockModel(position: point));
    }
}
