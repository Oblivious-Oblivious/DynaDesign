//
//  PaneView+Drag.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension PaneView {
    private func start_dragging(_ value: DragGesture.Value) {
        if !self.is_dragging {
            self.is_dragging = true;
            self.is_dragging_mesh = true;
        }
        
        if self.is_dragging_mesh {
            drag_offset = value.translation;
        }
    }
    
    private func end_dragging(_ value: DragGesture.Value) {
        self.is_dragging = false;
        self.drag_offset = .zero;
        
        if self.is_dragging_mesh {
            portal_position = CGPoint(
                x: portal_position.x + value.translation.width,
                y: portal_position.y + value.translation.height
            );
        }
    }
    
    func pane_drag_gesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation(.spring()) {
                    self.start_dragging(value);
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    self.end_dragging(value);
                }
            };
    }
}
