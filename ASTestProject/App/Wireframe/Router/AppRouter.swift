//
//  AppRouter.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import UIKit

protocol AppRouterProtocol {
    func setRoot(_ controller: UIViewController)
    func present(_ controller: UIViewController, animated: Bool)
}

final class AppRouter {
    private var mainWindow: UIWindow
    
    init() {
        mainWindow = UIWindow(frame: UIScreen.main.bounds)
        mainWindow.makeKeyAndVisible()
    }
}

extension AppRouter: AppRouterProtocol {
    
    func setRoot(_ controller: UIViewController) {
        mainWindow.rootViewController = controller
    }
    
    func present(_ controller: UIViewController, animated: Bool) {
        mainWindow.rootViewController?.present(controller, animated: animated, completion: nil)
    }
}
