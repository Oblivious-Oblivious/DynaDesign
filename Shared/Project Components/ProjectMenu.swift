//
//  ProjectMenu.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 21/12/21.
//

import SwiftUI

struct ProjectMenu: View {
    @Binding var zoom_scale: CGFloat;

    var back_button_width: CGFloat = 50;
    var settings_bar_width: CGFloat = 300;
    var menu_height: CGFloat = 50;

    var body: some View {
        GeometryReader { geo in
            ZStack {
                SettingsBar(
                    width: settings_bar_width,
                    height: menu_height,
                    zoom_scale: $zoom_scale
                )
                .offset(
                    x: geo.size.width / 2 - (self.settings_bar_width / 2),
                    y: 20
                )

                BackButton(
                    width: back_button_width,
                    height: menu_height
                )
                .offset(
                    x: geo.size.width - (self.settings_bar_width / 2) - self.back_button_width,
                    y: 20
                )
            }
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
