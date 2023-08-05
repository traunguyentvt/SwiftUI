//
//  UpdateList.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct UpdateList: View {
    
    //both of them work (@ObservedObject, @Stateobject)
    @ObservedObject var store = UpdateStore()
//    @StateObject var store = UpdateStore()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updateList) { item in
                    NavigationLink(destination: UpdateDetail(course: item)) {
                        HStack(spacing: 12) {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .background(Color("background"))
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                
                                Text(item.text)
                                    .lineLimit(2)
                                    .lineSpacing(2)
                                    .font(.subheadline)
                                    .frame(height: 50)
                                
                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
                .onDelete { index in
                    store.updateList.remove(at: index.first!)
                }
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addCourse) { Text("Add Update") }, trailing: EditButton())
        }
    }
    
    func addCourse() {
        store.updateList.append(UpdatedCourse(image: "Certificate1", title: "New Title", text: "New Text", date: "Jul 4"))
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.updateList.swapAt(source.first!, destination)
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
