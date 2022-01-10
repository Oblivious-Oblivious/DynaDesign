//
//  NandGate.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct NandGate: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        ZStack {
            BufferInputs(number: 2, color: color);
            NegationBall(size: size, color: color)
            NegationOutput(color: color);

            AndGateSymbol().fill(color)
            GateText(gate_text: "NAND", size: size, color: .white);
        }
        .frame(
            width: size,
            height: size,
            alignment: .center
        );
    }
}

struct NandGate_Previews: PreviewProvider {
    static var previews: some View {
        NandGate(size: 250, color: .black)
    }
}
