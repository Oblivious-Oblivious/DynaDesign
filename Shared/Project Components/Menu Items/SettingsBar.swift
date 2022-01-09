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
    
    @State var is_showing_settings = false;

    var body: some View {
        ZStack {
            /* Indigo frame */
            RoundedRectangle(cornerRadius: 8)
                .frame(width: width, height: height)
                .foregroundColor(.indigo)
            
            /* Share Button */
            Button(action: {}) {
                Text("Save")
            }
            .frame(width: 55, height: 35)
            .background(.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
            .offset(x: -105)
            
            /* Zoom Percentage */
            Text("Zoom: \(Int(zoom_scale * 100))%")
                .foregroundColor(.white)
                .offset(x: 8)
            
            /* Settings Gear */
            Button(action: {
                self.is_showing_settings.toggle();
            }) {
                Image(systemName: "gear")
            }
            .sheet(isPresented: $is_showing_settings) {
                SettingsPageView()
            }
            .frame(width: 35, height: 35)
            .background(.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
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
