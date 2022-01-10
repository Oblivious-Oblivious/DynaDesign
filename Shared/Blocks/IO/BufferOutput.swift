//
//  BufferOutput.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

private struct BufferOutputSymbol: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width;
            let height = rect.height;
            
            path.addLines([
                CGPoint(x: 0.98 * width, y: 0.49 * height),
                CGPoint(x: 1.18 * width, y: 0.49 * height),
                CGPoint(x: 1.18 * width, y: 0.51 * height),
                CGPoint(x: 0.98 * width, y: 0.51 * height)
            ]);
            
            path.closeSubpath();
        }
    }
}

struct BufferOutput: View {
    @State var color: Color;

    var body: some View {
        BufferOutputSymbol()
            .foregroundColor(color);
    }
}

struct BufferOutput_Previews: PreviewProvider {
    static var previews: some View {
        BufferOutput(color: .red)
            .position(x: 0, y: 0)
    }
}
