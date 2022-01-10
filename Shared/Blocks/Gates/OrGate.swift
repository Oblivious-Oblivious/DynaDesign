//
//  OrGate.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 06/01/22.
//

import SwiftUI

struct OrGateSymbol: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width;
            let height = rect.height;
            
            path.move(to: CGPoint(x: -0.1 * width, y: 0));
            path.addQuadCurve(
                to: CGPoint(x: -0.1 * width, y: height),
                control: CGPoint(x: 0.15 * width, y: 0.5 * height)
            );
            path.addQuadCurve(
                to: CGPoint(x: width, y: 0.5 * height),
                control: CGPoint(x: 0.75 * width, y: height)
            );
            path.addQuadCurve(
                to: CGPoint(x: -0.1 * width, y: 0),
                control: CGPoint(x: 0.75 * width, y: 0)
            );
        }
    }
}

struct OrGate: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        ZStack {
            BufferInputs(number: 2, color: color);
            BufferOutput(color: color);

            OrGateSymbol().fill(color);
            GateText(gate_text: "OR", size: size, color: .white);
        }
        .frame(
            width: size,
            height: size,
            alignment: .center
        );
    }
}

struct OrGate_Previews: PreviewProvider {
    static var previews: some View {
        OrGate(size: 250, color: .black);
    }
}
