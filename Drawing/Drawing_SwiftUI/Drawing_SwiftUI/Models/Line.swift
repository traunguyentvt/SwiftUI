//
//  Line.swift
//  Drawing_SwiftUI
//
//  Created by VT on 7/24/23.
//

import SwiftUI

struct Line: Identifiable {
    var points: [CGPoint]
    var lineWidth: CGFloat
    var color: Color
    let id = UUID()
}
