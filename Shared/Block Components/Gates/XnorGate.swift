//
//  XnorGate.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct XnorGate: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        ZStack {
            BufferInputs(number: 2, color: color);

            ZStack {
                NegationOutput(color: color);
                NegationBall(size: size, color: color)
                
                XorExtraBar().fill(color).offset(x: -0.075 * size);
                XorGateSymbol().fill(color);
                GateText(gate_text: "XOR", size: size, color: .white);
            }
            .offset(x: 0.075 * size);
        }
        .frame(
            width: size,
            height: size,
            alignment: .center
        )
    }
}

struct XnorGate_Previews: PreviewProvider {
    static var previews: some View {
        XnorGate(size: 250, color: .black)
    }
}
