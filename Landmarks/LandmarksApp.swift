//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Joy Banerjee on 03/01/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
