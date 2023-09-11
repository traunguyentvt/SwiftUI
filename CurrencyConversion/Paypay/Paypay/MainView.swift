//
//  MainView.swift
//  PayPayCoding
//
//  Created by Shujat Ali on 29/07/2023.
//

import SwiftUI

struct MainView: View {
    
    let placeholder = "Select Currency"
    @ObservedObject var viewModel = CurrencyViewVM()
    
    let columns = [
        GridItem(.flexible(minimum: 40), spacing: 0),
        GridItem(.flexible(minimum: 40), spacing: 0),
        GridItem(.flexible(minimum: 40), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    viewModel.initCommon()
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                }

            }
            
            
            TextField("1", text: $viewModel.inputCCy)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Menu {
                ForEach(viewModel.currencies, id: \.self) { item in
                    Button(item.display) {
                        viewModel.selectedCCY = item
                        viewModel.applyFilter(item.ccy)
                    }
                }
            } label: {
                VStack(spacing: 5){
                    HStack{
                        Text(viewModel.selectedCCY.display)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.orange)
                            .font(Font.system(size: 20, weight: .bold))
                    }
                    .padding(.horizontal)
                    Rectangle()
                        .fill(Color.orange)
                        .frame(height: 2)
                }
            }

            switch viewModel.state {
            case .loading:
                Spacer()
                ProgressView("Loading")
                
            case .empty:
                Spacer()
                Text("There is no data!")
                    .font(.title)
                    .foregroundColor(.red)
                
            case .ready:
                Spacer()
                Text("Home View!")
                    .font(.title)
                    .foregroundColor(.cyan)
                
            case .finished:
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.filterRates, id: \.self) { item in
                            Text(item.display)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.horizontal)
                }
                
            case .error(error: let error):
                Spacer()
                Text("Error: \(error)")
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            
        }.padding(.all, 20)
        .onAppear {
                viewModel.initCommon()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
