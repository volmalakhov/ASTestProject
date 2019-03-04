//
//  AviasalesInterfaceAPI.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol PlaceInterfaceAPIProtocol {
    func fetchPlaces(handler: @escaping CoreAPI.ResponseHandler)
}

final class PlaceInterfaceAPI {}

extension PlaceInterfaceAPI: PlaceInterfaceAPIProtocol {
    
    func fetchPlaces(handler: @escaping CoreAPI.ResponseHandler) {
        let mockEndPoint = "http://places.aviasales.ru/places?term=paris&locale=ru"
        CoreAPI().executeRequest(interfaceEndPoint: mockEndPoint,
                                           handler: handler)
    }
}
