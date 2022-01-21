//
//  ProjectModel+Demo.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI

extension ProjectModel {
    static func sample_list() -> [ProjectModel] {
        return [
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh()),
            ProjectModel(mesh: MeshController.sample_mesh())
        ];
    }
}
