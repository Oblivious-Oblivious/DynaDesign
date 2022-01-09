//
//  GridView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI
import WaterfallGrid

struct GridView: View {
    @EnvironmentObject var model_data: ModelData;

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width;
            let columns = model_data.grid_options.columns;
            let grid_spacing = model_data.grid_options.grid_spacing;

            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(model_data.projects_list) { project in
                            NavigationLink(destination: ProjectView(project: project)) {
                                Text("Block")
                                    .frame(
                                        width: (width / CGFloat(columns.count)) - grid_spacing,
                                        height: 1.5 * (width / CGFloat(columns.count)) - grid_spacing
                                    )
                                    .foregroundColor(.yellow)
                                    .background(.gray)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(grid_spacing)
                }
                .navigationTitle("Projects")
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ProjectsGrid_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(ModelData());
    }
}
