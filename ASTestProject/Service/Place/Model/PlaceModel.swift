//
//  PlaceModel.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

struct PlaceModel {
    
    var title: String
    var coordinates: PlaceCoordinatesModel
    
    var code: String?
    
    init(_ title: String, _ coord: PlaceCoordinatesModel) {
        self.title       = title
        self.coordinates = coord
    }
}
