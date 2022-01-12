//
//  ProjectModel.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI

struct ProjectModel: Identifiable {
    var id = UUID();
    var mesh: MeshController;
    
    static let `default` = ProjectModel.sample_list();
}
