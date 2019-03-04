//
//  LocationManager.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 04/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerProtocol {
    func fetchCurrentLocation() -> PlaceCoordinatesModel?
}

final class LocationManager {
    
    private var locManager = CLLocationManager()
    
    init() {
        locManager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: LocationManagerProtocol {
    
    func fetchCurrentLocation() -> PlaceCoordinatesModel? {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            guard let loc = locManager.location else { return nil }
            return PlaceCoordinatesModel(lat: loc.coordinate.latitude, lon: loc.coordinate.longitude)
        } else {
            return nil
        }
    }
}
