//
//  UIExtensions.swift
//  MVVM-Assignment
//
//  Created by Deepak Kumar on 23/07/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import Foundation
import UIKit

let activityIndicator = UIActivityIndicatorView()

extension UIView {
    func dropShadow(UIType: String, cornerRadius: CGFloat = 10, shadowOffset: CGSize = .zero, shadowRadius: CGFloat = 10) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = 0.8
        layer.shouldRasterize = true
    }

    func showActivityIndicator() {
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.color = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}
