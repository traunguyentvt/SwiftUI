//
//  ColorPickerView.swift
//  Drawing_SwiftUI
//
//  Created by VT on 7/24/23.
//

import SwiftUI

struct ColorPickerView: View {
    private let colors: [Color] = [.gray, .black, .cyan, .teal ,.blue, .green, .yellow, .orange, .red, .purple, .brown]
    @Binding var selectedColor: Color
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(colors, id: \.self) { c in
                    c.frame(width: 40, height: 40)
                        .border(c == selectedColor ? .white : .clear, width: 4)
                        .shadow(radius: 2)
                        .onTapGesture {
                            selectedColor = c
                        }
                }
            }
            .padding()
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    @State static private var selectedColor = Color.purple
    static var previews: some View {
        ColorPickerView(selectedColor: $selectedColor)
    }
}
