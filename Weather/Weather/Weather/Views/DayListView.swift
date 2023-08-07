//
//  DayListView.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import SwiftUI

struct DayListView: View {
    
    var inputString: String
    @ObservedObject var viewModel = DayListViewModel()
    
    init(inputString: String = "") {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 40/255, green: 30/255, blue: 90/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        UITableView.appearance().backgroundColor = .clear
        
        self.inputString = inputString
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.topColor, .centerColor, .bottomColor]), startPoint: .topLeading, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ForEach(viewModel.data) { item in
                        NavigationLink(destination: DetailView()) {
                            DayInfoRow(model: item)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .navigationBarTitle(Text(!inputString.isEmpty ? inputString : "Weather"), displayMode: .inline)
            }
        }
        .onAppear {
            
        }
    }
}

struct DayListView_Previews: PreviewProvider {
    static var previews: some View {
        DayListView()
    }
}
