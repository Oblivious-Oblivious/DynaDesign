//
//  ProjectView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI

struct ProjectView: View {
    @State var item: ProjectModel;

    var body: some View {
        NavigationLink(destination: Text(item.value)) {
            Image(systemName: "heart.fill")
                .frame(width: item.size, height: item.size + item.size/2)
                .foregroundColor(.yellow)
                .background(.gray)
                .cornerRadius(20)
        }
    }
}

struct ProjectItem_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(
            item: ProjectModel(size: 200, value: "test")
        );
    }
}
