//
//  NegationCircle.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

private struct NegationCircleSymbol: Shape {
    @State var size: CGFloat;

    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width;
            let height = rect.height;
            
            path.move(to: CGPoint(x: width, y: 0.5 * height));
            path.addEllipse(
                in: CGRect(
                    origin: CGPoint(x: 1 * width, y: 0.45 * height),
                    size: CGSize(width: 0.1 * size, height: 0.1 * size)
                )
            )
            
            path.closeSubpath();
        }
    }
}

struct NegationCircle: View {
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        NegationCircleSymbol(size: size)
            .stroke(lineWidth: 1)
            .foregroundColor(color)
    }
}

struct NegationCircle_Previews: PreviewProvider {
    static var previews: some View {
        NegationCircle(size: 200, color: .red)
            .position(x: 0, y: 0)
    }
}
