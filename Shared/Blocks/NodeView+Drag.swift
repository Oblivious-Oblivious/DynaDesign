//
//  NodeView+Drag.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension NodeView {
    func scale_amount() -> CGFloat {
        self.animate ? 1.035 : 1.0;
    }
    
    func opacity_amount() -> Double {
        self.animate ? 0.55 : 1.0;
    }
    
    func drag_gesture_animation() -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged({ value in
                withAnimation(.easeInOut(duration: 0.33)) {
                    self.animate = true;
                    node.position = value.location;
                    mesh.rebuild_links();
                }
            })
            .onEnded({ _ in
                withAnimation(.easeInOut(duration: 0.33)) {
                    self.animate = false;
                }
            });
    }
}
