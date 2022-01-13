//
//  Int+Times.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 13/01/22.
//

import SwiftUI

extension Int {
    func times(block: (Int) -> ()) {
        for index in 0..<self {
            block(index);
        }
    }
}
