//
//  PaneView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct PaneView: View {
    @EnvironmentObject var model_data: ModelData;
    /* Zooming */
    @Binding var zoom_scale: CGFloat;
    @ObservedObject var mesh: MeshController;
    @State var pane_color: Color;
    
    /* Dragging */
    @State var portal_position = CGPoint.zero;
    @State var drag_offset = CGSize.zero;
    
    /* PaneView+Drag */
    @State var is_dragging = false;
    @State var is_dragging_mesh = false;
    
    /* PaneView+Magnification */
    @State var current_zoom_scale: CGFloat?;
    @State var current_portal_position: CGPoint?;
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(self.pane_color)
                .ignoresSafeArea();
            
            ZStack {
                ListOfNodes(nodes: $mesh.nodes)
                ListOfEdges(links: $mesh.links)
            }
            /* Follow the zoom event */
            .scaleEffect(self.zoom_scale)
            
            /* Follow the position drag event */
            .offset(
                x: self.portal_position.x + self.drag_offset.width,
                y: self.portal_position.y + self.drag_offset.height
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
            mesh: MeshController.default,
            pane_color: Color("PaneColor")
        )
        .environmentObject(ModelData())
    }
}
