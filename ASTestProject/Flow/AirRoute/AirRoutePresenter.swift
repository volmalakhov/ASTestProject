//
//  AirRoutePresenter.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 04/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation
import MapKit

final class AirRoutePresenter {
    
    var viewLayer: AirRouteViewLayerProtocol?
    
    private let routeBuilder = RouterBuilderService()
        as RouterBuilderServiceProtocol
    private let locationManager = LocationManager()
        as LocationManagerProtocol
    private var planeRender: PlaneRenderProtocol?
}

extension AirRoutePresenter {
    
    func start(_ coord: PlaceCoordinatesModel?) {
        guard let routeLine  = buildRoute(coord),
              let annotation = buildAnnotation(for: routeLine) else {
            print("AirRoutePresenter: Unable to build start params for flight render")
            return
        }
        viewLayer?.appendRouteLine(routeLine)
        viewLayer?.appendPlaneView(annotation)
        renderFlight()
    }
}

private extension AirRoutePresenter {
    
    func buildRoute(_ coord: PlaceCoordinatesModel?) -> MKGeodesicPolyline? {
        guard let destinationCoord = coord,
              let departureСoord = locationManager.fetchCurrentLocation() else {
                return nil
        }
        return routeBuilder.build(fromCoord: departureСoord, toCoord: destinationCoord)
    }
    
    func buildAnnotation(for routeLine: MKGeodesicPolyline) -> MKPointAnnotation? {
        planeRender = PlaneRender(routeLine)
        return planeRender?.getAnnotation()
    }
}

private extension AirRoutePresenter {
    
    func renderFlight() {
        planeRender?.updatePosition()
        planeRender?.onUpadteDirection = { directionToTransform in
            guard let direction = directionToTransform else { return }
            self.viewLayer?.transformPlaneView(with: direction)
        }
    }
}
