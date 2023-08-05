//
//  MenuView.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct MenuView: View {
    
    var menus: [Menu] = Menu.MenuData()
    @Binding var show: Bool
    @State var showSettings = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(menus) { menu in
                    if menu.title == "Settings" {
                        Button(action: {
                            showSettings.toggle()
                        }) {
                            MenuRow(menu: menu)
                                .sheet(isPresented: $showSettings) {
                                    Settings()
                                }
                        }
                    } else {
                        MenuRow(menu: menu)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10, z: 0))
            .animation(.default)
            .offset(x: show ? 0 : -mainSize.width)
            .onTapGesture {
                show.toggle()
            }
            
            Spacer()
        }
        .padding(.top, statusBarHeight)
    }
}

struct MenuView_Previews: PreviewProvider {
    @State static var show = false
    static var previews: some View {
        MenuView(show: $show)
    }
}
