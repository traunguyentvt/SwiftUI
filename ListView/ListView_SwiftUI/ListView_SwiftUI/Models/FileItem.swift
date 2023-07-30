//
//  FileItem.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/30/23.
//

import Foundation

struct FileItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let isFolder: Bool
    var children: [FileItem]? = nil
    
    static func createExamples() -> [FileItem] {
        [
            FileItem(title: "VT", isFolder: true, children: [FileItem(title: "YE", isFolder: false),
                                                             FileItem(title: "NE", isFolder: false)]),
            FileItem(title: "JV", isFolder: true, children: [FileItem(title: "YETN", isFolder: true, children: [
                                                                FileItem(title: "TDBE", isFolder: false)
                                                            ]),
                                                            FileItem(title: "NETN", isFolder: true, children: [
                                                                FileItem(title: "CMME", isFolder: false)
                                                            ])]),
            FileItem(title: "TVT", isFolder: false)
        ]
    }
}
