//
//  PaneView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct PaneView: View {
    @ObservedObject var mesh: MeshController;
    /* Zooming */
    @Binding var zoom_scale: CGFloat;
    @State var pane_color: Color;
    
    /* Selection */
    var selection = SelectionController();
    
    /* Dragging */
    @State var portal_position = CGPoint.zero;
    @State var drag_offset = CGSize.zero;
    
    /* PaneView+Drag */
    @State var is_dragging = false;
    @State var is_dragging_mesh = false;
    
    /* PaneView+Magnification */
    @State var current_zoom_scale: CGFloat?;
    @State var initial_portal_position: CGPoint?;
    
    var body: some View {
        GeometryReader { pane in
            ZStack {
                Rectangle()
                    .fill(self.pane_color)
                    .ignoresSafeArea();
                
                PaneMapView(
                    selection: self.selection,
                    nodes: self.$mesh.nodes
                )
                /* Follow the zoom event */
                .scaleEffect(self.zoom_scale)
                
                /* Follow the position drag event */
                .offset(
                    x: self.portal_position.x + self.drag_offset.width,
                    y: self.portal_position.y + self.drag_offset.height
                )
            }
            .gesture(pane_drag_gesture(on: pane))
            .gesture(pane_magnification_gesture());
        }
    }
}

struct Pane_Previews: PreviewProvider {
    @State static var zoom_scale: CGFloat = 1;

    static var previews: some View {
        return PaneView(
            mesh: MeshController.sample_mesh(),
            zoom_scale: $zoom_scale,
            pane_color: Color("PaneColor")
        )
    }
}
