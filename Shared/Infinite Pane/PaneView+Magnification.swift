//
//  PaneView+Magnification.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

let zoom_min_scale = CGFloat(0.05);
let zoom_max_scale = CGFloat(16.0);

extension PaneView {
    private func scaled_offset(_ scale: CGFloat, initial_value: CGPoint) -> CGPoint {
        return CGPoint(x: initial_value.x * scale, y: initial_value.y * scale);
    }

    private func clamped_scale(_ scale: CGFloat, initial_value: CGFloat?)
    -> (new_scale: CGFloat, did_clamp: Bool) {
        let raw = scale.magnitude * (initial_value ?? zoom_max_scale);
        let new_scale = max(zoom_min_scale, min(zoom_max_scale, raw));
        let did_clamp = raw != new_scale;

        return (new_scale, did_clamp);
    }

    private func process_scale_change(_ value: CGFloat) {
        let clamped = clamped_scale(value, initial_value: self.current_zoom_scale);
        self.zoom_scale = clamped.new_scale;
        
        /* Position to zoom towards */
        if !clamped.did_clamp, let point = self.initial_portal_position {
            self.portal_position = scaled_offset(value, initial_value: point);
        }
    }
    
    func pane_magnification_gesture() -> some Gesture {
        MagnificationGesture()
            .onChanged { value in
                withAnimation(.spring()) {
                    if self.current_zoom_scale == nil {
                        self.current_zoom_scale = self.zoom_scale;
                        self.initial_portal_position = self.portal_position;
                    }
                    self.process_scale_change(value);
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    self.process_scale_change(value);
                    self.current_zoom_scale = nil;
                    self.initial_portal_position = nil;
                }
            }
    }
}
