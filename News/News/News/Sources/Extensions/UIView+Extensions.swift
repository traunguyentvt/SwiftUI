//
//  UIView+Extensions.swift
//  News
//
//  Created by VT on 8/14/23.
//

import UIKit

extension UIView {
    func allSubviews() -> [UIView] {
        var subViews = self.subviews
        for subView in self.subviews {
            let childSubView = subView.subviews
            subViews.append(contentsOf: childSubView)
        }
        return subViews
    }
}
