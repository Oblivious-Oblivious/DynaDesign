//
//  Pane.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct Pane: View {
    @ObservedObject var mesh: Mesh;
    @ObservedObject var selection: SelectionHandler;
    @State var pane_color: Color;
    
    /* Dragging */
    @State var portal_position = CGPoint.zero;
    @State var drag_offset = CGSize.zero;
    @State var is_dragging = false;
    @State var is_dragging_mesh = false;
    
    /* Zooming */
    @State var zoom_scale = CGFloat(1.0);
    @State var current_zoom_scale: CGFloat?;
    @State var initial_portal_position: CGPoint?;
    
    var body: some View {
        GeometryReader { pane in
            ZStack {
                Rectangle()
                    .fill(self.pane_color)
                    .ignoresSafeArea();
                
                BlockMapView(
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
                .animation(.spring())
            }
            .gesture(pane_drag_gesture(on: pane))
            .gesture(pane_magnification_gesture());
        }
    }
}

/* Gesture extension */
extension Pane {
    func pane_drag_gesture(on pane: GeometryProxy) -> some Gesture {
        DragGesture()
            .onChanged { value in
                self.process_drag_change(
                    value,
                    container_size: pane.size
                );
            }
            .onEnded { value in
                self.process_drag_end(value);
            };
    }
    
    func pane_magnification_gesture() -> some Gesture {
        MagnificationGesture()
            .onChanged { value in
                if self.current_zoom_scale == nil {
                    self.current_zoom_scale = self.zoom_scale;
                    self.initial_portal_position = self.portal_position;
                }
                self.process_scale_change(value);
            }
            .onEnded { value in
                self.process_scale_change(value);
                self.current_zoom_scale = nil;
                self.initial_portal_position = nil;
            }
    }
}

struct Pane_Previews: PreviewProvider {
    static var previews: some View {
        let mesh = Mesh.sample_mesh();
        let selection = SelectionHandler();
        
        return Pane(
            mesh: mesh,
            selection: selection,
            pane_color: Color("PaneColor")
        );
    }
}
