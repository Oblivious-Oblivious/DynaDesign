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
    
    private let grid_spacing: CGFloat = 16;
    private let columns: [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
    ];

    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(projects_list) { project in
                            NavigationLink(destination: ProjectView(project: project)) {
                                Text("Block")
                                    .frame(
                                        width: (geo.size.width / CGFloat(columns.count)) - grid_spacing,
                                        height: 1.5 * (geo.size.width / CGFloat(columns.count)) - grid_spacing
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
        GridView(projects_list: ProjectModel.sample_list())
            .previewInterfaceOrientation(.landscapeLeft)
        
        GridView(projects_list: ProjectModel.sample_list())
    }
}
