//
//  PlaceCoordinates.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

struct PlaceCoordinatesModel {
    
    var lat: Double
    var lon: Double
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}

extension PlaceCoordinatesModel {
    typealias Handler = ((PlaceCoordinatesModel) -> ())
}
