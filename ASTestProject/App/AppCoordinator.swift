//
//  AppCoordinator.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

final class AppCoordinator {
    private var wireframe: AppWireframeProtocol?
}

extension AppCoordinator {
    
    func setupAppInstruments() {
        wireframe = AppWireframe(appRouter: AppRouter())
    }
    
    func startAppFlow() {
        wireframe?.present(.airChoose)
    }
}

