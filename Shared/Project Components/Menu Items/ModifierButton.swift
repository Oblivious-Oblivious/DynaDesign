//
//  ModifierButton.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 21/12/21.
//

import SwiftUI

struct ModifierButton: View {
    @State var button_text: String;
    @State var size: CGFloat;
    var action_fn: () -> ();
    
    /* ModifierButton+Tap */
    @State var is_pressed: Bool = false;

    var body: some View {
        ZStack {
            Circle()
                .fill(.indigo)

            Text(button_text)
                .foregroundColor(.white);
        }
        .frame(
            width: size,
            height: size
        )
        .scaleEffect(scale_amount())
        .opacity(opacity_amount())
        .gesture(tap_gesture_animation());
    }
}

struct ModifierButton_Previews: PreviewProvider {
    static var previews: some View {
        ModifierButton(
            button_text: "MOD",
            size: 150,
            action_fn: { print("Hello."); }
        )
    }
}
