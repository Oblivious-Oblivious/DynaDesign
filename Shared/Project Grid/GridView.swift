//
//  GridView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI
import WaterfallGrid

struct GridView: View {
    @State var projects_list: [ProjectModel];
    @State var options: GridOptions;

    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    WaterfallGrid(projects_list) { project in
                        NavigationLink(
                            destination: ProjectView(project: project)
                        ) {
                            /// TODO Figure out dynamic sizing
                            GridItemView(
                                size: (geo.size.width / CGFloat(options.landscape_columns)) - options.grid_spacing
                            )
                        }
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
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ProjectsGrid_Previews: PreviewProvider {
    static var previews: some View {
        GridView(
            projects_list: ProjectModel.sample_list(),
            options: GridOptions()
        )
        .previewInterfaceOrientation(.landscapeLeft);
        
        GridView(
            projects_list: ProjectModel.sample_list(),
            options: GridOptions()
        )
    }
}
