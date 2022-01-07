//
//  AndGate.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct AndGateSymbol: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width;
            let height = rect.height;
            
            path.addLines([
                CGPoint(x: 0, y: 0),
                CGPoint(x: 0, y: height),
                CGPoint(x: 0.25 * width, y: height)
            ]);
            path.addQuadCurve(
                to: CGPoint(x: width, y: 0.5 * height),
                control: CGPoint(x: width, y: height)
            );
            path.addQuadCurve(
                to: CGPoint(x: 0.25 * width, y: 0),
                control: CGPoint(x: width, y: 0)
            );
        }
    }
}

struct AndGate: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        ZStack {
            BufferInputs(number: 2, color: color);
            BufferOutput(color: color);

            AndGateSymbol().fill(color);
            GateText(gate_text: "AND", size: size, color: .white);
        }
        .frame(
            width: size,
            height: size,
            alignment: .center
        );
    }
}

struct AndGate_Previews: PreviewProvider {
    static var previews: some View {
        AndGate(size: 250, color: .black)
    }
}
