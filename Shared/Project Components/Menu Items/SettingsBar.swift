//
//  SettingsBar.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 21/12/21.
//

import SwiftUI

struct SettingsBar: View {
    @State var width: CGFloat;
    @State var height: CGFloat;
    @Binding var zoom_scale: CGFloat;

    var body: some View {
        ZStack {
            /* Indigo frame */
            RoundedRectangle(cornerRadius: 8)
                .frame(width: width, height: height)
                .foregroundColor(.indigo)
            
            /* Share Button */
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 50, height: 30)
                .foregroundColor(.purple)
                .offset(x: -108)
            Button(action: {}) {
                Text("Share")
            }
            .frame(width: 50, height: 25)
            .foregroundColor(.white)
            .offset(x: -108)
            
            /* Zoom Percentage */
            Text("Zoom: \(Int(zoom_scale * 100))%")
                .foregroundColor(.white)
                .offset(x: 8)
            
            /* Settings Gear */
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 30, height: 30)
                .foregroundColor(.purple)
                .offset(x: 115)
            Button(action: {
            }) {
                Image(systemName: "gear")
            }
            .foregroundColor(.white)
            .offset(x: 115)
        }
    }
}

struct SettingsBar_Previews: PreviewProvider {
    @State static var zoom_scale: CGFloat = 1;

    static var previews: some View {
        SettingsBar(width: 300, height: 50, zoom_scale: $zoom_scale)
    }
}
