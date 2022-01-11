//
//  BlockModel.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

typealias BlockID = UUID;

struct BlockModel: Identifiable {
    var id: BlockID = BlockID();
    var position: CGPoint = .zero;
}
