//
//  CGPoint+Helper.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension CGSize {
    func scaled_down_to(_ factor: CGFloat) -> CGSize {
        return CGSize(width: width / factor, height: height / factor);
    }
}
