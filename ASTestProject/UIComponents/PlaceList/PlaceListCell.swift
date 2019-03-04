//
//  PlaceListCell.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 04/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import UIKit

final class PlaceListCell: UITableViewCell {
    
    override var reuseIdentifier: String {
        get {
            return "PlaceListCellReuseIdentifier"
        }
    }
}

extension PlaceListCell {
    
    func setData(_ model: PlaceModel) {
        textLabel?.text = "\(model.title) \(model.code ?? "")"
    }
}
