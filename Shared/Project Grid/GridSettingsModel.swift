//
//  GridSettingsModel.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 09/01/22.
//

import SwiftUI

struct GridSettingsModel {
    var grid_spacing: CGFloat;
    var columns: [GridItem];
    
    static let `default` = GridSettingsModel(
        grid_spacing: 16,
        columns: Array(repeating: GridItem(), count: 4)
    );
}
