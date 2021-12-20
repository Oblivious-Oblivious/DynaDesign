//
//  Int+Radians.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension Int {
    var radians: CGFloat {
        CGFloat(self) * CGFloat.pi / 180.0;
    }
}
