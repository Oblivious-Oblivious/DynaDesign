//
//  GateText.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct GateText: View {
    @State var gate_text: String;
    @State var size: CGFloat;
    @State var color: Color;

    var body: some View {
        Text(gate_text)
            .foregroundColor(color)
            .font(.caption)
            .position(x: 0.4 * size, y: 0.5 * size)
    }
}

struct GateText_Previews: PreviewProvider {
    static var previews: some View {
        GateText(
            gate_text: "Sample",
            size: 200,
            color: .black
        );
    }
}
