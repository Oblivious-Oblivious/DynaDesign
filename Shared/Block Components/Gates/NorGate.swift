//
//  NorGate.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct NorGate: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        ZStack {
            BufferInputs(number: 2, color: color);
            NegationBall(size: size, color: color)
            NegationOutput(color: color);

            OrGateSymbol().fill(color)
            GateText(gate_text: "NOR", size: size, color: .white);
        }
        .frame(
            width: size,
            height: size,
            alignment: .center
        );
    }
}

struct NorGate_Previews: PreviewProvider {
    static var previews: some View {
        NorGate(size: 250, color: .black);
    }
}
