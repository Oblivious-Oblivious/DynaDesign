//
//  Mesh+MathHelper.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import Foundation
import CoreGraphics

extension Mesh {
    /* Angle in radians */
    func point_with_center(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint {
        let deltax = radius * cos(angle);
        let deltay = radius * sin(angle);
        
        return CGPoint(x: center.x + deltax, y: center.y + deltay);
    }
}
