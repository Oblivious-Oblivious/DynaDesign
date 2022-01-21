//
//  ProjectModel.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI

struct ProjectModel: Identifiable {
    var id = UUID();
    var pane: PaneModel = PaneModel();
    var zoom_scale: CGFloat = 1;
    
    var mesh: MeshController;
}
