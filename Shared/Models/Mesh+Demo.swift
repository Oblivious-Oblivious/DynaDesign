//
//  Mesh+Demo.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import Foundation
import CoreGraphics

extension Mesh {
    static func sample_mesh() -> Mesh {
        let mesh = Mesh();

        [(150, "message1"),
         (90, "message2"),
         (30, "message3")].forEach { (angle, name) in
            let point = mesh.point_with_center(
                center: .zero,
                radius: 250,
                angle: angle.radians
            );
            mesh.add_child(mesh.root_node(), at: point);
        }
        
        return mesh;
    }
}
