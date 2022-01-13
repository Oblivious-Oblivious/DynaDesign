//
//  ListOfBlocks.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct ListOfBlocks: View {
    @EnvironmentObject var model_data: ModelData;

    var body: some View {
        ZStack {
            ForEach(model_data.mesh.blocks) { node in
                BlockView(
                    block_color: Color.indigo,
                    node: node
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
        return ListOfBlocks()
            .environmentObject(ModelData());
    }
}
