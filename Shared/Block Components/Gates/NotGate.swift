//
//  NotGate.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct NotGate: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        ZStack {
            BufferInputs(number: 1, color: color);
            NegationBall(size: size, color: color)
            NegationOutput(color: color);

            BufferGateSymbol().fill(color)
            GateText(gate_text: "NOT", size: size, color: .white);
        }
        .frame(
            width: size,
            height: size,
            alignment: .center
        );
    }
}

struct NotGate_Previews: PreviewProvider {
    static var previews: some View {
        NotGate(size: 250, color: .black)
    }
}
