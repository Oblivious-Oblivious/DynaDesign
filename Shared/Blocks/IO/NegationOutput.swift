//
//  NegationOutput.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

private struct NegationOutputSymbol: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width;
            let height = rect.height;
            
            path.addLines([
                CGPoint(x: 1.1 * width, y: 0.49 * height),
                CGPoint(x: 1.3 * width, y: 0.49 * height),
                CGPoint(x: 1.3 * width, y: 0.51 * height),
                CGPoint(x: 1.1 * width, y: 0.51 * height)
            ]);
            
            path.closeSubpath();
        }
    }
}

struct NegationOutput: View {
    @State var color: Color;

    var body: some View {
        NegationOutputSymbol()
            .foregroundColor(color);
    }
}

struct NegationOutput_Previews: PreviewProvider {
    static var previews: some View {
        NegationOutput(color: .red)
            .position(x: 0, y: 0)
    }
}
