//
//  Certificate.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import UIKit

struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var width: CGFloat
    var height: CGFloat
    
    static func certificateData() -> [Certificate] {
        [
           Certificate(title: "UI Design", image: "Certificate1", width: 230, height: 150),
           Certificate(title: "SwiftUI", image: "Certificate2", width: 230, height: 150),
           Certificate(title: "Sketch", image: "Certificate3", width: 230, height: 150),
           Certificate(title: "Framer", image: "Certificate4", width: 230, height: 150)
        ]
    }
}
