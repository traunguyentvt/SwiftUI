//
//  GrowingTextInputView.swift
//  GrowingTextView
//
//  Created by VT on 8/5/23.
//

import SwiftUI

struct GrowingTextInputView: View {
    
    @Binding var text: String?
    @State var focused = false
    @Binding var contentHeight: CGFloat
    
    let placeHolder: String?
    let minHeight: CGFloat = 39
    let maxHeight: CGFloat = 150
    
    init(text: Binding<String?>, contentHeight: Binding<CGFloat>, placeHolder: String? = nil) {
        self._text = text
        self._contentHeight = contentHeight
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white
            
            ZStack(alignment: .topLeading) {
                placeholderView
                
                TextViewWrapper(text: $text, focused: $focused, contentHeight: $contentHeight)
            }
            .padding(.horizontal, 4)
        }
        .frame(height: countedHeight)
    }
    
    var countedHeight: CGFloat {
        min(max(minHeight, contentHeight), maxHeight)
    }
    
    var placeholderView: some View {
        ViewBuilder.buildIf(
            showPlaceholder ? placeHolder.map {
                Text($0)
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 4)
            } : nil
        )
    }
    
    var showPlaceholder: Bool {
        !focused && text.getText.isEmpty == true
    }
}

struct GrowingTextInputView_Previews: PreviewProvider {
    @State static var text: String?
    static var previews: some View {
        GrowingTextInputView(text: $text, contentHeight: .constant(0), placeHolder: "Message")
    }
}
