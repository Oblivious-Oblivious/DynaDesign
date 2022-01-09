//
//  SettingsPageView.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct SettingsPageView: View {
    @EnvironmentObject var model_data: ModelData;
    @Environment(\.presentationMode) var presentation_mode;

    var body: some View {
        List {
            HStack {
                Text("Username")
                    .foregroundColor(Color("TextColor"))
                    .bold();
                Divider();
                TextField("Username", text: $model_data.user_options.username)
                    .foregroundColor(Color("TextColor"))
            }
            
            Toggle(isOn: $model_data.user_options.is_left_handed.animation(.spring())) {
                Text("Left Handed")
                    .foregroundColor(Color("TextColor"))
                    .bold();
            }
            
            Spacer();
            
            Button("Back") {
                presentation_mode.wrappedValue.dismiss();
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct SettingsPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPageView()
            .environmentObject(ModelData());
    }
}
