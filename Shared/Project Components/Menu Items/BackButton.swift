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

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: width, height: height)
                .foregroundColor(.indigo)

            Button(action: {
                self.presentationMode.wrappedValue.dismiss();
            }) {
                Image(systemName: "arrow.backward")
            }
            .foregroundColor(.white)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(width: 50, height: 50)
            .offset(x: 0, y: 0)
    }
}
