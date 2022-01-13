//
//  ModelData.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 08/01/22.
//

import SwiftUI

final class ModelData: ObservableObject {
    var projects_list: [ProjectModel] = ProjectModel.default;
    
    @Published var grid_options = GridSettingsModel.default;
    @Published var project_menu_options = ProjectSettingsModel.default;
    @Published var user_options = SettingsModel.default;
    
    /// TODO -> Use independent meshes for each project
    @ObservedObject var mesh = MeshController.default;
}
