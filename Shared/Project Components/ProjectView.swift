//
//  ProjectView.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 21/12/21.
//

import SwiftUI

struct ProjectView: View {
    @EnvironmentObject var model_data: ModelData;
    @State var project: ProjectModel;

    var body: some View {
        ZStack {
            ProjectMenu(
                zoom_scale: $model_data.projects_list.first(where: {
                    $0.id == project.id
                })!.zoom_scale
            )
            .zIndex(1);

            PaneView(
                zoom_scale: $model_data.projects_list.first(where: {
                    $0.id == project.id
                })!.zoom_scale,
                mesh: project.mesh,
                pane_color: Color("PaneColor")
            )
            .onAppear() {
                /* Remove all scroll indicators */
                UITableView.appearance().showsVerticalScrollIndicator = false;
                UITableView.appearance().showsHorizontalScrollIndicator = false;
            }
            .zIndex(0);
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(project: .constant(ProjectModel(mesh: MeshController.sample_mesh())))
            .environmentObject(ModelData());
    }
}
