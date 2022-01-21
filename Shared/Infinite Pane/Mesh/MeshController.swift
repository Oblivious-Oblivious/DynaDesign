//
//  MeshController.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

class MeshController: ObservableObject {
    @Published var nodes: [NodeModel] = [];
    
    func add_node(at point: CGPoint) {
        nodes.append(NodeModel(position: point));
    }
}
