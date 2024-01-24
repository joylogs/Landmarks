//
//  Router.swift
//  Landmarks
//
//  Created by Joy Banerjee on 05/01/24.
//

import Foundation

typealias JSON = [String: Any]
typealias T = Codable

enum Encoder {
    case urlEncoding
    case jsonEncoding
    case urlJsonEncoding
}

extension Encoder {
    
    func requestWith(urlRequest: inout URLRequest, urlParams: JSON, bodyParams: JSON) {
        switch self {
        case .urlEncoding:
            URLParameterEncoder().encode(with: &urlRequest, urlParams: urlParams, bodyParams: bodyParams)
        case .jsonEncoding:
            JSONEncoder().encode(with: &urlRequest, urlParams: urlParams, bodyParams: bodyParams)
        case .urlJsonEncoding:
            URLParameterEncoder().encode(with: &urlRequest, urlParams: urlParams, bodyParams: bodyParams)
            JSONEncoder().encode(with: &urlRequest, urlParams: urlParams, bodyParams: bodyParams)
        }
    }
}

protocol Encodable {
    func encode(with urlRequest: inout URLRequest, urlParams: JSON, bodyParams: JSON)
}

struct URLParameterEncoder: Encodable {
    
    func encode(with urlRequest: inout URLRequest, urlParams: JSON, bodyParams: JSON) {
        guard let url = urlRequest.url else { fatalError("URL Parameter Encoder: url is missing") }
        
        let queryItems: [URLQueryItem] = Array(arrayLiteral: URLQueryItem(name: "", value: ""))
    }
}

struct JSONEncoder: Encodable {
    func encode(with urlRequest: inout URLRequest, urlParams: JSON, bodyParams: JSON) {
        
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParams, options: .prettyPrinted)
        }
        catch {
            print("JSON Encoder error: Error in Encoding")
        }
        
    }
}

enum Method {
    case GET
    case POST
}

protocol Task {
    
}

// This is the Main EndPoint to be contacted
protocol EndPointType {
    
    var baseURL: URL { get }
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
        
        guard let url = URL(string: route.path, relativeTo: route.baseURL) else { return nil }
        var request = URLRequest(url: url)
        
        
        func addHeaders(request: inout URLRequest) {
            
            request.addValue("", forHTTPHeaderField: "")
        }
        addHeaders(request: &request)
        
        return request
        
    }
}
