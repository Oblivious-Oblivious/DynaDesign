//
//  Node.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

typealias NodeID = UUID;

struct Node: Identifiable {
    var id: NodeID = NodeID();
    var position: CGPoint = .zero;
}
