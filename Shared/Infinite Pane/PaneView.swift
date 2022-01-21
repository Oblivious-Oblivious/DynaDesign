//
//  PaneView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct PaneView: View {
    /* Zooming */
    @Binding var zoom_scale: CGFloat;
    @ObservedObject var mesh: MeshController;
    @Binding var pane: PaneModel;
    
    /* PaneView+Drag */
    @State var is_dragging = false;
    @State var is_dragging_mesh = false;
    
    /* PaneView+Magnification */
    @State var current_zoom_scale: CGFloat?;
    @State var current_portal_position: CGPoint?;
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(pane.pane_color)
                .ignoresSafeArea();
            
            ZStack {
                ListOfNodes(nodes: $mesh.nodes)
                ListOfEdges(links: $mesh.links)
            }
            /* Follow the zoom event */
            .scaleEffect(self.zoom_scale)
            
            /* Follow the position drag event */
            .offset(
                x: pane.portal_position.x + pane.drag_offset.width,
                y: pane.portal_position.y + pane.drag_offset.height
            );
        }
        .gesture(pane_drag_gesture())
        .gesture(pane_magnification_gesture());
    }
}

struct PaneView_Previews: PreviewProvider {
    @State static var zoom_scale: CGFloat = 1;

    static var previews: some View {
        return PaneView(
            zoom_scale: $zoom_scale,
            mesh: MeshController.sample_mesh(),
            pane: .constant(PaneModel())
        )
    }
}
