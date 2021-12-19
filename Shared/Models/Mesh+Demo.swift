//
//  Mesh+Demo.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import Foundation
import CoreGraphics

extension Mesh {
    /* Angle in radians */
    private func point_with_center(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint {
        let deltax = radius * cos(angle);
        let deltay = radius * sin(angle);
        
        return CGPoint(x: center.x + deltax, y: center.y + deltay);
    }

    static func sample_mesh() -> Mesh {
        let mesh = Mesh();

        [150, 90, 30].forEach { angle in
            let point = mesh.point_with_center(
                center: .zero,
                radius: 250,
                angle: angle.radians
            );
            mesh.add_node(at: point);
        }
        
        return mesh;
    }
}
