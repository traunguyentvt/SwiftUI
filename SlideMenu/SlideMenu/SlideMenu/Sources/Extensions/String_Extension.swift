//
//  String_Extension.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import Foundation
import UIKit

extension String {
    
    var doubleValue: Double {
        return Double(self) ?? 0
    }
    
    var boolValue: Bool {
        let nsStr = NSString(string: self)
        // False when: '0', 'no', 'nO', 'abc123'
        return nsStr.boolValue
    }
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isURL: Bool {
        if let url = URL(string: self) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    var isPhone: Bool {
        let regex = "[+]?[0-9]{8,12}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    var isNumber: Bool {
        if range(of: "^[0-9]+$", options: .regularExpression) == nil{
            return false
        }
        return true
    }
    
    var intValue: Int {
        return Int(self) ?? 0
    }
    
    var stringValue: String {
        return self
    }
    
    var floatValue: Float {
        return Float(self) ?? 0
    }
    
}
