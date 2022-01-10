//
//  BufferGate.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct BufferGateSymbol: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width;
            let height = rect.height;

            path.addLines([
                CGPoint(x: 0, y: height),
                CGPoint(x: 0, y: 0),
                CGPoint(x: width, y: 0.5 * height),
                CGPoint(x: 0, y: height)
            ]);

            path.closeSubpath();
        }
    }
}

struct BufferGate: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        ZStack {
            BufferInputs(number: 1, color: color);
            BufferOutput(color: color);

            BufferGateSymbol().fill(color)
            GateText(gate_text: "BUFFER", size: size, color: .white);
        }
        .frame(
            width: size,
            height: size,
            alignment: .center
        );
    }
}

struct BufferGate_Previews: PreviewProvider {
    static var previews: some View {
        BufferGate(size: 250, color: .black)
    }
}
