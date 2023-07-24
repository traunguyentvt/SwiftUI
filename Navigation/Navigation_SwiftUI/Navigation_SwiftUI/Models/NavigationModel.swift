//
//  NavigationModel.swift
//  Navigation_SwiftUI
//
//  Created by VT on 7/23/23.
//

import SwiftUI


//Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can't override your methods in order to change your behavior. They need to use your class the way it was written.
final class NavigationModel: ObservableObject {
    
    //@Published is one of the most useful property wrappers in SwiftUI, allowing us to create observable objects that automatically announce when changes occur. SwiftUI will automatically monitor for such changes, and re-invoke the body property of any views that rely on the data.
    @Published var selection: Int = 1
    
    @Published var tab1Detail1IsShown: Bool = false
    @Published var tab1Detail2IsShown: Bool = false
    
    @Published var tab2Detail1IsShown = false
    @Published var tab2Detail2IsShown = false
    
    @Published var goToRootController = false
    
    @Published var data: String = "hand me around" //data shared by multiple views, to hand around
}
