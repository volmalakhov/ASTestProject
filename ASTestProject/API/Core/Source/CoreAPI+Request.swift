//
//  CoreAPI+Request.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

extension URLRequest {
    
    mutating func configurate(_ method: CoreAPI.HTTPMethod) {
        addHeaders(&self)
        addMethod (&self, method)
    }
    
    private func addHeaders(_ request: inout URLRequest) {
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    }
    
    private func addMethod(_ request: inout URLRequest, _ method: CoreAPI.HTTPMethod) {
        request.httpMethod = method.rawValue
    }
}
