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

        [50, 100, 150].forEach { angle in
            mesh.add_node(at: CGPoint(x: angle, y: angle));
        }

        return mesh;
    }
}
