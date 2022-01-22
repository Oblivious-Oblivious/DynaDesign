//
//  ListOfEdges.swift
//  DynaDesign (iOS)
//
//  Created by Thanasis Papapostolou on 10/01/22.
//

import SwiftUI

struct ListOfEdges: View {
    @Binding var links: [LinkModel];
    
    var body: some View {
        ZStack {
            ForEach(links) { link in
                EdgeView(link: link)
                    .stroke(Color.indigo, lineWidth: 1);
            }
        }
    }
}

struct ListOfEdges_Previews: PreviewProvider {
    static var previews: some View {
        ListOfEdges(links: .constant(MeshController.sample_mesh().links));
    }
}
