//
//  PlaceDataWorker.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

final class PlaceDataWorker {
    
    static func work(_ data: CoreAPI.ResponseData) -> [PlaceModel]? {
        var placeContainer = [PlaceModel]()
        data.forEach { (dataObject) in
            if let model = parseForPlaceObject(dataObject) {
                placeContainer.append(model)
            }
        }
        return placeContainer
    }
}

private extension PlaceDataWorker {
    
    static func parseForPlaceObject(_ data: [String: Any]) -> PlaceModel? {
        guard let name = data["name"] as? String,
              let coordinates = data["coordinates"] as? [Double], coordinates.count == 2 else {
            return nil
        }
        var model  = PlaceModel(name, PlaceCoordinatesModel(lat: coordinates[0], lon: coordinates[1]))
        model.code = data["iata"] as? String
        return model
    }
}
