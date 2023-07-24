//
//  NewYearMessageView.swift
//  ObservedObject_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI

struct NewYearMessageView: View {
    
    //The @ObservedObject property wrapper will automatically make sure the property is watched closely so that important changes will reload any views using it. This also means the data must be created elsewhere, then sent in to your view.
    @ObservedObject var messenger = MessengerManager()
    
    var body: some View {
        VStack {
            Text("Send a message to your friends")
                .font(.title)
                .padding()
            
            HStack {
                TextField("Message", text: $messenger.message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    messenger.clear()
                }, label: {
                    Image(systemName: "plus.circle")
                })
            }
            .padding()
            
            EmojiCollectionView(messenger: messenger)
        }
        .padding()
    }
}

struct NewYearMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewYearMessageView()
    }
}
