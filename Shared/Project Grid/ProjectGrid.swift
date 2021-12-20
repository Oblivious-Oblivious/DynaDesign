//
//  ProjectsGrid.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI
import WaterfallGrid

struct ProjectGridView: View {
    @State var projects_list: [ProjectModel];
    @State private var options = GridOptions();

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                WaterfallGrid(projects_list) { project in
                    ProjectItem(item: project);
                }
                .gridStyle(
                    columnsInPortrait: options.portrait_columns,
                    columnsInLandscape: options.landscape_columns,
                    spacing: options.grid_spacing,
                    animation: .easeInOut(duration: 0.5)
                )
                .scrollOptions(direction: .vertical)
                .padding(EdgeInsets(
                    top: options.grid_spacing,
                    leading: options.grid_spacing,
                    bottom: options.grid_spacing,
                    trailing: options.grid_spacing
                ))
            }
            .navigationTitle("Projects")
        }
        .navigationViewStyle(StackNavigationViewStyle());
    }
}

struct ProjectsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProjectGridView(projects_list: ProjectModel.sample_list());
    }
}
