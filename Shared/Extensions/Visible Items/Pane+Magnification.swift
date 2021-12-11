//
//  Pane+Magnification.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

let zoom_min_scale = CGFloat(0.05);
let zoom_max_scale = CGFloat(4.0);

extension Pane {
    private func scaled_offset(_ scale: CGFloat, initial_value: CGPoint) -> CGPoint {
        let new_x = initial_value.x * scale;
        let new_y = initial_value.y * scale;

        return CGPoint(x: new_x, y: new_y);
    }

    private func clamped_scale(_ scale: CGFloat, initial_value: CGFloat?)
    -> (new_scale: CGFloat, did_clamp: Bool) {
        let raw = scale.magnitude * (initial_value ?? zoom_max_scale);
        let new_scale = max(zoom_min_scale, min(zoom_max_scale, raw));
        let did_clamp = raw != new_scale;

        return (new_scale, did_clamp);
    }

    func process_scale_change(_ value: CGFloat) {
        let clamped = clamped_scale(value, initial_value: self.current_zoom_scale);
        self.zoom_scale = clamped.new_scale;
        
        /* Position to zoom towards */
        if !clamped.did_clamp, let point = self.initial_portal_position {
            self.portal_position = scaled_offset(value, initial_value: point);
        }
    }
}
