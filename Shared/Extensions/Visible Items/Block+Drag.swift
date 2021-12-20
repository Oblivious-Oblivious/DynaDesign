//
//  Block+Drag.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension Block {
    func scale_amount() -> CGFloat {
        self.animate ? 1.035 : 1.0;
    }
    
    func opacity_amount() -> Double {
        self.animate ? 0.55 : 1.0;
    }
    
    func drag_gesture_animation() -> some Gesture {
        DragGesture()
            .onChanged({ value in
                withAnimation(.easeInOut(duration: 0.33)) {
                    self.animate = true
                    self.position = value.location;
                }
            })
            .onEnded({ _ in
                withAnimation(.easeInOut(duration: 0.33)) {
                    self.animate = false;
                }
            });
    }
}
