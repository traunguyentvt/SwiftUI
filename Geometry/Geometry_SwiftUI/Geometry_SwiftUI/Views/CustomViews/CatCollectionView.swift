//
//  CatCollectionView.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/26/23.
//

import SwiftUI

struct CatCollectionView: View {
    
    let cats: [String] = ["cat1", "cat2", "cat3"]
    @State private var selectedCat: String?
    @State private var topmostCat: String?
    @Namespace private var namespace
    
    //ZStack is used to layout a view that overlays its subviews, aligning them in z-axis. ZStack overlays its subviews by aligning each successive subview a higher z-axis value then the one before it. This means that at the end subviews appear on top of each other.
    
    //LazyHStack view is a layout container where items are arranged in a horizontal line (left-to-right), like in a standard HStack view, but it will only create them when needed. This is useful for creating long lists and allow an app to run smoother and faster.
    
    var body: some View {
        ZStack {
            VStack {
                Text("Meet the cats")
                    .font(.title)
                    .blur(radius: selectedCat==nil ? 0:5)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        ForEach(cats, id: \.self) { cat in
                            Image(cat)
                                .resizable()
                                .scaledToFill()
                                .matchedGeometryEffect(id: cat, in: namespace, isSource: cat != selectedCat)
                                .frame(maxWidth: 160, maxHeight: 160)
                                .cornerRadius(20)
                                .onTapGesture {
                                    withAnimation {
                                        if selectedCat == cat {
                                            selectedCat = nil
                                        } else {
                                            selectedCat = cat
                                        }
                                    }
                                }
                                .zIndex(cat==topmostCat ? 1:0)
                                .blur(radius: (cat==topmostCat || selectedCat==nil) ? 0:5)
                        }
                    }
                    .padding()
                }
                .frame(maxHeight: 200)
                
                Spacer()
            }
            
            
        }
        .onChange(of: selectedCat, perform: { value in
            topmostCat = value
        })
    }
}

struct CatCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CatCollectionView()
    }
}
