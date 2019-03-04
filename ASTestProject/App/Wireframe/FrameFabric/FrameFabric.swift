//
//  FrameFabric.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import UIKit

final class FrameFabric {
    
    var wireframe: AppWireframeProtocol?
    
    func make(_ frame: Frame, coord: PlaceCoordinatesModel? = nil) -> Frame.FrameViewRepresent {
        switch frame {
        case .airChoose:
            return makeAirChooseFrame()
        case .airRoute:
            return makeAirRouteFrame(coord)
        }
    }
}

private extension FrameFabric {
    
    func makeAirChooseFrame() -> Frame.FrameViewRepresent {
        let viewLayer  = AirportChooseViewLayer()
        let interactor = AirportChooseInteractor()
        let presenter  = AirportChoosePresenter()
        presenter.interactor = interactor
        presenter.wireframe  = wireframe
        presenter.viewLayer  = viewLayer
        presenter.start()
        return viewLayer
    }
    
    func makeAirRouteFrame(_ coord: PlaceCoordinatesModel?) -> Frame.FrameViewRepresent {
        let viewLayer = AirRouteViewLayer()
        let presenter = AirRoutePresenter()
        presenter.viewLayer = viewLayer
        presenter.start(coord)
        return viewLayer
    }
}
