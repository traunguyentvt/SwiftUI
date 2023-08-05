//
//  ChatView.swift
//  GrowingTextView
//
//  Created by VT on 8/5/23.
//

import SwiftUI

struct ChatView: View {
    
    @State var text: String?
    @State var messages: [Message] = []
    @State var contentHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    GrowingTextInputView(text: $text, contentHeight: $contentHeight, placeHolder: "Message")
                        .cornerRadius(10)
                    
                    Button(action: sendAction) {
                        Text("Send")
                    }
                }
                .padding()
                
                Divider()
                
//                List {
//                    ForEach(messages) { message in
//                        MessageView(message: message.message)
//                    }
//                    .padding(.trailing, 16)
//                }
                
                ScrollView {
                    VStack(alignment: .trailing, spacing: 16) {
                        ForEach(messages) { message in
                            MessageView(message: message.message)
                        }
                    }
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                }
            }
        }
    }
    
    func sendAction() {
        guard let text = text, !text.isEmpty else {
            return
        }
        let newMessage = Message(message: text)
        messages.insert(newMessage, at: 0)
        self.text = nil
        self.contentHeight = 0
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
