//
//  CoreAPI.swift
//  ASTestProject
//
//  Created by Vladimir Malakhov on 03/03/2019.
//  Copyright © 2019 Vladimir Malakhov. All rights reserved.
//

import Foundation

final class CoreAPI {}

extension CoreAPI {
    
    func executeRequest(interfaceEndPoint: String,
                                   method: HTTPMethod = .GET,
                                  handler: @escaping CoreAPI.ResponseHandler) {
        guard let url = buildURL(interfaceEndPoint),
            let request = buildRequest(url, method) else {
                print("CoreAPI: Error = Unable to build request")
                return
        }
        dataResult(with: request, handler: handler)
    }
}

private extension CoreAPI {
    
    func buildURL(_ endPoint: String) -> URL? {
        return URL(string: endPoint)
    }
    
    func buildRequest(_ url: URL,
                   _ method: HTTPMethod = .GET) -> URLRequest? {
        var request = URLRequest(url: url)
        request.configurate(method)
        return request
    }
}

private extension CoreAPI {
    
    func dataResult(with request: URLRequest, handler: @escaping CoreAPI.ResponseHandler) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                  let jsonSerializationData = try? JSONSerialization.jsonObject(with: data, options: []),
                  let responseData = jsonSerializationData as? CoreAPI.ResponseData else {
                    // some error handler + validate for http status code
                return
            }
            handler(.success(responseData))
        }.resume()
    }
}
