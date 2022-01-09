//
//  ProjectMenu+Position.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 09/01/22.
//

import SwiftUI;

extension ProjectMenu {
    func get_modifier_position(_ width: CGFloat) -> CGFloat {
        return model_data.user_options.is_left_handed
            ? width - model_data.project_menu_options.mod_button_size - (model_data.project_menu_options.menu_height / 2)
            : model_data.project_menu_options.menu_height / 2;
    }
    
    func get_back_button_position(_ width: CGFloat) -> CGFloat {
        return model_data.user_options.is_left_handed
            ? model_data.project_menu_options.menu_height / 2
            : width - model_data.project_menu_options.back_button_width - (model_data.project_menu_options.menu_height / 2);
    }
}
