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
        
        4.times { pos in
            mesh.add_node(at: CGPoint(x: (pos+1) * 50, y: (pos+1) * 50));
        };

        return mesh;
    }
}
