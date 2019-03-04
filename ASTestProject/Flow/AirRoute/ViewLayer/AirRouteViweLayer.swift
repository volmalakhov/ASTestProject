//
//  AirRouteViweLayer.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 04/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import UIKit
import MapKit

protocol AirRouteViewLayerProtocol {
    
    func appendRouteLine(_ route: MKGeodesicPolyline)
    func appendPlaneView(_ annotation: MKPointAnnotation)
    func transformPlaneView(with direction: Double)
}

final class AirRouteViewLayer: ViewLayer {
    
    private let mapView = MKMapView()
    private var planeView: MKAnnotationView?
    
    override func loadView() {
        super.loadView()
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
}

extension AirRouteViewLayer: AirRouteViewLayerProtocol {
    
    func appendRouteLine(_ route: MKGeodesicPolyline) {
        mapView.addOverlay(route)
    }
    
    func appendPlaneView(_ annotation: MKPointAnnotation) {
        mapView.addAnnotation(annotation)
    }
    
    func transformPlaneView(with direction: Double) {
        planeView?.transform = CGAffineTransform(rotationAngle: CGFloat(direction))
    }
}

extension AirRouteViewLayer: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else {
            return MKOverlayRenderer()
        }
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.lineWidth = 2.0
        renderer.alpha = 0.75
        renderer.strokeColor = UIColor.blue
        
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let planeIdentifier = PlaneRender.identifier
        
        planeView = mapView.dequeueReusableAnnotationView(withIdentifier: planeIdentifier)
            ?? MKAnnotationView(annotation: annotation, reuseIdentifier: planeIdentifier)
        planeView?.image = UIImage(named: "plane")
        
        return planeView
    }
}
