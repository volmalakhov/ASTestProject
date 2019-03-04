//
//  PlaceService.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol PlaceServiceProtocol {
    func get(_ places: @escaping PlaceService.Handler)
}

final class PlaceService {
    private let interface = PlaceInterfaceAPI()
}

extension PlaceService: PlaceServiceProtocol {
    
    func get(_ places: @escaping PlaceService.Handler) {
        interface.fetchPlaces { (response) in
            switch response {
            case .success(let responseData):
                places(PlaceDataWorker.work(responseData))
            case .error(let error):
                print("PlaceService: Error = \(error) unable to fetch places")
                places(nil)
            }
        }
    }
}

