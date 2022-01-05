//
//  ProjectMenu.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 21/12/21.
//

import SwiftUI

struct ProjectMenu: View {
    @Binding var zoom_scale: CGFloat;

    @State private var back_button_width: CGFloat = 50;
    @State private var settings_bar_width: CGFloat = 300;
    @State private var menu_height: CGFloat = 50;
    @State private var mod_button_size: CGFloat = 125;
    @State private var number_of_mod_buttons: CGFloat = 3;

    var body: some View {
        GeometryReader { geo in
            SettingsBar(
                width: settings_bar_width,
                height: menu_height,
                zoom_scale: $zoom_scale
            )
            .offset(
                x: (geo.size.width - settings_bar_width) / 2,
                y: menu_height / 2
            )

            BackButton(
                width: back_button_width,
                height: menu_height
            )
            .offset(
                x: geo.size.width - back_button_width - (menu_height / 2),
                y: menu_height / 2
            )

            ModifierButton(
                button_text: "Move Pane",
                size: mod_button_size
            ) {}
            .offset(
                x: menu_height / 2,
                y: 1 * (geo.size.height / (number_of_mod_buttons + 1)) - (1.25 * menu_height)
            )
            ModifierButton(
                button_text: "Connect",
                size: mod_button_size
            ) {}
            .offset(
                x: menu_height / 2,
                y: 2 * (geo.size.height / (number_of_mod_buttons + 1)) - (1.25 * menu_height)
            )
            ModifierButton(
                button_text: "Hover",
                size: mod_button_size
            ) {}
            .offset(
                x: menu_height / 2,
                y: 3 * (geo.size.height / (number_of_mod_buttons + 1)) - (1.25 * menu_height)
            )
        }
        .edgesIgnoringSafeArea(.all);
    }
}

struct ProjectMenu_Previews: PreviewProvider {
    @State static var zoom_scale: CGFloat = 1;

    static var previews: some View {
        ProjectMenu(zoom_scale: $zoom_scale);
    }
}
