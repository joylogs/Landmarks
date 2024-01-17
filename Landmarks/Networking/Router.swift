//
//  Router.swift
//  Landmarks
//
//  Created by Joy Banerjee on 05/01/24.
//

import Foundation

protocol RouterProtocol {
    
    func request(route: Any, completion: @escaping () -> ())
}

struct Router: RouterProtocol {
    
    func request(route: Any, completion: @escaping () -> ()) {
        let urlRequest = buildRequest(route: route)
        
        let urlSessionDataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            
            
        }
        urlSessionDataTask.resume()
        
    }
    
    func buildRequest(route: Any) -> URLRequest {
        
        let url = URL(string: "", relativeTo: URL(string: "")!)!
        let request = URLRequest(url: url)
        
        return request
        
    }
}
