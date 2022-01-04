//
//  BackButton.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 21/12/21.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>;
    
    @State var width: CGFloat;
    @State var height: CGFloat;
    
    /* BackButton+Tap */
    @State var is_pressed: Bool = false;

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.indigo)
            Image(systemName: "arrow.backward")
                .foregroundColor(.white)
        }
        .frame(width: width, height: height)
        .opacity(opacity_amount())
        .gesture(button_animation());
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(width: 50, height: 50)
            .offset(x: 0, y: 0)
    }
}
