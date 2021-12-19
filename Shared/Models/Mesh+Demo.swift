//
//  Mesh+Demo.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension Mesh {
    static func sample_mesh() -> Mesh {
        let mesh = Mesh();

        [50, 100, 150].forEach { angle in
            mesh.add_node(at: CGPoint(x: angle, y: angle));
        }

        return mesh;
    }
}
