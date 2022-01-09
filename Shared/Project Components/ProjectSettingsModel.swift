//
//  ProjectSettingsModel.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 09/01/22.
//

import SwiftUI

struct ProjectSettingsModel {
    var back_button_width: CGFloat;
    var settings_bar_width: CGFloat;
    var menu_height: CGFloat;
    var mod_button_size: CGFloat;
    var number_of_mod_buttons: CGFloat;
    var zoom_scale: CGFloat;
    
    static let `default` = ProjectSettingsModel(
        back_button_width: 50,
        settings_bar_width: 300,
        menu_height: 50,
        mod_button_size: 130,
        number_of_mod_buttons: 3,
        zoom_scale: 1
    );
}
