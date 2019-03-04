//
//  Extension+UIView.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 04/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import UIKit

extension UIView {
    func addArrayOfSubviews(_ subviews: [UIView]) {
        subviews.forEach { (subview) in addSubview(subview) }
    }
}
