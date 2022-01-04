//
//  BackButton+Tap.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 04/01/22.
//

import SwiftUI

extension BackButton {
    func opacity_amount() -> Double {
        self.is_pressed ? 0.55 : 1.0;
    }
    
    func button_animation() -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged({ _ in
                self.is_pressed = true
                self.presentationMode.wrappedValue.dismiss();
            })
            .onEnded({ _ in
                withAnimation(.easeInOut(duration: 0.33)) {
                    self.is_pressed = false;
                }
            });
    }
}
