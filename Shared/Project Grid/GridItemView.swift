//
//  ProjectGridItemView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI

struct GridItemView: View {
    @State var size: CGFloat;

    var body: some View {
        VStack {
            Text("block with\nwidth size: \(Int(size))px");
        }
        .frame(width: size, height: 1.5 * size)
        .foregroundColor(.yellow)
        .background(.gray)
        .cornerRadius(20)
    }
}

struct ProjectItem_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(size: 220);
    }
}
