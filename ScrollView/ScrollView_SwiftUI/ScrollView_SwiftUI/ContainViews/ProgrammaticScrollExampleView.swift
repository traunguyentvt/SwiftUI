//
//  ProgrammaticScrollExampleView.swift
//  ScrollView_SwiftUI
//
//  Created by VT on 7/21/23.
//

import Foundation
import SwiftUI

struct ProgrammaticScrollExampleView: View {
    let inspirations = Inspiration.createInspirations()
    
    @Namespace var topID
    @Namespace var bottomID
    
    @State private var selectedInspirationID: UUID?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Scroll to bottom") {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                }
                .buttonStyle(.bordered)
                .id(topID)
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(inspirations) { inspiration in
                        InspirationRowView(inspiration: inspiration)
                            .foregroundColor(foregroundColor(for: inspiration))
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(color(for: inspiration))
                            )
                            .id(inspiration.id)
                            .onTapGesture {
                                tapped(on: inspiration)
                            }
                        
                        Divider()
                    }
                }
                .padding()
                
                if selectedInspirationID != nil {
                    VStack {
                        Button("Scroll to top") {
                            withAnimation {
                                proxy.scrollTo(selectedInspirationID, anchor: .top)
                            }
                        }
                        
                        Button("Scroll to center") {
                            withAnimation {
                                proxy.scrollTo(selectedInspirationID, anchor: .center)
                            }
                        }
                        
                        Button("Scroll to bottom") {
                            withAnimation {
                                proxy.scrollTo(selectedInspirationID, anchor: .bottom)
                            }
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical)
                }
                
                Button("Scroll to top") {
                    withAnimation {
                        proxy.scrollTo(topID)
                    }
                }
                .buttonStyle(.bordered)
                .id(bottomID)
                
            }
        }
//        .overlay {
//            Rectangle().stroke(.pink, lineWidth: 2)
//            Rectangle().stroke(.pink, lineWidth: 2)
//        }
    }
    
    private func color(for inspiration: Inspiration) -> Color {
        inspiration.id == selectedInspirationID ? .gray : .clear
    }
    
    private func foregroundColor(for inspiration: Inspiration) -> Color {
        inspiration.id == selectedInspirationID ? .white : .black
    }
    
    private func tapped(on inspiration: Inspiration) {
        if inspiration.id == selectedInspirationID {
            selectedInspirationID = nil
        } else {
            selectedInspirationID = inspiration.id
        }
    }
}


struct ProgrammaticScrollExampleView_Preview: PreviewProvider {
    static var previews: some View {
        ProgrammaticScrollExampleView()
        
        NavigationView(content: {
            ProgrammaticScrollExampleView()
                .navigationTitle("NavigationView")
        })
    }
}
