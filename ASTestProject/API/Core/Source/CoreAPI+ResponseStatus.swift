//
//  CoreAPI+ResponseHandler.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

extension CoreAPI {
    
    enum ResponseStatus {
        case success(ResponseData)
        case error  (Error)
    }
}
