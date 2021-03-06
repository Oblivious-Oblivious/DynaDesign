//
//  BufferInputs.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

private struct BufferInputsSymbol: Shape {
    @State var offset_value: CGFloat;

    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width;
            let height = rect.height;
            
            path.addLines([
                CGPoint(x: -0.2 * width, y: (offset_value-0.01) * height),
                CGPoint(x: 0.025 * width, y: (offset_value-0.01) * height),
                CGPoint(x: 0.025 * width, y: (offset_value+0.01) * height),
                CGPoint(x: -0.2 * width, y: (offset_value+0.01) * height)
            ]);

            path.closeSubpath();
        }
    }
}

struct BufferInputs: View {
    @State var number: Int;
    @State var color: Color;

    var body: some View {
        ZStack {
            ForEach(0..<number) { index in
                BufferInputsSymbol(position: CGFloat(1+index) / CGFloat(number+1))
                    .foregroundColor(color)
            }
        }
    }
}

struct BufferInputs_Previews: PreviewProvider {
    static var previews: some View {
        BufferInputs(number: 2, color: .red)
            .position(x: 0, y: 0)
    }
}
