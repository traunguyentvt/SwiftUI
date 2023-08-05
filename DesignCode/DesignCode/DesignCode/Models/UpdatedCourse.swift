//
//  UpdatedCourse.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import Foundation

struct UpdatedCourse: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
    
    static func updatedCourseData() -> [UpdatedCourse] {
        [
            UpdatedCourse(image: "Illustration1", title: "SwiftUI", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 26"),
            UpdatedCourse(image: "Illustration2", title: "Framer X", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 11"),
            UpdatedCourse(image: "Illustration3", title: "CSS Layout", text: "Learn how to combine CSS Grid, Flexbox, animations and responsive design to create a beautiful prototype in CodePen.", date: "MAY 26"),
            UpdatedCourse(image: "Illustration4", title: "React Native Part 2", text: "Learn how to implement gestures, Lottie animations and Firebase login.", date: "MAY 15"),
            UpdatedCourse(image: "Certificate1", title: "Unity", text: "Unity course teaching basics, C#, assets, level design and gameplay", date: "MAR 19"),
            UpdatedCourse(image: "Certificate2", title: "React Native for Designers", text: "Build your own iOS and Android app with custom animations, Redux and API data.", date: "FEB 14"),
            UpdatedCourse(image: "Certificate3", title: "Vue.js", text: "Make a dashboard web-app with a complete login system, dark mode, and animated charts for your data.", date: "JAN 23")
        ]
    }
}
