//
//  MeshController+Demo.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension MeshController {
    static func sample_mesh() -> MeshController {
        let mesh = MeshController();
        
//        4.times { pos in
//            mesh.add_node(at: CGPoint(x: (pos+1) * 50, y: (pos+1) * 50));
//        };
        
        let node1 = NodeModel(position: CGPoint(x: 0, y: -125));
        let node2 = NodeModel(position: CGPoint(x: -125, y: 125));
        let node3 = NodeModel(position: CGPoint(x: 125, y: 125));
        mesh.add_node(node1);
        mesh.add_node(node2);
        mesh.add_node(node3);

        mesh.connect(node1, to: node2);
        mesh.connect(node2, to: node3);

        return mesh;
    }
}
