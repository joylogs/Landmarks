//
//  Router.swift
//  Landmarks
//
//  Created by Joy Banerjee on 05/01/24.
//

import Foundation

protocol EndPointType {
    var baseURL: String { get }
    
}

protocol RouterProtocol {
    
    associatedtype EndPoint = EndPointType
    func request(route: EndPoint, completion: @escaping () -> ())
}

struct Router: RouterProtocol {
    
    func request(route: EndPoint, completion: @escaping () -> ()) {
        if let urlRequest = buildRequest(route: route) {
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let model = jsonDecoder.decode(Codable.self, from: data)
                    
                    
                }
            }
            dataTask.resume()
        }
    }
    
    func buildRequest(route: EndPoint) -> URLRequest? {
        
//        guard let url = route.baseURL else { return nil }
        
        let url = URL(string: "", relativeTo: URL(string: "")!)!
        let request = URLRequest(url: url)
        
        return request
        
    }
}
