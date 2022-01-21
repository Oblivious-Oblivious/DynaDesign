//
//  CGPoint+Helper.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 14/01/22.
//

import CoreGraphics

extension CGPoint {
    func translated_by(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y);
    }
}
