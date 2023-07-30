//
//  FoodCustomCellView.swift
//  ListView_SwiftUI
//
//  Created by VT on 7/30/23.
//

import SwiftUI

struct FoodCustomCellView: View {
    
    @State private var foods: [Food] = Food.createExamples()
    @State private var unhealthyFoods: [Food] = [Food(name: "Pizza", image: "🍕", isFavorite: false),
                                                 Food(name: "Burger", image: "🍔",isFavorite: false)]
    @State private var vtFoods: [Food] = Food.createFoods()
    
    var body: some View {
        List {
            Section {
                ForEach(foods) { food in
                    FoodRow(food: food)
                        .listRowSeparatorTint(food.color)
                        .listRowBackground(Color.yellow)
                }
            } header: {
                Text("Favorites")
            } footer: {
                Text("I love JV")
            }
            .headerProminence(.increased)
            .foregroundColor(.purple)
            .font(.body)
            
            Section {
                ForEach(unhealthyFoods) { food in
                    FoodRow(food: food)
                }
//                .listItemTint(.pink)
                .foregroundColor(.blue)
                .listRowBackground (
                    Capsule()
                        .fill(Color.gray)
                        .padding(5)
                )
            } header: {
                Text("Loved")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .textCase(.uppercase)
            } footer: {
                Text("LoveLoveLove")
                    .font(.body)
            }
//            .listRowInsets(EdgeInsets.init(top: 20, leading: 50, bottom: 20, trailing: 50))
            .listRowSeparatorTint(.green, edges: .all)
            
            Section {
                ForEach(vtFoods) { food in
                    FoodRow(food: food)
                }
                .listRowInsets(EdgeInsets.init(top: 0, leading: 40, bottom: 0, trailing: 40))
                .listRowSeparatorTint(.pink, edges: .top)
                .listRowSeparator(.hidden)
            } header: {
                HStack {
                    Text("Forever")
                    Spacer()
                    Button {
                        let nfood = Food(name: "JV", image: "🍔", isFavorite: true)
                        withAnimation {
                            vtFoods.append(nfood)
                        }
                    } label: {
                        Label("", systemImage: "plus.circle.fill")
                    }
                }
                .foregroundColor(.blue)
            } footer: {
                Text("Never forget")
                    .font(.body)
                    .bold()
            }
            .listSectionSeparatorTint(.blue)
            .listSectionSeparator(.hidden)
            
            Button {
                let nfood = Food(name: "JV", image: "🍔", isFavorite: true)
                withAnimation {
                    foods.append(nfood)
                }
            } label: {
                Label("VT", systemImage: "plus")
                    .font(.title)
            }
        }
        .listStyle(.plain)
//        .scrollContentBackground(.hidden)
        .background(Color.yellow.edgesIgnoringSafeArea(.all))
    }
}

struct FoodCustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCustomCellView()
    }
}
