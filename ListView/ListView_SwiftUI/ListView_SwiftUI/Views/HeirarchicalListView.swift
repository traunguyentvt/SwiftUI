//
//  HeirarchicalListView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/30/23.
//

import SwiftUI

struct HeirarchicalListView: View {
    
    @State private var fileItems: [FileItem] = FileItem.createExamples()
    
    var body: some View {
        List(fileItems, children: \.children) { file in
            if file.isFolder {
                Label(file.title, systemImage: "folder.fill")
            } else {
                Label(file.title, systemImage: "envelope")
            }
        }
    }
}

struct HeirarchicalListView_Previews: PreviewProvider {
    static var previews: some View {
        HeirarchicalListView()
    }
}
