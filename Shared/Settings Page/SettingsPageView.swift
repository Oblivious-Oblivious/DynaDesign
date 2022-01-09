//
//  SettingsPageView.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 07/01/22.
//

import SwiftUI

struct SettingsPageView: View {
    @EnvironmentObject var model_data: ModelData;

    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold();
                Divider();
                TextField("Username", text: $model_data.user_options.username);
            }
            
            Toggle(isOn: $model_data.user_options.is_left_handed) {
                Text("Left Handed")
                    .bold();
            }
        }
    }
}

struct SettingsPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPageView()
            .environmentObject(ModelData());
    }
}
