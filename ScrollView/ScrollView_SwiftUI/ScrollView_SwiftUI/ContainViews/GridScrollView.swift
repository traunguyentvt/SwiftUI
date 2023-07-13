//
//  GridScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/13/23.
//

import SwiftUI


struct GridScrollView: View {
    let columns = [GridItem(.adaptive(minimum: 75), spacing: 10)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0x1f600...0x1f64f, id: \.self) { value in
                        GroupBox {
                            Text(emoji(value))
                                .font(.largeTitle)
                                .fixedSize()
                            Text(String(format: "%x", value))
                                .fixedSize()
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(Text("Grid ScrollView"))
        }
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else {
            return "?"
        }
        return String(Character(scalar))
    }
}


struct GridScrollView_Preview: PreviewProvider {
    static var previews: some View {
        GridScrollView()
    }
}
