//
//  Int_Extension.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation

extension Int {
    var boolValue: Bool {
        return self == 1 ? true : false
    }

    var doubleValue: Double {
        return Double(self)
    }
    
    var floatValue: Float {
        return Float(self)
    }
    
    var intValue: Int {
        return self
    }
    
    var stringValue: String {
        return "\(self)"
    }
}
