//
//  PlaneRender.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 04/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation
import MapKit

protocol PlaneRenderProtocol {
    
    func updatePosition()
    func getAnnotation() -> MKPointAnnotation?
    
    var onUpadteDirection: ((Double?) -> ())? { get set }
}

final class PlaneRender {
    
    var onUpadteDirection: ((Double?) -> ())?
    static var identifier = "Plane"
    
    private var currenPosition = 0
    private var annotation: MKPointAnnotation?
    private var direction : CLLocationDirection?
    private let polyline  : MKGeodesicPolyline
    
    init(_ polyline: MKGeodesicPolyline) {
        self.polyline = polyline
        makeAnnotation()
    }
}

extension PlaneRender: PlaneRenderProtocol {
    
    func updatePosition() {
        let step = 2
        guard currenPosition + step < polyline.pointCount else {
            print("---End of the route---")
            return
        }
        
        let points = countLinePoints(for: step)
        let prevMapPoint = points.0
        let nextMapPoint = points.1
        
        setCurrentCoord(nextMapPoint)
        countDirection (nextMapPoint, prevMapPoint)
        
        let timeForStep = 0.03
        nextRouteStep(for: timeForStep)
    }
        
    func getAnnotation() -> MKPointAnnotation? {
        return annotation
    }
}

private extension PlaneRender {
    
    func makeAnnotation() {
        annotation = MKPointAnnotation()
        annotation?.title = NSLocalizedString(PlaneRender.identifier, comment: "Plane marker")
    }
}

private extension PlaneRender {
    
    func countLinePoints(for step: Int) -> (MKMapPoint, MKMapPoint) {
        let points = polyline.points()
        let previousMapPoint = points[currenPosition]
        currenPosition += step
        let nextMapPoint = points[currenPosition]
        return (previousMapPoint, nextMapPoint)
    }
    
    func setCurrentCoord(_ point: MKMapPoint) {
        annotation?.coordinate = point.coordinate
    }
    
    func countDirection(_ nextPoint: MKMapPoint, _ prevPoint: MKMapPoint) {
        direction = directionBetweenPoints(sourcePoint: prevPoint, nextPoint)
        guard let dir = direction else {
            return
        }
        onUpadteDirection?(degreesToRadians(degrees: dir))
    }
    
    func nextRouteStep(for lockTime: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + lockTime) {
            self.updatePosition()
        }
    }
}

private extension PlaneRender {
    
    func directionBetweenPoints(sourcePoint: MKMapPoint, _ destinationPoint: MKMapPoint) -> CLLocationDirection {
        return radiansToDegrees(radians: atan2(destinationPoint.y - sourcePoint.y,
                                               destinationPoint.x - sourcePoint.x))
            .truncatingRemainder(dividingBy: 360)
    }
    
    func radiansToDegrees(radians: Double) -> Double {
        return radians * 180 / .pi
    }
    
    func degreesToRadians(degrees: Double) -> Double {
        return degrees * .pi / 180
    }
}


