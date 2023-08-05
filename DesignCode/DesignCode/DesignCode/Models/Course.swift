//
//  Course.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import Foundation
import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
    
    static func courseData() -> [Course] {
        [
            Course(title: "Build an app with SwiftUI",
                   image: "Illustration1",
                   color: Color("background3"),
                   shadowColor: Color("backgroundShadow3")),
            Course(title: "Design and animate your UI",
                   image: "Illustration2",
                   color: Color("background4"),
                   shadowColor: Color("backgroundShadow4")),
            Course(title: "Swift UI Advanced",
                   image: "Illustration3",
                   color: Color("background7"),
                   shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
            Course(title: "Framer Playground",
                   image: "Illustration4",
                   color: Color("background8"),
                   shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
            Course(title: "Flutter for Designers",
                   image: "Illustration5",
                   color: Color("background9"),
                   shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5))
        ]
    }
}
