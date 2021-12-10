//
//  Block.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

struct Block: View {
    var block_color: Color;
    @State var node: Node;
    @ObservedObject var selection: SelectionHandler;
    
    /* Initially position mesh in the approximate center */
    @State var position = CGPoint(
        x: UIScreen.main.bounds.size.width * 0.5,
        y: UIScreen.main.bounds.size.height * 0.5
    );
    @State var animate = false;

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(self.block_color)
            .frame(
                width: 50,
                height: 50,
                alignment: .center
            )
            .scaleEffect(scale_amount())
            .opacity(opacity_amount())
            .shadow(
                color: self.block_color.opacity(0.66),
                radius: self.animate ? 20 : 10,
                x: 0,
                y: self.animate ? 22 : 12
            )
            .position(self.position)
            .gesture(drag_gesture_animation());
    }
}

struct Block_Previews: PreviewProvider {
    static var previews: some View {
        let selection = SelectionHandler();
        let node = Node();

        Block(
            block_color: Color.blue,
            node: node,
            selection: selection
        );
    }
}
