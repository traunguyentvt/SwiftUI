//
//  GridScrollView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/13/23.
//

import SwiftUI

struct GridScrollView: View {
//    let columns = [GridItem(.flexible(), spacing: 10)]
    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 10) {
//                    ForEach(0x1f600...0x1f64f, id: \.self) { value in
//                        GroupBox {
//                            Text(emoji(value))
//                                .font(.largeTitle)
//                                .fixedSize()
//                            Text(String(format: "%x", value))
//                                .fixedSize()
//                        }
//                    }
//                }
//            }
//            .padding()
//            .navigationTitle(Text("Grid ScrollView"))
//        }
//    }
    
    let data = (1...100).map { "Item 123123123 2eqw 1231 123 123 \($0)" }

        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible())
        ]
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                    }
                }
                .padding(.horizontal)
            }
//            .frame(maxHeight: 300)
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
