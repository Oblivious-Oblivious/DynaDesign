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
    var position: CGPoint;
    
    /* Initially position mesh in the approximate center */
    init(position: CGPoint) {
        self.position = CGPoint(
            x: UIScreen.main.bounds.size.width * 0.5 + position.x,
            y: UIScreen.main.bounds.size.height * 0.5 + position.y
        );
    }
}
