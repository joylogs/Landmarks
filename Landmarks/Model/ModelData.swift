//
//  ModelData.swift
//  Landmarks
//
//  Created by Joy Banerjee on 03/01/24.
//

import Foundation

class ModelData: ObservableObject {

    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks) { landmark in
            landmark.category.rawValue
        }
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could not find \(filename) in main Bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename) from main Bundle with:\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Failed to parse \(filename) as \(T.self): \(error)")
    }
                
}
