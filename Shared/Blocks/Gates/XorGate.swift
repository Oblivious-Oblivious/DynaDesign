//
//  XorGate.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct XorExtraBar: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width;
            let height = rect.height;
            
            path.move(to: CGPoint(x: -0.1 * width, y: 0));
            path.addQuadCurve(
                to: CGPoint(x: -0.1 * width, y: height),
                control: CGPoint(x: 0.15 * width, y: 0.5 * height)
            );
            
            path.addLine(to: CGPoint(x: -0.075 * width, y: height));
            
            path.addQuadCurve(
                to: CGPoint(x: -0.075 * width, y: 0),
                control: CGPoint(x: 0.175 * width, y: 0.5 * height)
            );
            
            path.addLine(to: CGPoint(x: -0.1 * width, y: 0));
        }
    }
}

struct XorGateSymbol: Shape {
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

struct XorGate: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        ZStack {
            BufferInputs(number: 2, color: color);

            ZStack {
                BufferOutput(color: color);
                
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

struct XorGate_Previews: PreviewProvider {
    static var previews: some View {
        XorGate(size: 250, color: .black);
    }
}
