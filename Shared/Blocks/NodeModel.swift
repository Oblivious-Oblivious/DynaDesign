//
//  NodeModel.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

typealias NodeID = UUID;

struct NodeModel: Identifiable {
    var id: NodeID = NodeID();
    var position: CGPoint = .zero;
}
