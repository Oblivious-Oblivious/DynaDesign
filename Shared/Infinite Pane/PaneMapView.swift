//
//  BlockMapView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct PaneMapView: View {
    @EnvironmentObject var model_data: ModelData;

    var body: some View {
        ZStack {
            ForEach(model_data.mesh.nodes) { node in
                BlockView(
                    block_color: Color.indigo,
                    node: node,
                    selection: model_data.selection
                )
                .offset(
                    x: node.position.x,
                    y: node.position.y
                )
            }
        }
    }
}

struct PaneMapView_Previews: PreviewProvider {
    static var previews: some View {
        return PaneMapView()
            .environmentObject(ModelData());
    }
}
