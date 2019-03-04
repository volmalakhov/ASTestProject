//
//  AirportChooseInteractor.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol AirportChooseInteractorProtocol {
    func getPlaces()
    var onPlacesGet: PlaceService.Handler? { get set }
}

final class AirportChooseInteractor {
    var onPlacesGet: PlaceService.Handler?
}

extension AirportChooseInteractor: AirportChooseInteractorProtocol {
    
    func getPlaces() {
        DispatchQueue.global(qos: .userInteractive).async {
            PlaceService().get({ (places) in
                DispatchQueue.main.async {
                    self.onPlacesGet?(places)
                }
            })
        }
    }
}

