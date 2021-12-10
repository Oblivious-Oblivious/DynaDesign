//
//  Pane+Magnification.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

extension Pane {
    private func scaled_offset(_ scale: CGFloat, initial_value: CGPoint) -> CGPoint {
        let new_x = initial_value.x * scale;
        let new_y = initial_value.y * scale;

        return CGPoint(x: new_x, y: new_y);
    }

    private func clamped_scale(_ scale: CGFloat, initial_value: CGFloat?)
    -> (scale: CGFloat, did_clamp: Bool) {
        let min_scale = CGFloat(0.1);
        let max_scale = CGFloat(2.0);

        let raw = scale.magnitude * (initial_value ?? max_scale);
        let value = max(min_scale, min(max_scale, raw));
        let did_clamp = raw != value;

        return (value, did_clamp);
    }

    func process_scale_change(_ value: CGFloat) {
        let clamped = clamped_scale(value, initial_value: self.inital_zoom_scale);
        self.zoom_scale = clamped.scale;

        if !clamped.did_clamp, let point = self.initial_portal_position {
            self.portal_position = scaled_offset(value, initial_value: point);
        }
    }
}
