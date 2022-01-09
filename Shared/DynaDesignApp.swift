//
//  DynaDesignApp.swift
//  Shared
//
//  Created by Thanasis Papapostolou on 10/12/21.
//

import SwiftUI

@main
struct DynaDesignApp: App {
    @StateObject private var model_data = ModelData();

    var body: some Scene {
        let main_window = WindowGroup {
            ContentView()
                .environmentObject(model_data);
        }
        
        #if os(macOS)
//            main_window.commands {
//                DynaDesignCommands();
//            }
        #else
            main_window;
        #endif
    }
}
