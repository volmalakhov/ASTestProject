//
//  AirportChooseView.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import UIKit

final class AirportChooseView: UIView {
    
    let placeList = PlaceListView()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        placeList.frame = frame
    }
}

private extension AirportChooseView {
    
    func setupView() {
        addSubviews()
        applyLayout()
    }
    
    func addSubviews() {
        addSubview(placeList)
    }
    
    func applyLayout() {
        placeList.frame = frame
    }
}
