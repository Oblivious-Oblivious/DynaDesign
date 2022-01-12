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

        [0, 50, 100, 150].forEach { pos in
            mesh.add_block(at: CGPoint(x: pos, y: pos));
        }

        return mesh;
    }
}
