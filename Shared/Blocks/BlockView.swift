//
//  BlockView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct BlockView: View {
    var block_color: Color;
    @State var node: BlockModel;
    
    /* Initially position mesh in the approximate center */
    @State var position = CGPoint(
        x: UIScreen.main.bounds.size.width * 0.5,
        y: UIScreen.main.bounds.size.height * 0.5
    );
    @State var animate = false;

    var body: some View {
        XnorGate(size: 50, color: self.block_color)
            .scaleEffect(scale_amount())
            .opacity(opacity_amount())
            .position(self.position)
            .gesture(drag_gesture_animation());
    }
}

struct Block_Previews: PreviewProvider {
    static var previews: some View {
        BlockView(
            block_color: Color.blue,
            node: BlockModel()
        );
    }
}
