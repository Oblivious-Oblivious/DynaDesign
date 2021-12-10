//
//  Mesh+Addition.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension Mesh {
    func add_node(_ node: Node) {
        nodes.append(node);
    }
    
    @discardableResult func add_child(_ parent: Node, at point: CGPoint? = nil) -> Node {
        let target = point ?? parent.position;
        let child = Node(position: target);

        add_node(child);
        
        return child;
    }
}
