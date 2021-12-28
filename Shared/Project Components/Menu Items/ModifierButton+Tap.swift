//
//  ModifierButton+Tap.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 28/12/21.
//

import SwiftUI

extension ModifierButton {
    func scale_amount() -> CGFloat {
        self.is_pressed ? 1.035 : 1.0;
    }
    
    func opacity_amount() -> Double {
        self.is_pressed ? 0.55 : 1.0;
    }
    
    func tap_gesture_animation() -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged({ _ in
                withAnimation(.easeInOut(duration: 0.33)) {
                    /* Execute custom action */
                    action_fn();
                    self.is_pressed = true
                }
            })
            .onEnded({ _ in
                withAnimation(.easeInOut(duration: 0.33)) {
                    self.is_pressed = false;
                }
            });
    }
}
