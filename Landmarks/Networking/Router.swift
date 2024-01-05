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
        
//        let url = URL()
        
        let request = buildRequest(route: route)
        
    }
    
    func buildRequest(route: Any) -> URLRequest {
        
        let url = URL(string: "")
        
        
        
        let request =
        
        
    }
}
