//
//  EdgeModel.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 13/01/22.
//

import SwiftUI

typealias EdgeID = UUID;

struct EdgeModel: Identifiable {
    var id = EdgeID();
    var start: NodeID;
    var end: NodeID;
    
    static func ==(lhs: EdgeModel, rhs: EdgeModel) -> Bool {
        return lhs.start == rhs.start && lhs.end == rhs.end;
    }
}

struct LinkModel: Identifiable {
    var id = EdgeID();
    var start: CGPoint;
    var end: CGPoint;
}
