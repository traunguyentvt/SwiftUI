//
//  StaggeredGrid.swift
//  News
//
//  Created by VT on 8/14/23.
//

import Foundation
import SwiftUI

struct StaggeredGrid<Content: View, T: Hashable>: View {
    var content: (T) -> Content
    var list: [T]
    var columns: Int
    var showIndicators: Bool
    var spacing: CGFloat
    
    init(list: [T], columns: Int, showIndicators: Bool, spacing: CGFloat, content: @escaping (T) -> Content) {
        self.list = list
        self.columns = columns
        self.showIndicators = showIndicators
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        generateGrid()
    }
    
    private func setUpList() -> [[T]] {
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        var currentIndex = 0
        for object in list {
            gridArray[currentIndex].append(object)
            
            if currentIndex == columns - 1 {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    @ViewBuilder
    private func generateGrid() -> some View {
        ScrollView(.vertical, showsIndicators: showIndicators) {
            HStack(alignment: .top, spacing: -12) {
                ForEach(setUpList(), id: \.self) { columsData in
                    LazyVStack(spacing: spacing) {
                        ForEach(columsData, id: \.self) { item in
                            content(item)
                        }
                    }
                }
            }
        }
    }
}
