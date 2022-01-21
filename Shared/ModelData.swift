//
//  ModelData.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 08/01/22.
//

import SwiftUI

final class ModelData: ObservableObject {
    @Published var projects_list: [ProjectModel] = ProjectModel.sample_list();
    
    @Published var grid_options = GridSettingsModel(
        grid_spacing: 16,
        columns: Array(repeating: GridItem(), count: 4)
    );
    @Published var project_menu_options = ProjectSettingsModel(
        back_button_width: 50,
        settings_bar_width: 300,
        menu_height: 50,
        mod_button_size: 130,
        number_of_mod_buttons: 3
    );
    @Published var user_options = SettingsModel(
        username: "@user",
        is_left_handed: false
    );
}
