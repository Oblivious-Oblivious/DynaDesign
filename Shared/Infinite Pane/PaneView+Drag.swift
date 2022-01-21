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
            self.pane.drag_offset = value.translation;
        }
    }
    
    private func end_dragging(_ value: DragGesture.Value) {
        self.is_dragging = false;
        self.pane.drag_offset = .zero;
        
        if self.is_dragging_mesh {
            self.pane.portal_position = CGPoint(
                x: self.pane.portal_position.x + value.translation.width,
                y: self.pane.portal_position.y + value.translation.height
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
