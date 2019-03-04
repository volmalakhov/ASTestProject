//
//  AppWireframe.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol AppWireframeProtocol {
    func present(_ frame: Frame)
    func present(_ frame: Frame, coordinates: PlaceCoordinatesModel)
}

final class AppWireframe {
    
    private var appRouter: AppRouterProtocol
    
    init(appRouter: AppRouterProtocol) {
        self.appRouter = appRouter
    }
}

extension AppWireframe: AppWireframeProtocol {
    
    func present(_ frame: Frame) {
        process(frame, coordinates: nil)
    }
    
    func present(_ frame: Frame, coordinates: PlaceCoordinatesModel) {
        process(frame, coordinates: coordinates)
    }
}

private extension AppWireframe {
    
    func process(_ frame: Frame, coordinates: PlaceCoordinatesModel?) {
        let fabric = FrameFabric()
        if frame == .airChoose { fabric.wireframe = self }
        let frameViewRepresent = fabric.make(frame, coord: coordinates)
        route(frame, frameViewRepresent)
    }
}

private extension AppWireframe {
    
    func route(_ frame: Frame, _ viewRepresent: Frame.FrameViewRepresent) {
        switch frame {
        case .airChoose: routeForAirList(viewRepresent)
        case .airRoute : routeForAirRoute(viewRepresent)
        }
    }
    
    func routeForAirList(_ frameViewRepresent: Frame.FrameViewRepresent) {
        appRouter.setRoot(frameViewRepresent)
    }
    
    func routeForAirRoute(_ frameViewRepresent: Frame.FrameViewRepresent ) {
        appRouter.present(frameViewRepresent, animated: true)
    }
}
