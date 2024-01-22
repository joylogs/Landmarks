//
//  Router.swift
//  Landmarks
//
//  Created by Joy Banerjee on 05/01/24.
//

import Foundation

typealias T = Codable

enum Encoding {
    case urlEncoding
    case jsonEncoding
    case urlJsonEncoding
}

enum Method {
    case GET
    case POST
}

protocol Task {
    
}

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    
    var type: Task { get }
    var method: Method { get }
}

protocol RouterProtocol {
    
    associatedtype EndPoint = EndPointType
    func request(route: EndPoint, completion: @escaping (T) -> ())
}

struct Router: RouterProtocol {
    
    func request(route: EndPoint, completion: @escaping (T) -> ()) {
        if let urlRequest = buildRequest(route: route) {
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let landmarkMap = try jsonDecoder.decode(Landmark.self, from: data)
                        completion(landmarkMap)
                    }
                    catch {
                        print("Unable to decode Landmark Map ", error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func buildRequest(route: EndPoint) -> URLRequest? {
        
        guard let url = route.baseURL else { return nil }
        
        let url = URL(string: "", relativeTo: url)!
        let request = URLRequest(url: url)
        
        return request
        
    }
}
