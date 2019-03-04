//
//  AirportChooseViewLayer.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import UIKit

protocol AirportChooseViewLayerProtocol {
    
    var onLoad : DefaultHandler? { get set }
    var onPlace: PlaceCoordinatesModel.Handler? { get set }
    
    func setList(_ places: [PlaceModel]?)
}

final class AirportChooseViewLayer: ViewLayer {
    
    var onLoad : DefaultHandler?
    var onPlace: PlaceCoordinatesModel.Handler?
    
    private let acView = AirportChooseView()
    
    override func loadView() {
        super.loadView()
        view = acView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onLoad?()
        subscriptForViewEvents()
    }
}

extension AirportChooseViewLayer: AirportChooseViewLayerProtocol {
    
    func setList(_ places: [PlaceModel]?) {
        guard let places = places else {
            // handle for empty. not valide result
            return
        }
        acView.placeList.append(places)
        acView.placeList.update()
    }
}

private extension AirportChooseViewLayer {
    
    func subscriptForViewEvents() {
        acView.placeList.onPlaceSelected = { [weak self] placeCoord in
            self?.onPlace?(placeCoord)
        }
    }
}
