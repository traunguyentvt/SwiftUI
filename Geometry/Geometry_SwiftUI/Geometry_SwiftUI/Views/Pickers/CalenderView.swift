//
//  CalenderView.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/25/23.
//

import SwiftUI

struct CalenderView: View {
    
    @Namespace private var namespace
    @State private var selection: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                ForEach(0..<12) { monthID in
                    MonthView(selection: $selection, month: monthID)
                        .matchedGeometryEffect(id: monthID, in: namespace)
                }
            })
        }
        .background(
            RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 3)
                .matchedGeometryEffect(id: selection, in: namespace, isSource: false)
        )
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
