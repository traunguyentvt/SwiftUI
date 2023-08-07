//
//  MainView.swift
//  Weather
//
//  Created by VT on 8/6/23.
//

import SwiftUI

struct MainView: View {
    
    @State var inputString: String = ""
    @State var showingDayList: Bool = false
    
    //ZStack is used to layout a view that overlays its subviews, aligning them in z-axis. ZStack overlays its subviews by assigning each successive subview a higher z-axis value than the one before it. This means that at the end subviews appear on top of each other.
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.topColor, .centerColor, .bottomColor]), startPoint: .topLeading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 140) {
                Text("Weather")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                
                HStack {
                    TextField("What is the weather in Dallas?", text: $inputString)
                        .frame(width: UIScreen.main.bounds.width - 95, height: 40, alignment: .center)
                        .fixedSize()
                        .background(Color.white)
                        .multilineTextAlignment(.center)
//                        .cornerRadius(10)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Button {
                        showingDayList.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
//                    .frame(width: 50)
                }
                .padding(15)
                
                Spacer()
            }
            .padding(.top, 150)
        }
        .sheet(isPresented: $showingDayList) {
            DayListView(inputString: inputString)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
