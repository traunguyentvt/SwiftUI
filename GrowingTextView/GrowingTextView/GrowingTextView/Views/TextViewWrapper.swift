//
//  TextViewWrapper.swift
//  GrowingTextView
//
//  Created by VT on 8/5/23.
//

import SwiftUI

struct TextViewWrapper: UIViewRepresentable {
    
    @Binding var text: String?
    @Binding var focused: Bool
    @Binding var contentHeight: CGFloat
    
    init(text: Binding<String?>, focused: Binding<Bool>, contentHeight: Binding<CGFloat>) {
        self._text = text
        self._focused = focused
        self._contentHeight = contentHeight
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, focused: $focused, contentHeight: $contentHeight)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = .systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        textView.autocorrectionType = .no
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String?
        @Binding var focused: Bool
        @Binding var contentHeight: CGFloat
        
        init(text: Binding<String?>, focused: Binding<Bool>, contentHeight: Binding<CGFloat>) {
            self._text = text
            self._focused = focused
            self._contentHeight = contentHeight
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            focused = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            focused = false
            contentHeight = text == nil ? 0 : textView.contentSize.height
        }
        
        func textViewDidChange(_ textView: UITextView) {
            text = textView.text
            contentHeight = textView.contentSize.height
        }
    }
    
}

struct TextViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        TextViewWrapper(text: .constant(nil), focused: .constant(false), contentHeight: .constant(0))
    }
}
