//
//  RouterRenderService.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 04/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation
import MapKit

protocol RouterBuilderServiceProtocol {
    func build(fromCoord: PlaceCoordinatesModel,
                 toCoord: PlaceCoordinatesModel) -> MKGeodesicPolyline
}

final class RouterBuilderService {
}

extension RouterBuilderService: RouterBuilderServiceProtocol {
    
    func build(fromCoord: PlaceCoordinatesModel, toCoord: PlaceCoordinatesModel) -> MKGeodesicPolyline {
        let coordinates = [CLLocationCoordinate2D(latitude: fromCoord.lat, longitude: fromCoord.lon),
                           CLLocationCoordinate2D(latitude: toCoord.lat,   longitude: toCoord.lon)]
        return MKGeodesicPolyline(coordinates: coordinates, count: coordinates.count)
    }
}
