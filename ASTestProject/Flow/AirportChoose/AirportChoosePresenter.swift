//
//  AirportChoosePresenter.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

final class AirportChoosePresenter {
    
    var interactor: AirportChooseInteractorProtocol?
    var viewLayer : AirportChooseViewLayerProtocol?
    var wireframe : AppWireframeProtocol?
}

extension AirportChoosePresenter {
    
    func start() {
        subscriptForViewLayerEvents()
        subscriptForInteractorEvents()
    }
}

private extension AirportChoosePresenter {
    
    func subscriptForViewLayerEvents() {
        viewLayer?.onLoad  = loadData
        viewLayer?.onPlace = routeToPlace
    }
    
    func subscriptForInteractorEvents() {
        interactor?.onPlacesGet = { [weak self] places in
            self?.viewLayer?.setList(places)
        }
    }
}

private extension AirportChoosePresenter {
    
    func loadData() {
        interactor?.getPlaces()
    }
}

private extension AirportChoosePresenter {
    
    func routeToPlace(_ coord: PlaceCoordinatesModel) {
        wireframe?.present(.airRoute, coordinates: coord)
    }
}
