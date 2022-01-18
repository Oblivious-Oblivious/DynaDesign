//
//  ProjectMenu.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 21/12/21.
//

import SwiftUI

struct ProjectMenu: View {
    @EnvironmentObject var model_data: ModelData;
    @State var project: ProjectModel;

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width;
            let height = geo.size.height;
            let settings_bar_width = model_data.project_menu_options.settings_bar_width;
            let menu_height = model_data.project_menu_options.menu_height;
            let back_button_width = model_data.project_menu_options.back_button_width;
            let mod_button_size = model_data.project_menu_options.mod_button_size;
            let number_of_mod_buttons = model_data.project_menu_options.number_of_mod_buttons;

            SettingsBar(
                width: settings_bar_width,
                height: menu_height,
                zoom_scale: $model_data.projects_list.first(where: {
                    $0.id == project.id
                })!.zoom_scale
            )
            .offset(
                x: (width - settings_bar_width) / 2,
                y: menu_height / 2
            )

            BackButton(
                width: back_button_width,
                height: menu_height
            )
            .offset(
                x: get_back_button_position(width),
                y: menu_height / 2
            )

            ModifierButton(
                button_text: "Move Pane",
                size: mod_button_size
            ) {}
            .offset(
                x: get_modifier_position(width),
                y: 1 * (height / (number_of_mod_buttons + 1)) - (0.01 * mod_button_size * menu_height)
            )
            ModifierButton(
                button_text: "Connect",
                size: mod_button_size
            ) {}
            .offset(
                x: get_modifier_position(width),
                y: 2 * (height / (number_of_mod_buttons + 1)) - (0.01 * mod_button_size * menu_height)
            )
            ModifierButton(
                button_text: "Hover",
                size: mod_button_size
            ) {}
            .offset(
                x: get_modifier_position(width),
                y: 3 * (height / (number_of_mod_buttons + 1)) - (0.01 * mod_button_size * menu_height)
            )
        }
        .edgesIgnoringSafeArea(.all);
    }
}

struct ProjectMenu_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMenu(project: ProjectModel(mesh: MeshController.default))
            .environmentObject(ModelData());
    }
}
