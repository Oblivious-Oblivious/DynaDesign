//
//  MeshController.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

class MeshController: ObservableObject {
    @Published var nodes: [NodeModel] = [];

    static let `default` = MeshController.sample_mesh();
    
    func add_node(at point: CGPoint) {
        nodes.append(NodeModel(position: point));
    }
}
