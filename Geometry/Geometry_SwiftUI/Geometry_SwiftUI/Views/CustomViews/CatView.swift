//
//  CatView.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/26/23.
//

import SwiftUI

struct CatView: View {
    
    let namespace: Namespace.ID
    @Binding var selectedCat: String?
    let cornerRadius: CGFloat = 20
    
    var body: some View {
        if selectedCat == nil {
            EmptyView()
        } else {
            VStack {
                Image(selectedCat!)
                    .resizable()
                    .scaledToFit()
                    .animation(nil)
                    .matchedGeometryEffect(id: selectedCat!, in: namespace, properties: .frame, anchor: .center, isSource: selectedCat != nil)
                
                Text("The @ObservedObject property wrapper will automatically make sure the property is watched closely so that important changes will reload any views using it. This also means the data must be created elsewhere, then sent in to your view.")
                    .font(.footnote)
                    .padding()
            }
            .cornerRadius(cornerRadius)
            .background(Color(.systemBackground)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: 10))
            .padding()
            .onTapGesture {
                withAnimation {
                    selectedCat = nil
                }
            }
        }
    }
}

struct CatView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CatView(namespace: namespace, selectedCat: .constant("cat2"))
    }
}
