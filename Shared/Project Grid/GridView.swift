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
    
    @State private var portrait_columns: Int = 3;
    @State private var landscape_columns: Int = 4;
    @State private var grid_spacing: CGFloat = 16;

    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    WaterfallGrid(projects_list) { project in
                        NavigationLink(
                            destination: ProjectView(project: project)
                        ) {
                            /// TODO Figure out dynamic sizing
                            GridItemView(size: (geo.size.width / CGFloat(landscape_columns)) - grid_spacing)
                        }
                    }
                    .gridStyle(
                        columnsInPortrait: portrait_columns,
                        columnsInLandscape: landscape_columns,
                        spacing: grid_spacing,
                        animation: .easeInOut(duration: 0.5)
                    )
                    .scrollOptions(direction: .vertical)
                    .padding(EdgeInsets(
                        top: grid_spacing,
                        leading: grid_spacing,
                        bottom: grid_spacing,
                        trailing: grid_spacing
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
        GridView(projects_list: ProjectModel.sample_list())
            .previewInterfaceOrientation(.landscapeLeft)
        
        GridView(projects_list: ProjectModel.sample_list())
    }
}
