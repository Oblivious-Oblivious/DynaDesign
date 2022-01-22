//
//  MeshController.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

class MeshController: ObservableObject {
    @Published var nodes: [NodeModel] = [];
    @Published var links: [LinkModel] = [];
    var edges: [EdgeModel] = [] {
        didSet {
            rebuild_links();
        }
    }
    
    func rebuild_links() {
        links = edges.compactMap { edge in
            let snode = nodes.filter({
                $0.id == edge.start;
            }).first;
            let enode = nodes.filter({
                $0.id == edge.end;
            }).first;
            
            let offset: CGFloat = 25;
            if let snode = snode, let enode = enode {
                return LinkModel(
                    id: edge.id,
                    start: snode.position.translated_by(x: 1.3 * offset + 0.1 * offset + 0.2 * offset, y: 0),
                    end: enode.position.translated_by(x: -1.3 * offset - 0.085 * offset, y: -1/3 * offset)
                );
            }
            return nil;
        }
    }
    
    func add_node(_ node: NodeModel) {
        nodes.append(node);
    }
    
    func connect(_ node1: NodeModel, to node2: NodeModel) {
        let new_edge = EdgeModel(start: node1.id, end: node2.id);
        let exists = edges.contains(where: { edge in
            return new_edge == edge;
        });
        
        guard exists == false else { return };
        
        edges.append(new_edge);
        rebuild_links();
    }
    
    }
}
