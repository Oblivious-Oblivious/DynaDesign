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
    var mod_button_size: CGFloat = 125;

    var body: some View {
        GeometryReader { geo in
            ZStack {
                SettingsBar(
                    width: settings_bar_width,
                    height: menu_height,
                    zoom_scale: $zoom_scale
                )
                .offset(
                    x: (geo.size.width - self.settings_bar_width) / 2,
                    y: -15
                )

                BackButton(
                    width: back_button_width,
                    height: menu_height
                )
                .offset(
                    x: geo.size.width - (self.settings_bar_width / 2) - self.back_button_width,
                    y: -15
                )

                ModifierButton(
                    button_text: "Move Pane",
                    size: mod_button_size
                ) {}
                .offset(
                    x: -(self.mod_button_size / 3),
                    y: (geo.size.height / 4) - 65
                )
                ModifierButton(
                    button_text: "Connect",
                    size: mod_button_size
                ) {}
                .offset(
                    x: -(self.mod_button_size / 3),
                    y: 2 * (geo.size.height / 4) - 65
                )
                ModifierButton(
                    button_text: "Hover",
                    size: mod_button_size
                ) {}
                .offset(
                    x: -(self.mod_button_size / 3),
                    y: 3 * (geo.size.height / 4) - 65
                )
            }
        }
        .edgesIgnoringSafeArea(.all);
    }
}

//struct ModButtonList: View {
//    private var tup: [(String, () -> ())] = [
//        ("Move Pane", {}),
//        ("Connect", {}),
//        ("Hover", {})
//    ];
//    var size: CGFloat;
//    var geo: GeometryProxy;
//
//    var body: some View {
//        ForEach(0..<tup.count) { i in
//            ModifierButton(
//                button_text: tup[i].0,
//                size: size,
//                action_fn: tup[i].1
//            )
//            .offset(
//                x: -(self.size / 3),
//                y: CGFloat(i+1) * (geo.size.height / tup.count + 1) - 65
//            )
//        }
//    }
//}

struct ProjectMenu_Previews: PreviewProvider {
    @State static var zoom_scale: CGFloat = 1;

    static var previews: some View {
        ProjectMenu(zoom_scale: $zoom_scale);
    }
}
