//
//  PaneView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct PaneView: View {
    @ObservedObject var mesh: MeshController;
    @ObservedObject var selection: SelectionController;
    @State var pane_color: Color;
    
    /* Dragging */
    @State var portal_position = CGPoint.zero;
    @State var drag_offset = CGSize.zero;
    
    /* PaneView+Drag */
    @State var is_dragging = false;
    @State var is_dragging_mesh = false;
    
    /* Zooming */
    @State var zoom_scale = CGFloat(1.0);
    
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
    static var previews: some View {
        let mesh = MeshController.sample_mesh();
        let selection = SelectionController();
        
        return PaneView(
            mesh: mesh,
            selection: selection,
            pane_color: Color("PaneColor")
        );
    }
}
