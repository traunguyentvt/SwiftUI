//
//  DragDirection.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import SwiftUI

enum DragDirection {
    case left
    case right
    case up
    case down
}

extension DragGesture.Value {

    var dragDirection: DragDirection {
        if startLocation.x > location.x {
            return DragDirection.left
        } else if startLocation.x < location.x {
            return DragDirection.right
        } else if startLocation.y < location.y {
            return DragDirection.up
        } else {
            return DragDirection.down
        }
    }
    
}
